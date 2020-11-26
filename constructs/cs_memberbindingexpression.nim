type CsMemberBindingExpression* = ref object of CsObject #TODO(type:CsMemberBindingExpression)

proc newCs*(t: typedesc[CsMemberBindingExpression]; name: string): CsMemberBindingExpression =
  new result #TODO(create:CsMemberBindingExpression)

proc extract*(t: typedesc[CsMemberBindingExpression]; info: Info): CsMemberBindingExpression = discard #TODO(extract:CsMemberBindingExpression)

proc add*(parent: var Dummy; item: CsMemberBindingExpression) = discard # TODO(add:CsMemberBindingExpression)

proc gen*(c: var CsMemberBindingExpression): string = discard #TODO(gen:CsMemberBindingExpression)