import ../types, ../state_utils, uuids, options
type CsAnonymousMethodExpression* = ref object of CsObject #TODO(type:CsAnonymousMethodExpression)

proc newCs*(t: typedesc[CsAnonymousMethodExpression]; name: string): CsAnonymousMethodExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAnonymousMethodExpression)

proc extract*(t: typedesc[CsAnonymousMethodExpression]; info: Info): CsAnonymousMethodExpression = discard #TODO(extract:CsAnonymousMethodExpression)

proc add*(parent: var CsAnonymousMethodExpression; item: Dummy) =
  discard # TODO(add:CsAnonymousMethodExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsAnonymousMethodExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAnonymousMethodExpression): string = discard #TODO(gen:CsAnonymousMethodExpression)
