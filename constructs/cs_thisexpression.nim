import ../types

type CsThisExpression* = ref object of CsObject #TODO(type:CsThisExpression)

proc newCs*(t: typedesc[CsThisExpression]; name: string): CsThisExpression =
  new result #TODO(create:CsThisExpression)

proc extract*(t: typedesc[CsThisExpression]; info: Info): CsThisExpression = discard #TODO(extract:CsThisExpression)

proc add*(parent: var CsThisExpression; item: Dummy) = discard # TODO(add:CsThisExpression)

proc gen*(c: var CsThisExpression): string = discard #TODO(gen:CsThisExpression)
