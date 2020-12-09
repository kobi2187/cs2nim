import ../types, uuids, options
type CsStruct* = ref object of CsObject #TODO(type:CsStruct)

proc newCs*(t: typedesc[CsStruct]; name: string): CsStruct =
  new result
  result.id = uuids.genUUID #TODO(create:CsStruct)

proc extract*(t: typedesc[CsStruct]; info: Info): CsStruct = discard #TODO(extract:CsStruct)

proc add*(parent: var CsStruct; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsStruct; item: Dummy) =
  discard # TODO(add:CsStruct)
  # item.parentId = parent.id

proc gen*(c: var CsStruct): string = discard #TODO(gen:CsStruct)
