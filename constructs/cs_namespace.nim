import ../types, cs_class, cs_enum
import tables, sequtils, sets, strutils

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

proc add*(parent: var CsNamespace; item: CsEnum) =
  parent.enums.add item
  parent.enumTable[item.name] = item


proc add*(ns: var CsNamespace; class: CsClass) =
  ns.classes.add(class)
  ns.classTable[class.name] = class

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
