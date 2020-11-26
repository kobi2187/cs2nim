import ../types
type CsFromClause* = ref object of CsObject #TODO(type:CsFromClause)

proc newCs*(t: typedesc[CsFromClause]; name: string): CsFromClause =
  new result #TODO(create:CsFromClause)

proc extract*(t: typedesc[CsFromClause]; info: Info): CsFromClause = discard #TODO(extract:CsFromClause)

proc add*(parent: var Dummy; item: CsFromClause) = discard # TODO(add:CsFromClause)

proc gen*(c: var CsFromClause): string = discard #TODO(gen:CsFromClause)
