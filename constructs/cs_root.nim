import ../types, cs_namespace
import sets, tables

type CsRoot* = object
  global*: CsNamespace
  ns*: HashSet[CsNamespace]
  # ns*: seq[CsNamespace]
  nsTables*: TableRef[string, CsNamespace]

proc newCs*(t: typedesc[CsRoot]): CsRoot =
  result.ns = initHashSet[CsNamespace]()
  result.nsTables = newTable[string, CsNamespace]()

  let defaultNs = newCs(CsNamespace, "default")
  result.global = defaultNs
  result.nsTables["default"] = defaultNs



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

