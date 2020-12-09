import ../types, uuids, options
type CsWhereClause* = ref object of CsObject #TODO(type:CsWhereClause)

proc newCs*(t: typedesc[CsWhereClause]; name: string): CsWhereClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsWhereClause)

proc extract*(t: typedesc[CsWhereClause]; info: Info): CsWhereClause = discard #TODO(extract:CsWhereClause)

proc add*(parent: var CsWhereClause; item: Dummy) =
  discard # TODO(add:CsWhereClause)
  # item.parentId = parent.id
proc add*(parent: var CsWhereClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsWhereClause): string = discard #TODO(gen:CsWhereClause)
