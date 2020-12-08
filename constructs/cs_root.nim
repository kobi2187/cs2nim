import ../types, uuids, options
import cs_namespace, cs_class, cs_method, cs_returnstatement
import sets, tables, sequtils

import ../vnode #deprecate later.
import ../construct
import ../info_center
type CsRoot* = object
  global*: CsNamespace
  ns*: HashSet[CsNamespace]
  # ns*: seq[CsNamespace]
  nsTables*: TableRef[string, CsNamespace]
  # quickFetchBodyExpr*: TableRef[UUID, CsObject]
  # quickFetchMethod*: TableRef[UUID, CsMethod]
  # quickFetchClass*: TableRef[UUID, CsClass]
  infoCenter*: InfoCenter
  quickFetch*: TableRef[UUID, Variant]
  regList*: seq[UUID]

proc register*(r: var CsRoot; id: UUID; obj: Construct) =
  r.infoCenter.register(id, obj)

proc fetch*(r: var CsRoot; id: UUID): Option[Construct] =
  result = r.infoCenter.fetch(id)

# proc fetch*(r: var CsRoot; id: UUID): Variant =
#   result = r.quickFetch[id]

# proc fetchMethod*(r: var CsRoot; id: UUID): CsMethod =
#   result = r.quickFetchMethod[id]
# proc fetchClass*(r: var CsRoot; id: UUID): CsClass =
#   result = r.quickFetchClass[id]
# proc fetchBody*(r: var CsRoot; id: UUID): CsObject =
#   result = r.quickFetchBodyExpr[id]

import strutils
proc `$`*(r: CsRoot): string =
  result = "I am the CsRoot object:\n"
  if not r.global.isNil:
    result &= "global is set\n"
  result &= "ns count: " & $r.ns.len
  result &= "\n" & r.ns.mapIt(it.name).join(" ")

proc newCs*(t: typedesc[CsRoot]): CsRoot =
  result.ns = initHashSet[CsNamespace]()
  result.nsTables = newTable[string, CsNamespace]()
  # result.quickFetchBodyExpr = newTable[UUID, CsObject]()
  # result.quickFetchMethod = newTable[UUID, CsMethod]()
  # result.quickFetchClass = newTable[UUID, CsClass]()
  result.quickFetch = newTable[UUID, Variant]()

  let defaultNs = newCs(CsNamespace, "default")
  result.global = defaultNs
  result.nsTables["default"] = defaultNs
import ../state

proc register(r: var CsRoot; c: Variant) =
  r.quickFetch[c.id] = c
  r.regList.add c.id
  # if c is CsClass:
  #   r.quickFetchClass[c.id.get] = c
  # elif c is CsMethod:
  #   r.quickFetchMethod[c.id.get] = c
  # elif c is BodyExpr:
  #   r.quickFetchBodyExpr[c.id.get] = c
  # else: assert false, "unsupported"

var currentRoot*: CsRoot
proc register(c: Variant) =
  var r = currentRoot
  r.register(c)

proc makeModule*(ns: CsNamespace): Module =
  var name: string
  if ns.parent.len > 0:
    name = ns.parent & "." & ns.name
  else:
    name = ns.name
  let output = ns.gen() & "\n\n"
  result = Module(name: name, output: output)

proc gen*(r: CsRoot): seq[Module] =
  if not r.global.isNil:
    result.add makeModule(r.global)

  for n in r.ns:
    echo "in gen(): ns is: " & $n.name
    assert r.nsTables.hasKey(n.name), n.name & "is missing"
    result.add makeModule(n)



proc add*(root: var CsRoot; csn: CsNamespace) =
  var name: string
  if csn.parent != "":
    name = csn.parent & "." & csn.name
    csn.parent = ""
    csn.name = name
  else: name = csn.name

  let nsnames = root.ns.mapIt(it.name)
  if not (csn.name in nsnames):
    root.ns.incl(csn)

  echo root.ns.toSeq.mapIt(it.name)
  # assert false
  # root.ns.add(csn)
  root.nsTables[name] = csn

