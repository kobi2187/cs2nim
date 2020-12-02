import ../types
type CsAttributeArgument* = ref object of CsObject #TODO(type:CsAttributeArgument)

proc newCs*(t: typedesc[CsAttributeArgument]; name: string): CsAttributeArgument =
  new result #TODO(create:CsAttributeArgument)

proc extract*(t: typedesc[CsAttributeArgument]; info: Info): CsAttributeArgument = discard #TODO(extract:CsAttributeArgument)

proc add*(parent: var CsAttributeArgument; item: Dummy) = discard # TODO(add:CsAttributeArgument)

proc gen*(c: var CsAttributeArgument): string = discard #TODO(gen:CsAttributeArgument)
