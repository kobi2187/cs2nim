import ../types, ../state_utils, uuids, options
type CsRefType* = ref object of CsObject #TODO(type:CsRefType)

proc newCs*(t: typedesc[CsRefType]; name: string): CsRefType =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsRefType)

proc extract*(t: typedesc[CsRefType]; info: Info): CsRefType = discard #TODO(extract:CsRefType)

proc add*(parent: var CsRefType; item: Dummy) =
  discard # TODO(add:CsRefType)
  # item.parentId = parent.id
# proc add*(parent: var CsRefType; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsRefType): string = discard #TODO(gen:CsRefType)
