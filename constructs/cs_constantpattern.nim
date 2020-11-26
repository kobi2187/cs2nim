import ../types
type CsConstantPattern* = ref object of CsObject #TODO(type:CsConstantPattern)

proc newCs*(t: typedesc[CsConstantPattern]; name: string): CsConstantPattern =
  new result #TODO(create:CsConstantPattern)

proc extract*(t: typedesc[CsConstantPattern]; info: Info): CsConstantPattern = discard #TODO(extract:CsConstantPattern)

proc add*(parent: var Dummy; item: CsConstantPattern) = discard # TODO(add:CsConstantPattern)

proc gen*(c: var CsConstantPattern): string = discard #TODO(gen:CsConstantPattern)
