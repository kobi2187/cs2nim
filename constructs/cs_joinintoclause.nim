import ../types, uuids, options
type CsJoinIntoClause* = ref object of CsObject #TODO(type:CsJoinIntoClause)

proc newCs*(t: typedesc[CsJoinIntoClause]; name: string): CsJoinIntoClause =
  new result
  result.id = uuids.genUUID #TODO(create:CsJoinIntoClause)

proc extract*(t: typedesc[CsJoinIntoClause]; info: Info): CsJoinIntoClause = discard #TODO(extract:CsJoinIntoClause)

proc add*(parent: var CsJoinIntoClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsJoinIntoClause; item: Dummy) =
  discard # TODO(add:CsJoinIntoClause)
  # item.parentId = parent.id

proc gen*(c: var CsJoinIntoClause): string = discard #TODO(gen:CsJoinIntoClause)
