type CsCatchClause* = ref object of CsObject #TODO(type:CsCatchClause)

proc newCs*(t: typedesc[CsCatchClause]; name: string): CsCatchClause =
  new result #TODO(create:CsCatchClause)

proc extract*(t: typedesc[CsCatchClause]; info: Info): CsCatchClause = discard #TODO(extract:CsCatchClause)

proc add*(parent: var Dummy; item: CsCatchClause) = discard # TODO(add:CsCatchClause)

proc gen*(c: var CsCatchClause): string = discard #TODO(gen:CsCatchClause)