import ../types, ../state_utils, uuids, options, cs_property
type CsInterface* = ref object of CsObject #TODO(type:CsInterface)
proc newCs*(t: typedesc[CsInterface]; name: string): CsInterface =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsInterface)

proc extract*(t: typedesc[CsInterface]; info: Info): CsInterface = discard #TODO(extract:CsInterface)


proc add*(parent: var CsInterface; item: CsProperty) =
  discard # TODO(add:CsInterface)
  # item.parentId = parent.id
# proc add*(parent: var CsInterface; item: CsProperty; data: AllNeededData) = parent.add(item) # TODO



proc gen*(c: var CsInterface): string = discard #TODO(gen:CsInterface)
