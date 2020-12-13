import cs_all_constructs, ../info_center, ../types, ../construct
import sets, sequtils, tables, uuids, options, strutils
# ============= CsRoot ========

type CsRoot* = object
  global*: CsNamespace
  ns*: HashSet[CsNamespace]
  # ns*: seq[CsNamespace]
  nsTables*: TableRef[string, CsNamespace]
  # quickFetchBodyExpr*: TableRef[UUID, CsObject]
  # quickFetchMethod*: TableRef[UUID, CsMethod]
  # quickFetchClass*: TableRef[UUID, CsClass]
  infoCenter*: InfoCenter
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
