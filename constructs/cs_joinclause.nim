import ../types
type CsJoinClause* = ref object of CsObject #TODO(type:CsJoinClause)

proc newCs*(t: typedesc[CsJoinClause]; name: string): CsJoinClause =
  new result #TODO(create:CsJoinClause)

proc extract*(t: typedesc[CsJoinClause]; info: Info): CsJoinClause = discard #TODO(extract:CsJoinClause)

proc add*(parent: var Dummy; item: CsJoinClause) = discard # TODO(add:CsJoinClause)

proc gen*(c: var CsJoinClause): string = discard #TODO(gen:CsJoinClause)
