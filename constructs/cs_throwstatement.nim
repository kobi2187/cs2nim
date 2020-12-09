import ../types, uuids, options
type CsThrowStatement* = ref object of CsObject #TODO(type:CsThrowStatement)

proc newCs*(t: typedesc[CsThrowStatement]; name: string): CsThrowStatement =
  new result
  result.id = uuids.genUUID #TODO(create:CsThrowStatement)

proc extract*(t: typedesc[CsThrowStatement]; info: Info): CsThrowStatement = discard #TODO(extract:CsThrowStatement)

proc add*(parent: var CsThrowStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsThrowStatement; item: Dummy) =
  discard # TODO(add:CsThrowStatement)
  # item.parentId = parent.id

proc gen*(c: var CsThrowStatement): string = discard #TODO(gen:CsThrowStatement)
