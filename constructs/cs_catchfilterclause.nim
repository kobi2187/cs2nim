type CsCatchFilterClause* = ref object of CsObject #TODO(type:CsCatchFilterClause)

proc newCs*(t: typedesc[CsCatchFilterClause]; name: string): CsCatchFilterClause =
  new result #TODO(create:CsCatchFilterClause)

proc extract*(t: typedesc[CsCatchFilterClause]; info: Info): CsCatchFilterClause = discard #TODO(extract:CsCatchFilterClause)

proc add*(parent: var Dummy; item: CsCatchFilterClause) = discard # TODO(add:CsCatchFilterClause)

proc gen*(c: var CsCatchFilterClause): string = discard #TODO(gen:CsCatchFilterClause)