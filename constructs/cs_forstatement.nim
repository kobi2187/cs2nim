import ../types, uuids, options
type CsForStatement* = ref object of CsObject #TODO(type:CsForStatement)

proc newCs*(t: typedesc[CsForStatement]; name: string): CsForStatement =
  new result
  result.id = uuids.genUUID #TODO(create:CsForStatement)

proc extract*(t: typedesc[CsForStatement]; info: Info): CsForStatement = discard #TODO(extract:CsForStatement)

proc add*(parent: var CsForStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsForStatement; item: Dummy) =
  discard # TODO(add:CsForStatement)
  # item.parentId = parent.id

proc gen*(c: var CsForStatement): string = discard #TODO(gen:CsForStatement)
