type CsArrowExpressionClause* = ref object of CsObject #TODO(type:CsArrowExpressionClause)

proc newCs*(t: typedesc[CsArrowExpressionClause]; name: string): CsArrowExpressionClause =
  new result #TODO(create:CsArrowExpressionClause)

proc extract*(t: typedesc[CsArrowExpressionClause]; info: Info): CsArrowExpressionClause = discard #TODO(extract:CsArrowExpressionClause)

proc add*(parent: var Dummy; item: CsArrowExpressionClause) = discard # TODO(add:CsArrowExpressionClause)

proc gen*(c: var CsArrowExpressionClause): string = discard #TODO(gen:CsArrowExpressionClause)