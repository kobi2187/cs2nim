import ../types, uuids, options
type CsTryStatement* = ref object of CsObject #TODO(type:CsTryStatement)

proc newCs*(t: typedesc[CsTryStatement]; name: string): CsTryStatement =
  new result
  result.id = uuids.genUUID #TODO(create:CsTryStatement)

proc extract*(t: typedesc[CsTryStatement]; info: Info): CsTryStatement = discard #TODO(extract:CsTryStatement)

proc add*(parent: var CsTryStatement; item: Dummy) =
  discard # TODO(add:CsTryStatement)
  # item.parentId = parent.id

proc gen*(c: var CsTryStatement): string = discard #TODO(gen:CsTryStatement)
