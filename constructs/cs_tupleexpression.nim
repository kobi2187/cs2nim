import ../types, uuids, options
type CsTupleExpression* = ref object of CsObject #TODO(type:CsTupleExpression)

proc newCs*(t: typedesc[CsTupleExpression]; name: string): CsTupleExpression =
  new result
  result.id = uuids.genUUID #TODO(create:CsTupleExpression)

proc extract*(t: typedesc[CsTupleExpression]; info: Info): CsTupleExpression = discard #TODO(extract:CsTupleExpression)

proc add*(parent: var CsTupleExpression; item: Dummy) =
  discard # TODO(add:CsTupleExpression)
  # item.parentId = parent.id

proc gen*(c: var CsTupleExpression): string = discard #TODO(gen:CsTupleExpression)
