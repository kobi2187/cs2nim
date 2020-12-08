import ../types, uuids, options
type CsJoinClause* = ref object of CsObject #TODO(type:CsJoinClause)

proc newCs*(t: typedesc[CsJoinClause]; name: string): CsJoinClause =
  new result
  result.id = uuids.genUUID #TODO(create:CsJoinClause)

proc extract*(t: typedesc[CsJoinClause]; info: Info): CsJoinClause = discard #TODO(extract:CsJoinClause)

proc add*(parent: var CsJoinClause; item: Dummy) =
  discard # TODO(add:CsJoinClause)
  # item.parentId = parent.id

proc gen*(c: var CsJoinClause): string = discard #TODO(gen:CsJoinClause)
