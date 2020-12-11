import ../types, ../state_utils, uuids, options
type CsEventField* = ref object of CsObject #TODO(type:CsEventField)

proc newCs*(t: typedesc[CsEventField]; name: string): CsEventField =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsEventField)

proc extract*(t: typedesc[CsEventField]; info: Info): CsEventField = discard #TODO(extract:CsEventField)

proc add*(parent: var CsEventField; item: Dummy) =
  discard # TODO(add:CsEventField)
  # item.parentId = parent.id
# proc add*(parent: var CsEventField; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsEventField): string = discard #TODO(gen:CsEventField)
