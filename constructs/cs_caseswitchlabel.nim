import ../types
type CsCaseSwitchLabel* = ref object of CsObject #TODO(type:CsCaseSwitchLabel)

proc newCs*(t: typedesc[CsCaseSwitchLabel]; name: string): CsCaseSwitchLabel =
  new result #TODO(create:CsCaseSwitchLabel)

proc extract*(t: typedesc[CsCaseSwitchLabel]; info: Info): CsCaseSwitchLabel = discard #TODO(extract:CsCaseSwitchLabel)

proc add*(parent: var CsCaseSwitchLabel; item: Dummy) = discard # TODO(add:CsCaseSwitchLabel)

proc gen*(c: var CsCaseSwitchLabel): string = discard #TODO(gen:CsCaseSwitchLabel)
