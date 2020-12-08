import ../types, uuids, options
type CsEmptyStatement* = ref object of CsObject #TODO(type:CsEmptyStatement)

proc newCs*(t: typedesc[CsEmptyStatement]; name: string): CsEmptyStatement =
  new result
  result.id = uuids.genUUID #TODO(create:CsEmptyStatement)

proc extract*(t: typedesc[CsEmptyStatement]; info: Info): CsEmptyStatement = discard #TODO(extract:CsEmptyStatement)

proc add*(parent: var CsEmptyStatement; item: Dummy) =
  discard # TODO(add:CsEmptyStatement)
  # item.parentId = parent.id

proc gen*(c: var CsEmptyStatement): string = discard #TODO(gen:CsEmptyStatement)
