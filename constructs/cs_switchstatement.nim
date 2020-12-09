import ../types, uuids, options
type CsSwitchStatement* = ref object of CsObject #TODO(type:CsSwitchStatement)

proc newCs*(t: typedesc[CsSwitchStatement]; name: string): CsSwitchStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsSwitchStatement)

proc extract*(t: typedesc[CsSwitchStatement]; info: Info): CsSwitchStatement = discard #TODO(extract:CsSwitchStatement)

proc add*(parent: var CsSwitchStatement; item: Dummy) =
  discard # TODO(add:CsSwitchStatement)
  # item.parentId = parent.id
proc add*(parent: var CsSwitchStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsSwitchStatement): string = discard #TODO(gen:CsSwitchStatement)
