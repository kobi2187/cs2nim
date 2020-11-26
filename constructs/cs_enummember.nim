import options, ../types

type CsEnumMember* = ref object of CsObject
  name*: string
  value*: Option[int]

proc newCs*(t: typedesc[CsEnumMember]; name, value: auto): CsEnumMember =
  new result
  result.name = name
  result.value = value

proc extract*(t: typedesc[CsEnumMember]; info: Info): CsEnumMember =
  let name = info.essentials[0]
  let value =
    if info.essentials.len < 2: none(int)
    else:
      let it = info.essentials[1]
      some(parseInt(it))

  result = newCs(CsEnumMember, name, value)

proc add*(parent: var CsEnum; item: CsEnumMember) =
  parent.items.add item

import options
proc gen*(e: CsEnumMember): string =
  result = e.name
  if e.value.isSome: result &= " = " & $e.value.get
