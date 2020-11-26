import ../types

type CsParameter* = ref object of CsObject
  name*: string
  ptype*: string

proc newCs*(t: typedesc[CsParameter]; a, b: string): CsParameter =
  new result
  result.name = a
  result.ptype = b

proc extract*(t: typedesc[CsParameter]; info: Info): CsParameter =
  assert info.essentials.len >= 2
  let name = info.essentials[0]
  let ty = info.essentials[1]
  result = newCs(CsParameter, name, ty)



import strutils
proc gen*(p: CsParameter): string =
  p.name & ": " & p.ptype.strip
