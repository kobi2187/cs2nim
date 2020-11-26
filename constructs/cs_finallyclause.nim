import ../types
type CsFinallyClause* = ref object of CsObject #TODO(type:CsFinallyClause)

proc newCs*(t: typedesc[CsFinallyClause]; name: string): CsFinallyClause =
  new result #TODO(create:CsFinallyClause)

proc extract*(t: typedesc[CsFinallyClause]; info: Info): CsFinallyClause = discard #TODO(extract:CsFinallyClause)

proc add*(parent: var Dummy; item: CsFinallyClause) = discard # TODO(add:CsFinallyClause)

proc gen*(c: var CsFinallyClause): string = discard #TODO(gen:CsFinallyClause)
