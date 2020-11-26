import ../types
type CsLocalDeclarationStatement* = ref object of CsObject #TODO(type:CsLocalDeclarationStatement)

proc newCs*(t: typedesc[CsLocalDeclarationStatement]; name: string): CsLocalDeclarationStatement =
  new result #TODO(create:CsLocalDeclarationStatement)

proc extract*(t: typedesc[CsLocalDeclarationStatement]; info: Info): CsLocalDeclarationStatement = discard #TODO(extract:CsLocalDeclarationStatement)

proc add*(parent: var Dummy; item: CsLocalDeclarationStatement) = discard # TODO(add:CsLocalDeclarationStatement)

proc gen*(c: var CsLocalDeclarationStatement): string = discard #TODO(gen:CsLocalDeclarationStatement)
