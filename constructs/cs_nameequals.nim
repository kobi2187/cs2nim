import ../types
type CsNameEquals* = ref object of CsObject #TODO(type:CsNameEquals)

proc newCs*(t: typedesc[CsNameEquals]; name: string): CsNameEquals =
  new result #TODO(create:CsNameEquals)

proc extract*(t: typedesc[CsNameEquals]; info: Info): CsNameEquals = discard #TODO(extract:CsNameEquals)

proc add*(parent: var CsNameEquals; item: Dummy) = discard # TODO(add:CsNameEquals)

proc gen*(c: var CsNameEquals): string = discard #TODO(gen:CsNameEquals)
