import ../types, uuids, options
type CsForEachStatement* = ref object of CsObject #TODO(type:CsForEachStatement)

proc newCs*(t: typedesc[CsForEachStatement]; name: string): CsForEachStatement =
  new result
  result.id = uuids.genUUID #TODO(create:CsForEachStatement)

proc extract*(t: typedesc[CsForEachStatement]; info: Info): CsForEachStatement = discard #TODO(extract:CsForEachStatement)

proc add*(parent: var CsForEachStatement; item: Dummy) =
  discard # TODO(add:CsForEachStatement)
  # item.parentId = parent.id

proc gen*(c: var CsForEachStatement): string = discard #TODO(gen:CsForEachStatement)
