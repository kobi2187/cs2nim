import ../types, uuids, options
type CsBinaryExpression* = ref object of CsObject #TODO(type:CsBinaryExpression)

proc newCs*(t: typedesc[CsBinaryExpression]; name: string): CsBinaryExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsBinaryExpression)

proc extract*(t: typedesc[CsBinaryExpression]; info: Info): CsBinaryExpression = discard #TODO(extract:CsBinaryExpression)

proc add*(parent: var CsBinaryExpression; item: Dummy) =
  discard # TODO(add:CsBinaryExpression)
proc add*(parent: var CsBinaryExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
  # item.parentId = parent.id

proc gen*(c: var CsBinaryExpression): string = discard #TODO(gen:CsBinaryExpression)
