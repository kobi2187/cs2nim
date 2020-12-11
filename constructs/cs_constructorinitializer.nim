import ../types, ../state_utils, uuids, options
type CsConstructorInitializer* = ref object of CsObject #TODO(type:CsConstructorInitializer)

proc newCs*(t: typedesc[CsConstructorInitializer]; name: string): CsConstructorInitializer =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsConstructorInitializer)

proc extract*(t: typedesc[CsConstructorInitializer]; info: Info): CsConstructorInitializer = discard #TODO(extract:CsConstructorInitializer)

proc add*(parent: var CsConstructorInitializer; item: Dummy) =
  discard # TODO(add:CsConstructorInitializer)
  # item.parentId = parent.id
# proc add*(parent: var CsConstructorInitializer; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsConstructorInitializer): string = discard #TODO(gen:CsConstructorInitializer)
