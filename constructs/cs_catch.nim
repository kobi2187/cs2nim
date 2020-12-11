import ../types, ../state_utils, uuids, options
type CsCatch* = ref object of CsObject #TODO(type:CsCatch)

proc newCs*(t: typedesc[CsCatch]; name: string): CsCatch =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsCatch)

proc extract*(t: typedesc[CsCatch]; info: Info): CsCatch = discard #TODO(extract:CsCatch)

proc add*(parent: var CsCatch; item: Dummy) =
  discard # TODO(add:CsCatch)
  # item.parentId = parent.id
# proc add*(parent: var CsCatch; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCatch): string = discard #TODO(gen:CsCatch)
