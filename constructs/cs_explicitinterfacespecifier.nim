import ../types, uuids, options
type CsExplicitInterfaceSpecifier* = ref object of CsObject #TODO(type:CsExplicitInterfaceSpecifier)

proc newCs*(t: typedesc[CsExplicitInterfaceSpecifier]; name: string): CsExplicitInterfaceSpecifier =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.name = name

proc extract*(t: typedesc[CsExplicitInterfaceSpecifier]; info: Info): CsExplicitInterfaceSpecifier = #TODO(extract:CsExplicitInterfaceSpecifier)
  let name = info.essentials[0]
  result = newCs(CsExplicitInterfaceSpecifier, name)

# proc add*(parent: var CsExplicitInterfaceSpecifier; item: Dummy, data:AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsExplicitInterfaceSpecifier; item: Dummy) = discard # TODO(add:CsExplicitInterfaceSpecifier)

# proc gen*(c: var CsExplicitInterfaceSpecifier): string = discard #TODO(gen:CsExplicitInterfaceSpecifier)
