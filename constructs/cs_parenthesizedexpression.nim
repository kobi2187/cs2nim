import ../types, uuids, options
type CsParenthesizedExpression* = ref object of CsObject #TODO(type:CsParenthesizedExpression)

proc newCs*(t: typedesc[CsParenthesizedExpression]; name: string): CsParenthesizedExpression =
  new result
  result.id = uuids.genUUID #TODO(create:CsParenthesizedExpression)

proc extract*(t: typedesc[CsParenthesizedExpression]; info: Info): CsParenthesizedExpression = discard #TODO(extract:CsParenthesizedExpression)

proc add*(parent: var CsParenthesizedExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsParenthesizedExpression; item: Dummy) =
  discard # TODO(add:CsParenthesizedExpression)
  # item.parentId = parent.id

proc gen*(c: var CsParenthesizedExpression): string = discard #TODO(gen:CsParenthesizedExpression)
