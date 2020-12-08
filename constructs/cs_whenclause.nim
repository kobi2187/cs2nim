import ../types, uuids, options
type CsWhenClause* = ref object of CsObject #TODO(type:CsWhenClause)

proc newCs*(t: typedesc[CsWhenClause]; name: string): CsWhenClause =
  new result
  result.id = uuids.genUUID #TODO(create:CsWhenClause)

proc extract*(t: typedesc[CsWhenClause]; info: Info): CsWhenClause = discard #TODO(extract:CsWhenClause)

proc add*(parent: var CsWhenClause; item: Dummy) =
  discard # TODO(add:CsWhenClause)
  # item.parentId = parent.id

proc gen*(c: var CsWhenClause): string = discard #TODO(gen:CsWhenClause)
