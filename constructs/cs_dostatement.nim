import ../types, uuids, options
type CsDoStatement* = ref object of CsObject #TODO(type:CsDoStatement)

proc newCs*(t: typedesc[CsDoStatement]; name: string): CsDoStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsDoStatement)

proc extract*(t: typedesc[CsDoStatement]; info: Info): CsDoStatement = discard #TODO(extract:CsDoStatement)

proc add*(parent: var CsDoStatement; item: Dummy) =
  discard # TODO(add:CsDoStatement)
  # item.parentId = parent.id
proc add*(parent: var CsDoStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDoStatement): string = discard #TODO(gen:CsDoStatement)
