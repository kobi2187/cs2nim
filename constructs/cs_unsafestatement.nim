import ../types, uuids, options
type CsUnsafeStatement* = ref object of CsObject #TODO(type:CsUnsafeStatement)

proc newCs*(t: typedesc[CsUnsafeStatement]; name: string): CsUnsafeStatement =
  new result
  result.id = uuids.genUUID #TODO(create:CsUnsafeStatement)

proc extract*(t: typedesc[CsUnsafeStatement]; info: Info): CsUnsafeStatement = discard #TODO(extract:CsUnsafeStatement)

proc add*(parent: var CsUnsafeStatement; item: Dummy) =
  discard # TODO(add:CsUnsafeStatement)
  # item.parentId = parent.id
proc add*(parent: var CsUnsafeStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsUnsafeStatement): string = discard #TODO(gen:CsUnsafeStatement)
