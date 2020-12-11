import ../types, ../state_utils, uuids, options
type CsElementAccessExpression* = ref object of CsObject #TODO(type:CsElementAccessExpression)

proc newCs*(t: typedesc[CsElementAccessExpression]; name: string): CsElementAccessExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsElementAccessExpression)

proc extract*(t: typedesc[CsElementAccessExpression]; info: Info): CsElementAccessExpression = discard #TODO(extract:CsElementAccessExpression)

proc add*(parent: var CsElementAccessExpression; item: Dummy) =
  discard # TODO(add:CsElementAccessExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsElementAccessExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsElementAccessExpression): string = discard #TODO(gen:CsElementAccessExpression)
