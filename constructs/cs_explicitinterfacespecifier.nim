import ../types
type CsExplicitInterfaceSpecifier* = ref object of CsObject #TODO(type:CsExplicitInterfaceSpecifier)

proc newCs*(t: typedesc[CsExplicitInterfaceSpecifier]; name: string): CsExplicitInterfaceSpecifier =
  new result #TODO(create:CsExplicitInterfaceSpecifier)

proc extract*(t: typedesc[CsExplicitInterfaceSpecifier]; info: Info): CsExplicitInterfaceSpecifier = discard #TODO(extract:CsExplicitInterfaceSpecifier)

proc add*(parent: var Dummy; item: CsExplicitInterfaceSpecifier) = discard # TODO(add:CsExplicitInterfaceSpecifier)

proc gen*(c: var CsExplicitInterfaceSpecifier): string = discard #TODO(gen:CsExplicitInterfaceSpecifier)
