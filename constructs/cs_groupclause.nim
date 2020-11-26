import ../types
type CsGroupClause* = ref object of CsObject #TODO(type:CsGroupClause)

proc newCs*(t: typedesc[CsGroupClause]; name: string): CsGroupClause =
  new result #TODO(create:CsGroupClause)

proc extract*(t: typedesc[CsGroupClause]; info: Info): CsGroupClause = discard #TODO(extract:CsGroupClause)

proc add*(parent: var Dummy; item: CsGroupClause) = discard # TODO(add:CsGroupClause)

proc gen*(c: var CsGroupClause): string = discard #TODO(gen:CsGroupClause)
