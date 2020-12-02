import ../types
type CsImplicitArrayCreationExpression* = ref object of CsObject #TODO(type:CsImplicitArrayCreationExpression)

proc newCs*(t: typedesc[CsImplicitArrayCreationExpression]; name: string): CsImplicitArrayCreationExpression =
  new result #TODO(create:CsImplicitArrayCreationExpression)

proc extract*(t: typedesc[CsImplicitArrayCreationExpression]; info: Info): CsImplicitArrayCreationExpression = discard #TODO(extract:CsImplicitArrayCreationExpression)

proc add*(parent: var CsImplicitArrayCreationExpression; item: Dummy) = discard # TODO(add:CsImplicitArrayCreationExpression)

proc gen*(c: var CsImplicitArrayCreationExpression): string = discard #TODO(gen:CsImplicitArrayCreationExpression)
