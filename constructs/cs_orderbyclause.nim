import ../types
type CsOrderByClause* = ref object of CsObject #TODO(type:CsOrderByClause)

proc newCs*(t: typedesc[CsOrderByClause]; name: string): CsOrderByClause =
  new result #TODO(create:CsOrderByClause)

proc extract*(t: typedesc[CsOrderByClause]; info: Info): CsOrderByClause = discard #TODO(extract:CsOrderByClause)

proc add*(parent: var Dummy; item: CsOrderByClause) = discard # TODO(add:CsOrderByClause)

proc gen*(c: var CsOrderByClause): string = discard #TODO(gen:CsOrderByClause)
