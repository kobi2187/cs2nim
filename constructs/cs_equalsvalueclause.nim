import ../types, uuids, options
type CsEqualsValueClause* = ref object of CsObject #TODO(type:CsEqualsValueClause)

proc newCs*(t: typedesc[CsEqualsValueClause]; name: string): CsEqualsValueClause =
  new result
  result.id = uuids.genUUID #TODO(create:CsEqualsValueClause)

proc extract*(t: typedesc[CsEqualsValueClause]; info: Info): CsEqualsValueClause = discard #TODO(extract:CsEqualsValueClause)

proc add*(parent: var CsEqualsValueClause; item: Dummy) =
  discard # TODO(add:CsEqualsValueClause)
  # item.parentId = parent.id

proc gen*(c: var CsEqualsValueClause): string = discard #TODO(gen:CsEqualsValueClause)
