import ../types, uuids, options
type CsSelectClause* = ref object of CsObject #TODO(type:CsSelectClause)

proc newCs*(t: typedesc[CsSelectClause]; name: string): CsSelectClause =
  new result
  result.id = uuids.genUUID #TODO(create:CsSelectClause)

proc extract*(t: typedesc[CsSelectClause]; info: Info): CsSelectClause = discard #TODO(extract:CsSelectClause)

proc add*(parent: var CsSelectClause; item: Dummy) =
  discard # TODO(add:CsSelectClause)
  # item.parentId = parent.id

proc gen*(c: var CsSelectClause): string = discard #TODO(gen:CsSelectClause)
