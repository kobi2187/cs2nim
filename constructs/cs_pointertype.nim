import ../types, uuids, options
type CsPointerType* = ref object of CsObject #TODO(type:CsPointerType)

proc newCs*(t: typedesc[CsPointerType]; name: string): CsPointerType =
  new result
  result.id = uuids.genUUID #TODO(create:CsPointerType)

proc extract*(t: typedesc[CsPointerType]; info: Info): CsPointerType = discard #TODO(extract:CsPointerType)

proc add*(parent: var CsPointerType; item: Dummy) =
  discard # TODO(add:CsPointerType)
  # item.parentId = parent.id

proc gen*(c: var CsPointerType): string = discard #TODO(gen:CsPointerType)
