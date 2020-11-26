
type CsNamespace* = ref object of CsObject
  name*: string
  parent*: string
  classes*: seq[CsClass]
  classTable*: TableRef[string, CsClass]
  enums*: seq[CsEnum]
  enumTable*: TableRef[string, CsEnum]

proc newCs*(t: typedesc[CsNamespace]; name: string): CsNamespace =
  new result
  result.name = name
  result.classes = @[]
  result.classTable = newTable[string, CsClass]()
  result.enums = @[]
  result.enumTable = newTable[string, CsEnum]()

func extract*(t: typedesc[CsNamespace]; info: Info): CsNamespace =
  result = newCs(CsNamespace, info.essentials[0])

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



proc gen*(r: CsNamespace): string =
  echo "generating namespace: " & r.name
  var s: seq[string] = @[]
  for c in r.classes:
    s.add(c.gen())
  for e in r.enums:
    s.add(e.gen())
  result = s.join("\r\n")

import hashes
proc hash*(c: CsNamespace): Hash =
  result = hash(c.name)
