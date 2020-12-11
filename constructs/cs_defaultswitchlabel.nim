import ../types, ../state_utils, uuids, options
type CsDefaultSwitchLabel* = ref object of CsObject #TODO(type:CsDefaultSwitchLabel)

proc newCs*(t: typedesc[CsDefaultSwitchLabel]; name: string): CsDefaultSwitchLabel =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsDefaultSwitchLabel)

proc extract*(t: typedesc[CsDefaultSwitchLabel]; info: Info): CsDefaultSwitchLabel = discard #TODO(extract:CsDefaultSwitchLabel)

proc add*(parent: var CsDefaultSwitchLabel; item: Dummy) =
  discard # TODO(add:CsDefaultSwitchLabel)
  # item.parentId = parent.id
# proc add*(parent: var CsDefaultSwitchLabel; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDefaultSwitchLabel): string = discard #TODO(gen:CsDefaultSwitchLabel)
