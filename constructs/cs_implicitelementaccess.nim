import ../types, ../state_utils, uuids, options
type CsImplicitElementAccess* = ref object of CsObject #TODO(type:CsImplicitElementAccess)

proc newCs*(t: typedesc[CsImplicitElementAccess]; name: string): CsImplicitElementAccess =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsImplicitElementAccess)

proc extract*(t: typedesc[CsImplicitElementAccess]; info: Info): CsImplicitElementAccess = discard #TODO(extract:CsImplicitElementAccess)

proc add*(parent: var CsImplicitElementAccess; item: Dummy) =
  discard # TODO(add:CsImplicitElementAccess)
  # item.parentId = parent.id
# proc add*(parent: var CsImplicitElementAccess; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsImplicitElementAccess): string = discard #TODO(gen:CsImplicitElementAccess)
