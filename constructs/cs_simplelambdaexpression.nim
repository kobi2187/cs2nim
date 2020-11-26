import ../types
type CsSimpleLambdaExpression* = ref object of CsObject #TODO(type:CsSimpleLambdaExpression)

proc newCs*(t: typedesc[CsSimpleLambdaExpression]; name: string): CsSimpleLambdaExpression =
  new result #TODO(create:CsSimpleLambdaExpression)

proc extract*(t: typedesc[CsSimpleLambdaExpression]; info: Info): CsSimpleLambdaExpression = discard #TODO(extract:CsSimpleLambdaExpression)

proc add*(parent: var Dummy; item: CsSimpleLambdaExpression) = discard # TODO(add:CsSimpleLambdaExpression)

proc gen*(c: var CsSimpleLambdaExpression): string = discard #TODO(gen:CsSimpleLambdaExpression)
