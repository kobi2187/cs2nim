import ../types, uuids, options
type CsAnonymousObjectCreationExpression* = ref object of CsObject #TODO(type:CsAnonymousObjectCreationExpression)

proc newCs*(t: typedesc[CsAnonymousObjectCreationExpression]; name: string): CsAnonymousObjectCreationExpression =
  new result
  result.id = uuids.genUUID #TODO(create:CsAnonymousObjectCreationExpression)

proc extract*(t: typedesc[CsAnonymousObjectCreationExpression]; info: Info): CsAnonymousObjectCreationExpression = discard #TODO(extract:CsAnonymousObjectCreationExpression)

proc add*(parent: var CsAnonymousObjectCreationExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsAnonymousObjectCreationExpression; item: Dummy) =
  discard # TODO(add:CsAnonymousObjectCreationExpression)
  # item.parentId = parent.id

proc gen*(c: var CsAnonymousObjectCreationExpression): string = discard #TODO(gen:CsAnonymousObjectCreationExpression)
