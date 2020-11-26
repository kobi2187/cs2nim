import ../types
type CsConditionalAccessExpression* = ref object of CsObject #TODO(type:CsConditionalAccessExpression)

proc newCs*(t: typedesc[CsConditionalAccessExpression]; name: string): CsConditionalAccessExpression =
  new result #TODO(create:CsConditionalAccessExpression)

proc extract*(t: typedesc[CsConditionalAccessExpression]; info: Info): CsConditionalAccessExpression = discard #TODO(extract:CsConditionalAccessExpression)

proc add*(parent: var Dummy; item: CsConditionalAccessExpression) = discard # TODO(add:CsConditionalAccessExpression)

proc gen*(c: var CsConditionalAccessExpression): string = discard #TODO(gen:CsConditionalAccessExpression)
