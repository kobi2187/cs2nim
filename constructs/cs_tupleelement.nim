import ../types, uuids, options
type CsTupleElement* = ref object of CsObject #TODO(type:CsTupleElement)

proc newCs*(t: typedesc[CsTupleElement]; name: string): CsTupleElement =
  new result
  result.id = uuids.genUUID #TODO(create:CsTupleElement)

proc extract*(t: typedesc[CsTupleElement]; info: Info): CsTupleElement = discard #TODO(extract:CsTupleElement)

proc add*(parent: var CsTupleElement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsTupleElement; item: Dummy) =
  discard # TODO(add:CsTupleElement)
  # item.parentId = parent.id

proc gen*(c: var CsTupleElement): string = discard #TODO(gen:CsTupleElement)
