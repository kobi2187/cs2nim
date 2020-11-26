type CsWhenClause* = ref object of CsObject #TODO(type:CsWhenClause)

proc newCs*(t: typedesc[CsWhenClause]; name: string): CsWhenClause =
  new result #TODO(create:CsWhenClause)

proc extract*(t: typedesc[CsWhenClause]; info: Info): CsWhenClause = discard #TODO(extract:CsWhenClause)

proc add*(parent: var Dummy; item: CsWhenClause) = discard # TODO(add:CsWhenClause)

proc gen*(c: var CsWhenClause): string = discard #TODO(gen:CsWhenClause)