import ../types, uuids, options
type CsLetClause* = ref object of CsObject #TODO(type:CsLetClause)

proc newCs*(t: typedesc[CsLetClause]; name: string): CsLetClause =
  new result
  result.id = uuids.genUUID #TODO(create:CsLetClause)

proc extract*(t: typedesc[CsLetClause]; info: Info): CsLetClause = discard #TODO(extract:CsLetClause)

proc add*(parent: var CsLetClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsLetClause; item: Dummy) =
  discard # TODO(add:CsLetClause)
  # item.parentId = parent.id

proc gen*(c: var CsLetClause): string = discard #TODO(gen:CsLetClause)
