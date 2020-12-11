import ../types, ../state_utils, uuids, options
type CsAliasQualifiedName* = ref object of CsObject #TODO(type:CsAliasQualifiedName)

proc newCs*(t: typedesc[CsAliasQualifiedName]; name: string): CsAliasQualifiedName =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAliasQualifiedName)

proc extract*(t: typedesc[CsAliasQualifiedName]; info: Info): CsAliasQualifiedName = discard #TODO(extract:CsAliasQualifiedName)

proc add*(parent: var CsAliasQualifiedName; item: Dummy) =
  discard # TODO(add:CsAliasQualifiedName)
  # item.parentId = parent.id
# proc add*(parent: var CsAliasQualifiedName; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAliasQualifiedName): string = discard #TODO(gen:CsAliasQualifiedName)
