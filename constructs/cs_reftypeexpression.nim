import ../types, ../state_utils, uuids, options
type CsRefTypeExpression* = ref object of CsObject #TODO(type:CsRefTypeExpression)

proc newCs*(t: typedesc[CsRefTypeExpression]; name: string): CsRefTypeExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsRefTypeExpression)

proc extract*(t: typedesc[CsRefTypeExpression]; info: Info): CsRefTypeExpression = discard #TODO(extract:CsRefTypeExpression)

proc add*(parent: var CsRefTypeExpression; item: Dummy) =
  discard # TODO(add:CsRefTypeExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsRefTypeExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsRefTypeExpression): string = discard #TODO(gen:CsRefTypeExpression)
