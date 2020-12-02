import ../types
type CsParenthesizedLambdaExpression* = ref object of CsObject #TODO(type:CsParenthesizedLambdaExpression)

proc newCs*(t: typedesc[CsParenthesizedLambdaExpression]; name: string): CsParenthesizedLambdaExpression =
  new result #TODO(create:CsParenthesizedLambdaExpression)

proc extract*(t: typedesc[CsParenthesizedLambdaExpression]; info: Info): CsParenthesizedLambdaExpression = discard #TODO(extract:CsParenthesizedLambdaExpression)

proc add*(parent: var CsParenthesizedLambdaExpression; item: Dummy) = discard # TODO(add:CsParenthesizedLambdaExpression)

proc gen*(c: var CsParenthesizedLambdaExpression): string = discard #TODO(gen:CsParenthesizedLambdaExpression)
