import ../types, ../state_utils, uuids, options
type CsStackAllocArrayCreationExpression* = ref object of CsObject #TODO(type:CsStackAllocArrayCreationExpression)

proc newCs*(t: typedesc[CsStackAllocArrayCreationExpression]; name: string): CsStackAllocArrayCreationExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsStackAllocArrayCreationExpression)

proc extract*(t: typedesc[CsStackAllocArrayCreationExpression]; info: Info): CsStackAllocArrayCreationExpression = discard #TODO(extract:CsStackAllocArrayCreationExpression)

proc add*(parent: var CsStackAllocArrayCreationExpression; item: Dummy) =
  discard # TODO(add:CsStackAllocArrayCreationExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsStackAllocArrayCreationExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsStackAllocArrayCreationExpression): string = discard #TODO(gen:CsStackAllocArrayCreationExpression)
