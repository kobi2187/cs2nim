import ../types, ../state_utils, uuids, options
type CsTupleType* = ref object of CsObject #TODO(type:CsTupleType)

proc newCs*(t: typedesc[CsTupleType]; name: string): CsTupleType =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsTupleType)

proc extract*(t: typedesc[CsTupleType]; info: Info): CsTupleType = discard #TODO(extract:CsTupleType)

proc add*(parent: var CsTupleType; item: Dummy) =
  discard # TODO(add:CsTupleType)
  # item.parentId = parent.id
# proc add*(parent: var CsTupleType; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTupleType): string = discard #TODO(gen:CsTupleType)
