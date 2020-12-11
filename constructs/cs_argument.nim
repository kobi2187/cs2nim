import ../types, ../state_utils, uuids, options
type CsArgument* = ref object of CsObject #TODO(type:CsArgument)

proc newCs*(t: typedesc[CsArgument]; name: string): CsArgument =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsArgument)

proc extract*(t: typedesc[CsArgument]; info: Info): CsArgument = discard #TODO(extract:CsArgument)

proc add*(parent: var CsArgument; item: Dummy) =
  discard # TODO(add:CsArgument)
  # item.parentId = parent.id
# proc add*(parent: var CsArgument; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsArgument): string = discard #TODO(gen:CsArgument)
