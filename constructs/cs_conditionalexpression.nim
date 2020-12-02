import ../types
type CsConditionalExpression* = ref object of CsObject #TODO(type:CsConditionalExpression)

proc newCs*(t: typedesc[CsConditionalExpression]; name: string): CsConditionalExpression =
  new result #TODO(create:CsConditionalExpression)

proc extract*(t: typedesc[CsConditionalExpression]; info: Info): CsConditionalExpression = discard #TODO(extract:CsConditionalExpression)

proc add*(parent: var CsConditionalExpression; item: Dummy) = discard # TODO(add:CsConditionalExpression)

proc gen*(c: var CsConditionalExpression): string = discard #TODO(gen:CsConditionalExpression)
