import ../types, ../state_utils, uuids, options
type CsJoinIntoClause* = ref object of CsObject #TODO(type:CsJoinIntoClause)

proc newCs*(t: typedesc[CsJoinIntoClause]; name: string): CsJoinIntoClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsJoinIntoClause)

proc extract*(t: typedesc[CsJoinIntoClause]; info: Info): CsJoinIntoClause = discard #TODO(extract:CsJoinIntoClause)

proc add*(parent: var CsJoinIntoClause; item: Dummy) =
  discard # TODO(add:CsJoinIntoClause)
  # item.parentId = parent.id
# proc add*(parent: var CsJoinIntoClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsJoinIntoClause): string = discard #TODO(gen:CsJoinIntoClause)
