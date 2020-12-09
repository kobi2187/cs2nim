import ../types, uuids, options
type CsSwitchSection* = ref object of CsObject #TODO(type:CsSwitchSection)

proc newCs*(t: typedesc[CsSwitchSection]; name: string): CsSwitchSection =
  new result
  result.id = uuids.genUUID #TODO(create:CsSwitchSection)

proc extract*(t: typedesc[CsSwitchSection]; info: Info): CsSwitchSection = discard #TODO(extract:CsSwitchSection)

proc add*(parent: var CsSwitchSection; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsSwitchSection; item: Dummy) =
  discard # TODO(add:CsSwitchSection)
  # item.parentId = parent.id

proc gen*(c: var CsSwitchSection): string = discard #TODO(gen:CsSwitchSection)
