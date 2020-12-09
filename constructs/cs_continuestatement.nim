import ../types, uuids, options
type CsContinueStatement* = ref object of CsObject #TODO(type:CsContinueStatement)

proc newCs*(t: typedesc[CsContinueStatement]; name: string): CsContinueStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsContinueStatement)

proc extract*(t: typedesc[CsContinueStatement]; info: Info): CsContinueStatement = discard #TODO(extract:CsContinueStatement)

proc add*(parent: var CsContinueStatement; item: Dummy) =
  discard # TODO(add:CsContinueStatement)
  # item.parentId = parent.id
proc add*(parent: var CsContinueStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsContinueStatement): string = discard #TODO(gen:CsContinueStatement)
