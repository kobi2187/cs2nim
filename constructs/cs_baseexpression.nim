import ../types, uuids, options
type CsBaseExpression* = ref object of CsObject #TODO(type:CsBaseExpression)

proc newCs*(t: typedesc[CsBaseExpression]; name: string): CsBaseExpression =
  new result
  result.id = uuids.genUUID #TODO(create:CsBaseExpression)

proc extract*(t: typedesc[CsBaseExpression]; info: Info): CsBaseExpression = discard #TODO(extract:CsBaseExpression)

proc add*(parent: var CsBaseExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsBaseExpression; item: Dummy) =
  discard # TODO(add:CsBaseExpression)
  # item.parentId = parent.id

proc gen*(c: var CsBaseExpression): string = discard #TODO(gen:CsBaseExpression)
