import ../types, uuids, options
type CsThrowExpression* = ref object of CsObject #TODO(type:CsThrowExpression)

proc newCs*(t: typedesc[CsThrowExpression]; name: string): CsThrowExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsThrowExpression)

proc extract*(t: typedesc[CsThrowExpression]; info: Info): CsThrowExpression = discard #TODO(extract:CsThrowExpression)

proc add*(parent: var CsThrowExpression; item: Dummy) =
  discard # TODO(add:CsThrowExpression)
  # item.parentId = parent.id
proc add*(parent: var CsThrowExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsThrowExpression): string = discard #TODO(gen:CsThrowExpression)
