import ../types, uuids, options
type CsConstructorConstraint* = ref object of CsObject #TODO(type:CsConstructorConstraint)

proc newCs*(t: typedesc[CsConstructorConstraint]; name: string): CsConstructorConstraint =
  new result
  result.id = uuids.genUUID #TODO(create:CsConstructorConstraint)

proc extract*(t: typedesc[CsConstructorConstraint]; info: Info): CsConstructorConstraint = discard #TODO(extract:CsConstructorConstraint)

proc add*(parent: var CsConstructorConstraint; item: Dummy) =
  discard # TODO(add:CsConstructorConstraint)
  # item.parentId = parent.id
proc add*(parent: var CsConstructorConstraint; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsConstructorConstraint): string = discard #TODO(gen:CsConstructorConstraint)
