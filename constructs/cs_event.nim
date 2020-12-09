import ../types, uuids, options
type CsEvent* = ref object of CsObject #TODO(type:CsEvent)

proc newCs*(t: typedesc[CsEvent]; name: string): CsEvent =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsEvent)

proc extract*(t: typedesc[CsEvent]; info: Info): CsEvent = discard #TODO(extract:CsEvent)

proc add*(parent: var CsEvent; item: Dummy) =
  discard # TODO(add:CsEvent)
  # item.parentId = parent.id
proc add*(parent: var CsEvent; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsEvent): string = discard #TODO(gen:CsEvent)
