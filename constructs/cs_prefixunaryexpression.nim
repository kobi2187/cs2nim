import ../types
type CsPrefixUnaryExpression* = ref object of CsObject #TODO(type:CsPrefixUnaryExpression)

proc newCs*(t: typedesc[CsPrefixUnaryExpression]; name: string): CsPrefixUnaryExpression =
  new result #TODO(create:CsPrefixUnaryExpression)

proc extract*(t: typedesc[CsPrefixUnaryExpression]; info: Info): CsPrefixUnaryExpression = discard #TODO(extract:CsPrefixUnaryExpression)

proc add*(parent: var CsPrefixUnaryExpression; item: Dummy) = discard # TODO(add:CsPrefixUnaryExpression)

proc gen*(c: var CsPrefixUnaryExpression): string = discard #TODO(gen:CsPrefixUnaryExpression)
