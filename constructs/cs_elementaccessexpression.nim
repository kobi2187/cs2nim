import ../types
type CsElementAccessExpression* = ref object of CsObject #TODO(type:CsElementAccessExpression)

proc newCs*(t: typedesc[CsElementAccessExpression]; name: string): CsElementAccessExpression =
  new result #TODO(create:CsElementAccessExpression)

proc extract*(t: typedesc[CsElementAccessExpression]; info: Info): CsElementAccessExpression = discard #TODO(extract:CsElementAccessExpression)

proc add*(parent: var Dummy; item: CsElementAccessExpression) = discard # TODO(add:CsElementAccessExpression)

proc gen*(c: var CsElementAccessExpression): string = discard #TODO(gen:CsElementAccessExpression)
