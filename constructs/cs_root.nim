import cs_all_constructs, justtypes, ../info_center, ../types, ../construct

import sets, sequtils, tables, uuids, options#, strutils
# ============= CsRoot ========

type CsRoot* = object
  global*: CsNamespace
  infoCenter*: InfoCenter
  ns*: HashSet[CsNamespace]
  nsTables*: TableRef[string, CsNamespace]

  # ns*: seq[CsNamespace]
  # quickFetchBodyExpr*: TableRef[UUID, CsObject]
  # quickFetchMethod*: TableRef[UUID, CsMethod]
  # quickFetchClass*: TableRef[UUID, CsClass]
  # quickFetch*: TableRef[UUID, Variant]
  # quickFetch2*: TableRef[UUID, CsObject]
  # regList*: seq[UUID]


proc register*(r: var CsRoot; id: UUID; obj: Construct) =
  assert not id.isZero
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

proc `$`*(r: CsRoot): string =
  result = "root: ("
  if not r.global.isNil:
    result &= $r.global
  for n in r.ns:
    result &= $n
  result &= ")"

proc newCs*(t: typedesc[CsRoot]): CsRoot =
  result.ns = initHashSet[CsNamespace]()
  result.nsTables = newTable[string, CsNamespace]()
  # result.quickFetchBodyExpr = newTable[UUID, CsObject]()
  # result.quickFetchMethod = newTable[UUID, CsMethod]()
  # result.quickFetchClass = newTable[UUID, CsClass]()
  # result.quickFetch = newTable[UUID, Variant]()
  # result.quickFetch2 = newTable[UUID, CsObject]()
  result.infoCenter = newInfoCenter()
  let defaultNs = newCs(CsNamespace, "default")
  defaultNs.id = some(genUUID()) # default gets a special assignment here because it is built in and doesn't go thru lineparser.
  echo $defaultNs.id.get
  result.global = defaultNs
  result.nsTables["default"] = defaultNs
  result.register(defaultNs.id.get, Construct(kind: ckNamespace, namespace: defaultNs))


var currentRoot*: CsRoot
import nre
proc makeModule*(ns: CsNamespace): Module =
  var name: string
  if ns.parent.len > 0:
    name = ns.parent & "." & ns.name
  else:
    name = ns.name
  var output = ns.gen() & "\n\n"
  output = output.replace(re"\n{2,}","\n\n")

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
  echo csn.name

  if csn.parent != "":
    name = csn.parent & "." & csn.name
    csn.parent = ""
    csn.name = name
  else: name = csn.name

  if root.ns.allIt(it.name != csn.name):
    root.ns.incl(csn)
    root.nsTables[csn.name] = csn

  echo root.ns.toSeq.mapIt(it.name)
  # assert false
