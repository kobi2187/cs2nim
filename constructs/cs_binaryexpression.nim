import ../types
type CsBinaryExpression* = ref object of CsObject #TODO(type:CsBinaryExpression)

proc newCs*(t: typedesc[CsBinaryExpression]; name: string): CsBinaryExpression =
  new result #TODO(create:CsBinaryExpression)

proc extract*(t: typedesc[CsBinaryExpression]; info: Info): CsBinaryExpression = discard #TODO(extract:CsBinaryExpression)

proc add*(parent: var CsBinaryExpression; item: Dummy) = discard # TODO(add:CsBinaryExpression)

proc gen*(c: var CsBinaryExpression): string = discard #TODO(gen:CsBinaryExpression)
