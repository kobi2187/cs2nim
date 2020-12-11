import ../types, ../state_utils, uuids, options
type CsTypeConstraint* = ref object of CsObject #TODO(type:CsTypeConstraint)

proc newCs*(t: typedesc[CsTypeConstraint]; name: string): CsTypeConstraint =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsTypeConstraint)

proc extract*(t: typedesc[CsTypeConstraint]; info: Info): CsTypeConstraint = discard #TODO(extract:CsTypeConstraint)

proc add*(parent: var CsTypeConstraint; item: Dummy) =
  discard # TODO(add:CsTypeConstraint)
  # item.parentId = parent.id
# proc add*(parent: var CsTypeConstraint; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTypeConstraint): string = discard #TODO(gen:CsTypeConstraint)
