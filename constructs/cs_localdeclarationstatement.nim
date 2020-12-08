import ../types, uuids, options
type CsLocalDeclarationStatement* = ref object of BodyExpr

proc newCs*(t: typedesc[CsLocalDeclarationStatement]; name: string): CsLocalDeclarationStatement =
  new result
  result.id = uuids.genUUID().some

proc extract*(t: typedesc[CsLocalDeclarationStatement]; info: Info): CsLocalDeclarationStatement = discard #TODO(extract:CsLocalDeclarationStatement)

proc add*(parent: var CsLocalDeclarationStatement; item: Dummy) =
  discard # TODO(add:CsLocalDeclarationStatement)
  # item.parentId = parent.id

proc gen*(c: var CsLocalDeclarationStatement): string = discard #TODO(gen:CsLocalDeclarationStatement)
