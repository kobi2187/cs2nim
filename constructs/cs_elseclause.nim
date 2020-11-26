import ../types
type CsElseClause* = ref object of CsObject #TODO(type:CsElseClause)

proc newCs*(t: typedesc[CsElseClause]; name: string): CsElseClause =
  new result #TODO(create:CsElseClause)

proc extract*(t: typedesc[CsElseClause]; info: Info): CsElseClause = discard #TODO(extract:CsElseClause)

proc add*(parent: var Dummy; item: CsElseClause) = discard # TODO(add:CsElseClause)

proc gen*(c: var CsElseClause): string = discard #TODO(gen:CsElseClause)
