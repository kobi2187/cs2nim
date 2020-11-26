import ../types
type CsRefValueExpression* = ref object of CsObject #TODO(type:CsRefValueExpression)

proc newCs*(t: typedesc[CsRefValueExpression]; name: string): CsRefValueExpression =
  new result #TODO(create:CsRefValueExpression)

proc extract*(t: typedesc[CsRefValueExpression]; info: Info): CsRefValueExpression = discard #TODO(extract:CsRefValueExpression)

proc add*(parent: var Dummy; item: CsRefValueExpression) = discard # TODO(add:CsRefValueExpression)

proc gen*(c: var CsRefValueExpression): string = discard #TODO(gen:CsRefValueExpression)
