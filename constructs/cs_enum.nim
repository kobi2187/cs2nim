import ../types, uuids, options, cs_enummember
import sequtils, strutils

type CsEnum* = ref object of CsObject
  items*: seq[CsEnumMember]

proc newCs*(t: typedesc[CsEnum]; name: string): CsEnum =
  new result
  result.id = genUUID().some
  result.name = name



proc extract*(t: typedesc[CsEnum]; info: Info): CsEnum =
  assert info.essentials.len > 0
  let name = info.essentials[0]
  result = newCs(CsEnum, name)

proc add*(parent: var CsEnum; item: CsEnumMember) =
  item.parentId = parent.id
  parent.items.add item
proc add*(parent: var CsEnum; item: CsEnumMember; data: AllNeededData) = parent.add(item) # TODO

proc gen*(e: CsEnum): string =
  echo "members count:" & $e.items.len

  result = "type " & e.name & "* = enum"
  if e.items.len > 0:
    result &= "\n  "
    let strs = e.items.mapIt(it.gen())
    result &= strs.join(", ")
  # echo result
