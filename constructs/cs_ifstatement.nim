import ../types, uuids, options
type CsIfStatement* = ref object of CsObject #TODO(type:CsIfStatement)

proc newCs*(t: typedesc[CsIfStatement]; name: string): CsIfStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsIfStatement)

proc extract*(t: typedesc[CsIfStatement]; info: Info): CsIfStatement = discard #TODO(extract:CsIfStatement)

proc add*(parent: var CsIfStatement; item: Dummy) =
  discard # TODO(add:CsIfStatement)
  # item.parentId = parent.id
proc add*(parent: var CsIfStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsIfStatement): string = discard #TODO(gen:CsIfStatement)
