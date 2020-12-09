import ../types, uuids, options
type CsPrefixUnaryExpression* = ref object of CsObject #TODO(type:CsPrefixUnaryExpression)

proc newCs*(t: typedesc[CsPrefixUnaryExpression]; name: string): CsPrefixUnaryExpression =
  new result
  result.id = uuids.genUUID #TODO(create:CsPrefixUnaryExpression)

proc extract*(t: typedesc[CsPrefixUnaryExpression]; info: Info): CsPrefixUnaryExpression = discard #TODO(extract:CsPrefixUnaryExpression)

proc add*(parent: var CsPrefixUnaryExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsPrefixUnaryExpression; item: Dummy) =
  discard # TODO(add:CsPrefixUnaryExpression)
  # item.parentId = parent.id

proc gen*(c: var CsPrefixUnaryExpression): string = discard #TODO(gen:CsPrefixUnaryExpression)
