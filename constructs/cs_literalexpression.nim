import ../types, uuids, options
type CsLiteralExpression* = ref object of BodyExpr
  value*: string

proc newCs(_: typedesc[CsLiteralExpression], val: string): CsLiteralExpression =
  new result
  result.id = genUUID().some
  result.ttype = "CsLiteralExpression"
  result.value = val

proc extract*(_: typedesc[CsLiteralExpression]; info: Info): CsLiteralExpression =
  let strVal = info.essentials[0]
  result = newCs(CsLiteralExpression, strVal)

method gen*(lit: CsLiteralExpression): string =
  lit.value
