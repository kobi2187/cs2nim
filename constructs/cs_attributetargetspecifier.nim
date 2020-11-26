type CsAttributeTargetSpecifier* = ref object of CsObject #TODO(type:CsAttributeTargetSpecifier)

proc newCs*(t: typedesc[CsAttributeTargetSpecifier]; name: string): CsAttributeTargetSpecifier =
  new result #TODO(create:CsAttributeTargetSpecifier)

proc extract*(t: typedesc[CsAttributeTargetSpecifier]; info: Info): CsAttributeTargetSpecifier = discard #TODO(extract:CsAttributeTargetSpecifier)

proc add*(parent: var Dummy; item: CsAttributeTargetSpecifier) = discard # TODO(add:CsAttributeTargetSpecifier)

proc gen*(c: var CsAttributeTargetSpecifier): string = discard #TODO(gen:CsAttributeTargetSpecifier)