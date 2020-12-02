import ../types
type CsAwaitExpression* = ref object of CsObject #TODO(type:CsAwaitExpression)

proc newCs*(t: typedesc[CsAwaitExpression]; name: string): CsAwaitExpression =
  new result #TODO(create:CsAwaitExpression)

proc extract*(t: typedesc[CsAwaitExpression]; info: Info): CsAwaitExpression = discard #TODO(extract:CsAwaitExpression)

proc add*(parent: var CsAwaitExpression; item: Dummy) = discard # TODO(add:CsAwaitExpression)

proc gen*(c: var CsAwaitExpression): string = discard #TODO(gen:CsAwaitExpression)
