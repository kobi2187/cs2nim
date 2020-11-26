type CsWhereClause* = ref object of CsObject #TODO(type:CsWhereClause)

proc newCs*(t: typedesc[CsWhereClause]; name: string): CsWhereClause =
  new result #TODO(create:CsWhereClause)

proc extract*(t: typedesc[CsWhereClause]; info: Info): CsWhereClause = discard #TODO(extract:CsWhereClause)

proc add*(parent: var Dummy; item: CsWhereClause) = discard # TODO(add:CsWhereClause)

proc gen*(c: var CsWhereClause): string = discard #TODO(gen:CsWhereClause)