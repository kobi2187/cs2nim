import ../types
type CsAttribute* = ref object of CsObject #TODO(type:CsAttribute)

proc newCs*(t: typedesc[CsAttribute]; name: string): CsAttribute =
  new result #TODO(create:CsAttribute)

proc extract*(t: typedesc[CsAttribute]; info: Info): CsAttribute = discard #TODO(extract:CsAttribute)

proc add*(parent: var Dummy; item: CsAttribute) = discard # TODO(add:CsAttribute)

proc gen*(c: var CsAttribute): string = discard #TODO(gen:CsAttribute)
