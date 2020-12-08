import ../types, uuids, options
type CsCatchClause* = ref object of CsObject #TODO(type:CsCatchClause)

proc newCs*(t: typedesc[CsCatchClause]; name: string): CsCatchClause =
  new result
  result.id = uuids.genUUID #TODO(create:CsCatchClause)

proc extract*(t: typedesc[CsCatchClause]; info: Info): CsCatchClause = discard #TODO(extract:CsCatchClause)

proc add*(parent: var CsCatchClause; item: Dummy) =
  discard # TODO(add:CsCatchClause)
  # item.parentId = parent.id

proc gen*(c: var CsCatchClause): string = discard #TODO(gen:CsCatchClause)
