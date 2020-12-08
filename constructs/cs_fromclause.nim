import ../types, uuids, options
type CsFromClause* = ref object of CsObject #TODO(type:CsFromClause)

proc newCs*(t: typedesc[CsFromClause]; name: string): CsFromClause =
  new result
  result.id = uuids.genUUID #TODO(create:CsFromClause)

proc extract*(t: typedesc[CsFromClause]; info: Info): CsFromClause = discard #TODO(extract:CsFromClause)

proc add*(parent: var CsFromClause; item: Dummy) =
  discard # TODO(add:CsFromClause)
  # item.parentId = parent.id

proc gen*(c: var CsFromClause): string = discard #TODO(gen:CsFromClause)
