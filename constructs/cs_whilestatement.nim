import ../types, uuids, options
type CsWhileStatement* = ref object of CsObject #TODO(type:CsWhileStatement)

proc newCs*(t: typedesc[CsWhileStatement]; name: string): CsWhileStatement =
  new result
  result.id = uuids.genUUID #TODO(create:CsWhileStatement)

proc extract*(t: typedesc[CsWhileStatement]; info: Info): CsWhileStatement = discard #TODO(extract:CsWhileStatement)

proc add*(parent: var CsWhileStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsWhileStatement; item: Dummy) =
  discard # TODO(add:CsWhileStatement)
  # item.parentId = parent.id

proc gen*(c: var CsWhileStatement): string = discard #TODO(gen:CsWhileStatement)
