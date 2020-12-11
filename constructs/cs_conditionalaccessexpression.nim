import ../types, ../state_utils, uuids, options
type CsConditionalAccessExpression* = ref object of CsObject #TODO(type:CsConditionalAccessExpression)

proc newCs*(t: typedesc[CsConditionalAccessExpression]; name: string): CsConditionalAccessExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsConditionalAccessExpression)

proc extract*(t: typedesc[CsConditionalAccessExpression]; info: Info): CsConditionalAccessExpression = discard #TODO(extract:CsConditionalAccessExpression)

proc add*(parent: var CsConditionalAccessExpression; item: Dummy) =
  discard # TODO(add:CsConditionalAccessExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsConditionalAccessExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsConditionalAccessExpression): string = discard #TODO(gen:CsConditionalAccessExpression)
