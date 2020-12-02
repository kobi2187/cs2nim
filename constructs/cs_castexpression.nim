import ../types
type CsCastExpression* = ref object of CsObject #TODO(type:CsCastExpression)

proc newCs*(t: typedesc[CsCastExpression]; name: string): CsCastExpression =
  new result #TODO(create:CsCastExpression)

proc extract*(t: typedesc[CsCastExpression]; info: Info): CsCastExpression = discard #TODO(extract:CsCastExpression)

proc add*(parent: var CsCastExpression; item: Dummy) = discard # TODO(add:CsCastExpression)

proc gen*(c: var CsCastExpression): string = discard #TODO(gen:CsCastExpression)
