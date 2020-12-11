import ../types, ../state_utils, uuids, options
type CsFinallyClause* = ref object of CsObject #TODO(type:CsFinallyClause)

proc newCs*(t: typedesc[CsFinallyClause]; name: string): CsFinallyClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsFinallyClause)

proc extract*(t: typedesc[CsFinallyClause]; info: Info): CsFinallyClause = discard #TODO(extract:CsFinallyClause)

proc add*(parent: var CsFinallyClause; item: Dummy) =
  discard # TODO(add:CsFinallyClause)
  # item.parentId = parent.id
# proc add*(parent: var CsFinallyClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsFinallyClause): string = discard #TODO(gen:CsFinallyClause)
