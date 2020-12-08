import ../types, uuids, options
type CsMemberBindingExpression* = ref object of CsObject #TODO(type:CsMemberBindingExpression)

proc newCs*(t: typedesc[CsMemberBindingExpression]; name: string): CsMemberBindingExpression =
  new result
  result.id = uuids.genUUID #TODO(create:CsMemberBindingExpression)

proc extract*(t: typedesc[CsMemberBindingExpression]; info: Info): CsMemberBindingExpression = discard #TODO(extract:CsMemberBindingExpression)

proc add*(parent: var CsMemberBindingExpression; item: Dummy) =
  discard # TODO(add:CsMemberBindingExpression)
  # item.parentId = parent.id

proc gen*(c: var CsMemberBindingExpression): string = discard #TODO(gen:CsMemberBindingExpression)
