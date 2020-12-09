import ../types, uuids, options
type CsDefaultExpression* = ref object of CsObject #TODO(type:CsDefaultExpression)

proc newCs*(t: typedesc[CsDefaultExpression]; name: string): CsDefaultExpression =
  new result
  result.id = uuids.genUUID #TODO(create:CsDefaultExpression)

proc extract*(t: typedesc[CsDefaultExpression]; info: Info): CsDefaultExpression = discard #TODO(extract:CsDefaultExpression)

proc add*(parent: var CsDefaultExpression; item: Dummy) =
  discard # TODO(add:CsDefaultExpression)
  # item.parentId = parent.id
proc add*(parent: var CsDefaultExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDefaultExpression): string = discard #TODO(gen:CsDefaultExpression)
