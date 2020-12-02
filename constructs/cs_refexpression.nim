import ../types
type CsRefExpression* = ref object of CsObject #TODO(type:CsRefExpression)

proc newCs*(t: typedesc[CsRefExpression]; name: string): CsRefExpression =
  new result #TODO(create:CsRefExpression)

proc extract*(t: typedesc[CsRefExpression]; info: Info): CsRefExpression = discard #TODO(extract:CsRefExpression)

proc add*(parent: var CsRefExpression; item: Dummy) = discard # TODO(add:CsRefExpression)

proc gen*(c: var CsRefExpression): string = discard #TODO(gen:CsRefExpression)
