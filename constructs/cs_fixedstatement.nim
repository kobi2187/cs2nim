import ../types, uuids, options
type CsFixedStatement* = ref object of CsObject #TODO(type:CsFixedStatement)

proc newCs*(t: typedesc[CsFixedStatement]; name: string): CsFixedStatement =
  new result
  result.id = uuids.genUUID #TODO(create:CsFixedStatement)

proc extract*(t: typedesc[CsFixedStatement]; info: Info): CsFixedStatement = discard #TODO(extract:CsFixedStatement)

proc add*(parent: var CsFixedStatement; item: Dummy) =
  discard # TODO(add:CsFixedStatement)
  # item.parentId = parent.id
proc add*(parent: var CsFixedStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsFixedStatement): string = discard #TODO(gen:CsFixedStatement)
