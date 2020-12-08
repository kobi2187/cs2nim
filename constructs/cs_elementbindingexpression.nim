import ../types, uuids, options
type CsElementBindingExpression* = ref object of CsObject #TODO(type:CsElementBindingExpression)

proc newCs*(t: typedesc[CsElementBindingExpression]; name: string): CsElementBindingExpression =
  new result
  result.id = uuids.genUUID #TODO(create:CsElementBindingExpression)

proc extract*(t: typedesc[CsElementBindingExpression]; info: Info): CsElementBindingExpression = discard #TODO(extract:CsElementBindingExpression)

proc add*(parent: var CsElementBindingExpression; item: Dummy) =
  discard # TODO(add:CsElementBindingExpression)
  # item.parentId = parent.id

proc gen*(c: var CsElementBindingExpression): string = discard #TODO(gen:CsElementBindingExpression)
