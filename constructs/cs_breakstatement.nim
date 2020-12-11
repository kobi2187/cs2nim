import ../types, ../state_utils, uuids, options
type CsBreakStatement* = ref object of CsObject #TODO(type:CsBreakStatement)

proc newCs*(t: typedesc[CsBreakStatement]; name: string): CsBreakStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsBreakStatement)

proc extract*(t: typedesc[CsBreakStatement]; info: Info): CsBreakStatement = discard #TODO(extract:CsBreakStatement)

proc add*(parent: var CsBreakStatement; item: Dummy) =
  discard # TODO(add:CsBreakStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsBreakStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsBreakStatement): string = discard #TODO(gen:CsBreakStatement)
