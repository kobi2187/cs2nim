import ../types, ../state_utils, uuids, options
type CsSizeOfExpression* = ref object of CsObject #TODO(type:CsSizeOfExpression)

proc newCs*(t: typedesc[CsSizeOfExpression]; name: string): CsSizeOfExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsSizeOfExpression)

proc extract*(t: typedesc[CsSizeOfExpression]; info: Info): CsSizeOfExpression = discard #TODO(extract:CsSizeOfExpression)

proc add*(parent: var CsSizeOfExpression; item: Dummy) =
  discard # TODO(add:CsSizeOfExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsSizeOfExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsSizeOfExpression): string = discard #TODO(gen:CsSizeOfExpression)
