type CsPostfixUnaryExpression* = ref object of CsObject #TODO(type:CsPostfixUnaryExpression)

proc newCs*(t: typedesc[CsPostfixUnaryExpression]; name: string): CsPostfixUnaryExpression =
  new result #TODO(create:CsPostfixUnaryExpression)

proc extract*(t: typedesc[CsPostfixUnaryExpression]; info: Info): CsPostfixUnaryExpression = discard #TODO(extract:CsPostfixUnaryExpression)

proc add*(parent: var Dummy; item: CsPostfixUnaryExpression) = discard # TODO(add:CsPostfixUnaryExpression)

proc gen*(c: var CsPostfixUnaryExpression): string = discard #TODO(gen:CsPostfixUnaryExpression)