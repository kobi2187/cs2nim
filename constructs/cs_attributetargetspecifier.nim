import ../types, uuids, options
type CsAttributeTargetSpecifier* = ref object of CsObject #TODO(type:CsAttributeTargetSpecifier)

proc newCs*(t: typedesc[CsAttributeTargetSpecifier]; name: string): CsAttributeTargetSpecifier =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAttributeTargetSpecifier)

proc extract*(t: typedesc[CsAttributeTargetSpecifier]; info: Info): CsAttributeTargetSpecifier = discard #TODO(extract:CsAttributeTargetSpecifier)

proc add*(parent: var CsAttributeTargetSpecifier; item: Dummy) =
  discard # TODO(add:CsAttributeTargetSpecifier)
  # item.parentId = parent.id
proc add*(parent: var CsAttributeTargetSpecifier; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAttributeTargetSpecifier): string = discard #TODO(gen:CsAttributeTargetSpecifier)
