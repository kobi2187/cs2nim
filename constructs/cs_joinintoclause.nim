import ../types
type CsJoinIntoClause* = ref object of CsObject #TODO(type:CsJoinIntoClause)

proc newCs*(t: typedesc[CsJoinIntoClause]; name: string): CsJoinIntoClause =
  new result #TODO(create:CsJoinIntoClause)

proc extract*(t: typedesc[CsJoinIntoClause]; info: Info): CsJoinIntoClause = discard #TODO(extract:CsJoinIntoClause)

proc add*(parent: var CsJoinIntoClause; item: Dummy) = discard # TODO(add:CsJoinIntoClause)

proc gen*(c: var CsJoinIntoClause): string = discard #TODO(gen:CsJoinIntoClause)
