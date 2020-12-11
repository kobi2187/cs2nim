import ../types, ../state_utils, uuids, options
type CsCasePatternSwitchLabel* = ref object of CsObject #TODO(type:CsCasePatternSwitchLabel)

proc newCs*(t: typedesc[CsCasePatternSwitchLabel]; name: string): CsCasePatternSwitchLabel =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsCasePatternSwitchLabel)

proc extract*(t: typedesc[CsCasePatternSwitchLabel]; info: Info): CsCasePatternSwitchLabel = discard #TODO(extract:CsCasePatternSwitchLabel)

proc add*(parent: var CsCasePatternSwitchLabel; item: Dummy) =
  discard # TODO(add:CsCasePatternSwitchLabel)
  # item.parentId = parent.id
# proc add*(parent: var CsCasePatternSwitchLabel; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCasePatternSwitchLabel): string = discard #TODO(gen:CsCasePatternSwitchLabel)
