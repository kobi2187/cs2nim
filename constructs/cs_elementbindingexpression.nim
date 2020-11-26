import ../types
type CsElementBindingExpression* = ref object of CsObject #TODO(type:CsElementBindingExpression)

proc newCs*(t: typedesc[CsElementBindingExpression]; name: string): CsElementBindingExpression =
  new result #TODO(create:CsElementBindingExpression)

proc extract*(t: typedesc[CsElementBindingExpression]; info: Info): CsElementBindingExpression = discard #TODO(extract:CsElementBindingExpression)

proc add*(parent: var Dummy; item: CsElementBindingExpression) = discard # TODO(add:CsElementBindingExpression)

proc gen*(c: var CsElementBindingExpression): string = discard #TODO(gen:CsElementBindingExpression)
