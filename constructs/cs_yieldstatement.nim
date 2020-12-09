import ../types, uuids, options
type CsYieldStatement* = ref object of CsObject #TODO(type:CsYieldStatement)

proc newCs*(t: typedesc[CsYieldStatement]; name: string): CsYieldStatement =
  new result
  result.id = uuids.genUUID #TODO(create:CsYieldStatement)

proc extract*(t: typedesc[CsYieldStatement]; info: Info): CsYieldStatement = discard #TODO(extract:CsYieldStatement)

proc add*(parent: var CsYieldStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsYieldStatement; item: Dummy) =
  discard # TODO(add:CsYieldStatement)
  # item.parentId = parent.id

proc gen*(c: var CsYieldStatement): string = discard #TODO(gen:CsYieldStatement)
