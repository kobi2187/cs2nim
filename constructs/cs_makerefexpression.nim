import ../types, uuids, options
type CsMakeRefExpression* = ref object of CsObject #TODO(type:CsMakeRefExpression)

proc newCs*(t: typedesc[CsMakeRefExpression]; name: string): CsMakeRefExpression =
  new result
  result.id = uuids.genUUID #TODO(create:CsMakeRefExpression)

proc extract*(t: typedesc[CsMakeRefExpression]; info: Info): CsMakeRefExpression = discard #TODO(extract:CsMakeRefExpression)

proc add*(parent: var CsMakeRefExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsMakeRefExpression; item: Dummy) =
  discard # TODO(add:CsMakeRefExpression)
  # item.parentId = parent.id

proc gen*(c: var CsMakeRefExpression): string = discard #TODO(gen:CsMakeRefExpression)
