import ../types, ../state_utils, uuids, options
type CsDeclarationExpression* = ref object of CsObject #TODO(type:CsDeclarationExpression)

proc newCs*(t: typedesc[CsDeclarationExpression]; name: string): CsDeclarationExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsDeclarationExpression)

proc extract*(t: typedesc[CsDeclarationExpression]; info: Info): CsDeclarationExpression = discard #TODO(extract:CsDeclarationExpression)

proc add*(parent: var CsDeclarationExpression; item: Dummy) =
  discard # TODO(add:CsDeclarationExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsDeclarationExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDeclarationExpression): string = discard #TODO(gen:CsDeclarationExpression)
