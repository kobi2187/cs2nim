import ../types, uuids, options
type CsCaseSwitchLabel* = ref object of CsObject #TODO(type:CsCaseSwitchLabel)

proc newCs*(t: typedesc[CsCaseSwitchLabel]; name: string): CsCaseSwitchLabel =
  new result
  result.id = uuids.genUUID #TODO(create:CsCaseSwitchLabel)

proc extract*(t: typedesc[CsCaseSwitchLabel]; info: Info): CsCaseSwitchLabel = discard #TODO(extract:CsCaseSwitchLabel)

proc add*(parent: var CsCaseSwitchLabel; item: Dummy) =
  discard # TODO(add:CsCaseSwitchLabel)
  # item.parentId = parent.id
proc add*(parent: var CsCaseSwitchLabel; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCaseSwitchLabel): string = discard #TODO(gen:CsCaseSwitchLabel)
