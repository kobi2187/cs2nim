import ../types, ../state_utils, uuids, options
type CsGotoStatement* = ref object of CsObject #TODO(type:CsGotoStatement)

proc newCs*(t: typedesc[CsGotoStatement]; name: string): CsGotoStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsGotoStatement)

proc extract*(t: typedesc[CsGotoStatement]; info: Info): CsGotoStatement = discard #TODO(extract:CsGotoStatement)

proc add*(parent: var CsGotoStatement; item: Dummy) =
  discard # TODO(add:CsGotoStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsGotoStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsGotoStatement): string = discard #TODO(gen:CsGotoStatement)
