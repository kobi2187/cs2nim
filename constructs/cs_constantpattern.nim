import ../types, ../state_utils, uuids, options
type CsConstantPattern* = ref object of CsObject #TODO(type:CsConstantPattern)

proc newCs*(t: typedesc[CsConstantPattern]; name: string): CsConstantPattern =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsConstantPattern)

proc extract*(t: typedesc[CsConstantPattern]; info: Info): CsConstantPattern = discard #TODO(extract:CsConstantPattern)

proc add*(parent: var CsConstantPattern; item: Dummy) =
  discard # TODO(add:CsConstantPattern)
  # item.parentId = parent.id
# proc add*(parent: var CsConstantPattern; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsConstantPattern): string = discard #TODO(gen:CsConstantPattern)
