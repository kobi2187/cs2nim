type CsAnonymousMethodExpression* = ref object of CsObject #TODO(type:CsAnonymousMethodExpression)

proc newCs*(t: typedesc[CsAnonymousMethodExpression]; name: string): CsAnonymousMethodExpression =
  new result #TODO(create:CsAnonymousMethodExpression)

proc extract*(t: typedesc[CsAnonymousMethodExpression]; info: Info): CsAnonymousMethodExpression = discard #TODO(extract:CsAnonymousMethodExpression)

proc add*(parent: var Dummy; item: CsAnonymousMethodExpression) = discard # TODO(add:CsAnonymousMethodExpression)

proc gen*(c: var CsAnonymousMethodExpression): string = discard #TODO(gen:CsAnonymousMethodExpression)