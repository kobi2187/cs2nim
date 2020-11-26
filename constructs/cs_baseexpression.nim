type CsBaseExpression* = ref object of CsObject #TODO(type:CsBaseExpression)

proc newCs*(t: typedesc[CsBaseExpression]; name: string): CsBaseExpression =
  new result #TODO(create:CsBaseExpression)

proc extract*(t: typedesc[CsBaseExpression]; info: Info): CsBaseExpression = discard #TODO(extract:CsBaseExpression)

proc add*(parent: var Dummy; item: CsBaseExpression) = discard # TODO(add:CsBaseExpression)

proc gen*(c: var CsBaseExpression): string = discard #TODO(gen:CsBaseExpression)