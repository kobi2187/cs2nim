import ../types
type CsArgument* = ref object of CsObject #TODO(type:CsArgument)

proc newCs*(t: typedesc[CsArgument]; name: string): CsArgument =
  new result #TODO(create:CsArgument)

proc extract*(t: typedesc[CsArgument]; info: Info): CsArgument = discard #TODO(extract:CsArgument)

proc add*(parent: var Dummy; item: CsArgument) = discard # TODO(add:CsArgument)

proc gen*(c: var CsArgument): string = discard #TODO(gen:CsArgument)
