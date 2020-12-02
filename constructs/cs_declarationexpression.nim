import ../types
type CsDeclarationExpression* = ref object of CsObject #TODO(type:CsDeclarationExpression)

proc newCs*(t: typedesc[CsDeclarationExpression]; name: string): CsDeclarationExpression =
  new result #TODO(create:CsDeclarationExpression)

proc extract*(t: typedesc[CsDeclarationExpression]; info: Info): CsDeclarationExpression = discard #TODO(extract:CsDeclarationExpression)

proc add*(parent: var CsDeclarationExpression; item: Dummy) = discard # TODO(add:CsDeclarationExpression)

proc gen*(c: var CsDeclarationExpression): string = discard #TODO(gen:CsDeclarationExpression)
