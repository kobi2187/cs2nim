import ../types
type CsInitializerExpression* = ref object of CsObject #TODO(type:CsInitializerExpression)

proc newCs*(t: typedesc[CsInitializerExpression]; name: string): CsInitializerExpression =
  new result #TODO(create:CsInitializerExpression)

proc extract*(t: typedesc[CsInitializerExpression]; info: Info): CsInitializerExpression = discard #TODO(extract:CsInitializerExpression)

proc add*(parent: var Dummy; item: CsInitializerExpression) = discard # TODO(add:CsInitializerExpression)

proc gen*(c: var CsInitializerExpression): string = discard #TODO(gen:CsInitializerExpression)
