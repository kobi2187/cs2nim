import ../types, uuids, options
type CsNullableType* = ref object of CsObject #TODO(type:CsNullableType)

proc newCs*(t: typedesc[CsNullableType]; name: string): CsNullableType =
  new result
  result.id = uuids.genUUID #TODO(create:CsNullableType)

proc extract*(t: typedesc[CsNullableType]; info: Info): CsNullableType = discard #TODO(extract:CsNullableType)

proc add*(parent: var CsNullableType; item: Dummy) =
  discard # TODO(add:CsNullableType)
  # item.parentId = parent.id

proc gen*(c: var CsNullableType): string = discard #TODO(gen:CsNullableType)
