import ../types, uuids, options
type CsOrdering* = ref object of CsObject #TODO(type:CsOrdering)

proc newCs*(t: typedesc[CsOrdering]; name: string): CsOrdering =
  new result
  result.id = uuids.genUUID #TODO(create:CsOrdering)

proc extract*(t: typedesc[CsOrdering]; info: Info): CsOrdering = discard #TODO(extract:CsOrdering)

proc add*(parent: var CsOrdering; item: Dummy) =
  discard # TODO(add:CsOrdering)
  # item.parentId = parent.id
proc add*(parent: var CsOrdering; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsOrdering): string = discard #TODO(gen:CsOrdering)
