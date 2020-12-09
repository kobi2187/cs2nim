import ../types, uuids, options
type CsCastExpression* = ref object of CsObject #TODO(type:CsCastExpression)

proc newCs*(t: typedesc[CsCastExpression]; name: string): CsCastExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsCastExpression)

proc extract*(t: typedesc[CsCastExpression]; info: Info): CsCastExpression = discard #TODO(extract:CsCastExpression)

proc add*(parent: var CsCastExpression; item: Dummy) =
  discard # TODO(add:CsCastExpression)
  # item.parentId = parent.id
proc add*(parent: var CsCastExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCastExpression): string = discard #TODO(gen:CsCastExpression)
