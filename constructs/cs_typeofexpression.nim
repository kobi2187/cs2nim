type CsTypeOfExpression* = ref object of CsObject #TODO(type:CsTypeOfExpression)

proc newCs*(t: typedesc[CsTypeOfExpression]; name: string): CsTypeOfExpression =
  new result #TODO(create:CsTypeOfExpression)

proc extract*(t: typedesc[CsTypeOfExpression]; info: Info): CsTypeOfExpression = discard #TODO(extract:CsTypeOfExpression)

proc add*(parent: var Dummy; item: CsTypeOfExpression) = discard # TODO(add:CsTypeOfExpression)

proc gen*(c: var CsTypeOfExpression): string = discard #TODO(gen:CsTypeOfExpression)