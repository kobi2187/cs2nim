import ../types, uuids, options
type CsCatchFilterClause* = ref object of CsObject #TODO(type:CsCatchFilterClause)

proc newCs*(t: typedesc[CsCatchFilterClause]; name: string): CsCatchFilterClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsCatchFilterClause)

proc extract*(t: typedesc[CsCatchFilterClause]; info: Info): CsCatchFilterClause = discard #TODO(extract:CsCatchFilterClause)

proc add*(parent: var CsCatchFilterClause; item: Dummy) =
  discard # TODO(add:CsCatchFilterClause)
  # item.parentId = parent.id
proc add*(parent: var CsCatchFilterClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCatchFilterClause): string = discard #TODO(gen:CsCatchFilterClause)
