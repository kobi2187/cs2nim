import ../types
type CsNameColon* = ref object of CsObject #TODO(type:CsNameColon)

proc newCs*(t: typedesc[CsNameColon]; name: string): CsNameColon =
  new result #TODO(create:CsNameColon)

proc extract*(t: typedesc[CsNameColon]; info: Info): CsNameColon = discard #TODO(extract:CsNameColon)

proc add*(parent: var CsNameColon; item: Dummy) = discard # TODO(add:CsNameColon)

proc gen*(c: var CsNameColon): string = discard #TODO(gen:CsNameColon)
