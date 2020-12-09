import ../types, uuids, options
type CsDeclarationPattern* = ref object of CsObject #TODO(type:CsDeclarationPattern)

proc newCs*(t: typedesc[CsDeclarationPattern]; name: string): CsDeclarationPattern =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsDeclarationPattern)

proc extract*(t: typedesc[CsDeclarationPattern]; info: Info): CsDeclarationPattern = discard #TODO(extract:CsDeclarationPattern)

proc add*(parent: var CsDeclarationPattern; item: Dummy) =
  discard # TODO(add:CsDeclarationPattern)
  # item.parentId = parent.id
proc add*(parent: var CsDeclarationPattern; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDeclarationPattern): string = discard #TODO(gen:CsDeclarationPattern)
