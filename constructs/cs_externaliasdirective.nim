import ../types, uuids, options
type CsExternAliasDirective* = ref object of CsObject #TODO(type:CsExternAliasDirective)

proc newCs*(t: typedesc[CsExternAliasDirective]; name: string): CsExternAliasDirective =
  new result
  result.id = uuids.genUUID #TODO(create:CsExternAliasDirective)

proc extract*(t: typedesc[CsExternAliasDirective]; info: Info): CsExternAliasDirective = discard #TODO(extract:CsExternAliasDirective)

proc add*(parent: var CsExternAliasDirective; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsExternAliasDirective; item: Dummy) =
  discard # TODO(add:CsExternAliasDirective)
  # item.parentId = parent.id

proc gen*(c: var CsExternAliasDirective): string = discard #TODO(gen:CsExternAliasDirective)
