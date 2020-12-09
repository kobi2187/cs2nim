import ../types, uuids, options
type CsParenthesizedLambdaExpression* = ref object of CsObject #TODO(type:CsParenthesizedLambdaExpression)

proc newCs*(t: typedesc[CsParenthesizedLambdaExpression]; name: string): CsParenthesizedLambdaExpression =
  new result
  result.id = uuids.genUUID #TODO(create:CsParenthesizedLambdaExpression)

proc extract*(t: typedesc[CsParenthesizedLambdaExpression]; info: Info): CsParenthesizedLambdaExpression = discard #TODO(extract:CsParenthesizedLambdaExpression)

proc add*(parent: var CsParenthesizedLambdaExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsParenthesizedLambdaExpression; item: Dummy) =
  discard # TODO(add:CsParenthesizedLambdaExpression)
  # item.parentId = parent.id

proc gen*(c: var CsParenthesizedLambdaExpression): string = discard #TODO(gen:CsParenthesizedLambdaExpression)
