import ../types, ../state_utils, uuids, options
type CsAccessor* = ref object of CsObject #TODO(type:CsAccessor)

proc newCs*(t: typedesc[CsAccessor]; name: string): CsAccessor =
  new result
  result.typ = $typeof(t)
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAccessor)

proc extract*(t: typedesc[CsAccessor]; info: Info): CsAccessor = discard #TODO(extract:CsAccessor)

proc add*(parent: var CsAccessor; item: Dummy) =
  discard # TODO(add:CsAccessor)
  # item.parentId = parent.id
# proc add*(parent: var CsAccessor; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAccessor): string = discard #TODO(gen:CsAccessor)
