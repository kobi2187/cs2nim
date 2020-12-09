import ../types, uuids, options
type CsQueryExpression* = ref object of CsObject #TODO(type:CsQueryExpression)

proc newCs*(t: typedesc[CsQueryExpression]; name: string): CsQueryExpression =
  new result
  result.id = uuids.genUUID #TODO(create:CsQueryExpression)

proc extract*(t: typedesc[CsQueryExpression]; info: Info): CsQueryExpression = discard #TODO(extract:CsQueryExpression)

proc add*(parent: var CsQueryExpression; item: Dummy) =
  discard # TODO(add:CsQueryExpression)
  # item.parentId = parent.id
proc add*(parent: var CsQueryExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsQueryExpression): string = discard #TODO(gen:CsQueryExpression)
