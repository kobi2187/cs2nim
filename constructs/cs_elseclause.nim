import ../types, uuids, options
type CsElseClause* = ref object of CsObject #TODO(type:CsElseClause)

proc newCs*(t: typedesc[CsElseClause]; name: string): CsElseClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsElseClause)

proc extract*(t: typedesc[CsElseClause]; info: Info): CsElseClause = discard #TODO(extract:CsElseClause)

proc add*(parent: var CsElseClause; item: Dummy) =
  discard # TODO(add:CsElseClause)
  # item.parentId = parent.id
proc add*(parent: var CsElseClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsElseClause): string = discard #TODO(gen:CsElseClause)
