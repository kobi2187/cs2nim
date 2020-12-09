import ../types, uuids, options
type CsGroupClause* = ref object of CsObject #TODO(type:CsGroupClause)

proc newCs*(t: typedesc[CsGroupClause]; name: string): CsGroupClause =
  new result
  result.id = uuids.genUUID #TODO(create:CsGroupClause)

proc extract*(t: typedesc[CsGroupClause]; info: Info): CsGroupClause = discard #TODO(extract:CsGroupClause)

proc add*(parent: var CsGroupClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsGroupClause; item: Dummy) =
  discard # TODO(add:CsGroupClause)
  # item.parentId = parent.id

proc gen*(c: var CsGroupClause): string = discard #TODO(gen:CsGroupClause)
