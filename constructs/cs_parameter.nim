import ../types, ../state_utils, uuids, options

type CsParameter* = ref object of CsObject
  ptype*: string
  isRef*: bool
  isOut*: bool

proc newCs*(t: typedesc[CsParameter]; a, b: string): CsParameter =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.name = a
  result.ptype = b

proc extract*(t: typedesc[CsParameter]; info: Info): CsParameter =
  assert info.essentials.len >= 2
  let name = info.essentials[0].strip()
  let ty = info.essentials[1].strip()
  result = newCs(CsParameter, name, ty)
  if info.extras.len > 0:
    let e = info.extras[0]
    if e.contains("ref"): result.isRef = true




import strutils
proc gen*(p: CsParameter): string =
  result = p.name & ": "
  if p.isRef:
    result &= "var "
  result &= p.ptype.strip

