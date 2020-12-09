import ../types, uuids, options
type CsArrowExpressionClause* = ref object of CsObject #TODO(type:CsArrowExpressionClause)

proc newCs*(t: typedesc[CsArrowExpressionClause]; name: string): CsArrowExpressionClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsArrowExpressionClause)

proc extract*(t: typedesc[CsArrowExpressionClause]; info: Info): CsArrowExpressionClause = discard #TODO(extract:CsArrowExpressionClause)

proc add*(parent: var CsArrowExpressionClause; item: Dummy) =
  discard # TODO(add:CsArrowExpressionClause)
  # item.parentId = parent.id
proc add*(parent: var CsArrowExpressionClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsArrowExpressionClause): string = discard #TODO(gen:CsArrowExpressionClause)
