import ../types
type CsLetClause* = ref object of CsObject #TODO(type:CsLetClause)

proc newCs*(t: typedesc[CsLetClause]; name: string): CsLetClause =
  new result #TODO(create:CsLetClause)

proc extract*(t: typedesc[CsLetClause]; info: Info): CsLetClause = discard #TODO(extract:CsLetClause)

proc add*(parent: var CsLetClause; item: Dummy) = discard # TODO(add:CsLetClause)

proc gen*(c: var CsLetClause): string = discard #TODO(gen:CsLetClause)
