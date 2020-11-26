type CsDeclarationPattern* = ref object of CsObject #TODO(type:CsDeclarationPattern)

proc newCs*(t: typedesc[CsDeclarationPattern]; name: string): CsDeclarationPattern =
  new result #TODO(create:CsDeclarationPattern)

proc extract*(t: typedesc[CsDeclarationPattern]; info: Info): CsDeclarationPattern = discard #TODO(extract:CsDeclarationPattern)

proc add*(parent: var Dummy; item: CsDeclarationPattern) = discard # TODO(add:CsDeclarationPattern)

proc gen*(c: var CsDeclarationPattern): string = discard #TODO(gen:CsDeclarationPattern)