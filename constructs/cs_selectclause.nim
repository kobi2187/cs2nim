type CsSelectClause* = ref object of CsObject #TODO(type:CsSelectClause)

proc newCs*(t: typedesc[CsSelectClause]; name: string): CsSelectClause =
  new result #TODO(create:CsSelectClause)

proc extract*(t: typedesc[CsSelectClause]; info: Info): CsSelectClause = discard #TODO(extract:CsSelectClause)

proc add*(parent: var Dummy; item: CsSelectClause) = discard # TODO(add:CsSelectClause)

proc gen*(c: var CsSelectClause): string = discard #TODO(gen:CsSelectClause)