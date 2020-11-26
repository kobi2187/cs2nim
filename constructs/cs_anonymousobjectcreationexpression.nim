import ../types
type CsAnonymousObjectCreationExpression* = ref object of CsObject #TODO(type:CsAnonymousObjectCreationExpression)

proc newCs*(t: typedesc[CsAnonymousObjectCreationExpression]; name: string): CsAnonymousObjectCreationExpression =
  new result #TODO(create:CsAnonymousObjectCreationExpression)

proc extract*(t: typedesc[CsAnonymousObjectCreationExpression]; info: Info): CsAnonymousObjectCreationExpression = discard #TODO(extract:CsAnonymousObjectCreationExpression)

proc add*(parent: var Dummy; item: CsAnonymousObjectCreationExpression) = discard # TODO(add:CsAnonymousObjectCreationExpression)

proc gen*(c: var CsAnonymousObjectCreationExpression): string = discard #TODO(gen:CsAnonymousObjectCreationExpression)
