import ../types, ../state_utils, uuids, options
type CsImplicitArrayCreationExpression* = ref object of CsObject #TODO(type:CsImplicitArrayCreationExpression)

proc newCs*(t: typedesc[CsImplicitArrayCreationExpression]; name: string): CsImplicitArrayCreationExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsImplicitArrayCreationExpression)

proc extract*(t: typedesc[CsImplicitArrayCreationExpression]; info: Info): CsImplicitArrayCreationExpression = discard #TODO(extract:CsImplicitArrayCreationExpression)

proc add*(parent: var CsImplicitArrayCreationExpression; item: Dummy) =
  discard # TODO(add:CsImplicitArrayCreationExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsImplicitArrayCreationExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsImplicitArrayCreationExpression): string = discard #TODO(gen:CsImplicitArrayCreationExpression)
