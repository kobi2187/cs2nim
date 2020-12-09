import ../types, uuids, options
type CsQueryBody* = ref object of CsObject #TODO(type:CsQueryBody)

proc newCs*(t: typedesc[CsQueryBody]; name: string): CsQueryBody =
  new result
  result.id = uuids.genUUID #TODO(create:CsQueryBody)

proc extract*(t: typedesc[CsQueryBody]; info: Info): CsQueryBody = discard #TODO(extract:CsQueryBody)

proc add*(parent: var CsQueryBody; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsQueryBody; item: Dummy) =
  discard # TODO(add:CsQueryBody)
  # item.parentId = parent.id

proc gen*(c: var CsQueryBody): string = discard #TODO(gen:CsQueryBody)
