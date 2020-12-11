import ../types, ../state_utils, uuids, options
type CsClassOrStructConstraint* = ref object of CsObject #TODO(type:CsClassOrStructConstraint)

proc newCs*(t: typedesc[CsClassOrStructConstraint]; name: string): CsClassOrStructConstraint =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsClassOrStructConstraint)

proc extract*(t: typedesc[CsClassOrStructConstraint]; info: Info): CsClassOrStructConstraint = discard #TODO(extract:CsClassOrStructConstraint)

proc add*(parent: var CsClassOrStructConstraint; item: Dummy) =
  discard # TODO(add:CsClassOrStructConstraint)
  # item.parentId = parent.id
# proc add*(parent: var CsClassOrStructConstraint; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsClassOrStructConstraint): string = discard #TODO(gen:CsClassOrStructConstraint)
