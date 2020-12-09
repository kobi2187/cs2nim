import ../types, uuids, options
type CsPostfixUnaryExpression* = ref object of CsObject #TODO(type:CsPostfixUnaryExpression)

proc newCs*(t: typedesc[CsPostfixUnaryExpression]; name: string): CsPostfixUnaryExpression =
  new result
  result.id = uuids.genUUID #TODO(create:CsPostfixUnaryExpression)

proc extract*(t: typedesc[CsPostfixUnaryExpression]; info: Info): CsPostfixUnaryExpression = discard #TODO(extract:CsPostfixUnaryExpression)

proc add*(parent: var CsPostfixUnaryExpression; item: Dummy) =
  discard # TODO(add:CsPostfixUnaryExpression)
  # item.parentId = parent.id
proc add*(parent: var CsPostfixUnaryExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsPostfixUnaryExpression): string = discard #TODO(gen:CsPostfixUnaryExpression)
