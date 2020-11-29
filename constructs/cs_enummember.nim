import options, ../types

type CsEnumMember* = ref object of CsObject
  name*: string
  value*: string #Option[int]

proc newCs*(t: typedesc[CsEnumMember]; name, value: auto): CsEnumMember =
  new result
  result.name = name
  result.value = value

import strutils
proc extract*(t: typedesc[CsEnumMember]; info: Info): CsEnumMember =
  let name = info.essentials[0]
  let value =
    if info.essentials.len < 2: ""
    else:
      info.essentials[1]

  result = newCs(CsEnumMember, name, value)

proc add*(em: CsEnumMember; val: string) =
  em.value = val

# import options
proc gen*(e: CsEnumMember): string =
  result = e.name
  if e.value != "": result &= " = " & $e.value