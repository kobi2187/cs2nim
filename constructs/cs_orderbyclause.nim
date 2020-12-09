import ../types, uuids, options
type CsOrderByClause* = ref object of CsObject #TODO(type:CsOrderByClause)

proc newCs*(t: typedesc[CsOrderByClause]; name: string): CsOrderByClause =
  new result
  result.id = uuids.genUUID #TODO(create:CsOrderByClause)

proc extract*(t: typedesc[CsOrderByClause]; info: Info): CsOrderByClause = discard #TODO(extract:CsOrderByClause)

proc add*(parent: var CsOrderByClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsOrderByClause; item: Dummy) =
  discard # TODO(add:CsOrderByClause)
  # item.parentId = parent.id

proc gen*(c: var CsOrderByClause): string = discard #TODO(gen:CsOrderByClause)
