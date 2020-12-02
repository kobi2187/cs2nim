import ../types
type CsCasePatternSwitchLabel* = ref object of CsObject #TODO(type:CsCasePatternSwitchLabel)

proc newCs*(t: typedesc[CsCasePatternSwitchLabel]; name: string): CsCasePatternSwitchLabel =
  new result #TODO(create:CsCasePatternSwitchLabel)

proc extract*(t: typedesc[CsCasePatternSwitchLabel]; info: Info): CsCasePatternSwitchLabel = discard #TODO(extract:CsCasePatternSwitchLabel)

proc add*(parent: var CsCasePatternSwitchLabel; item: Dummy) = discard # TODO(add:CsCasePatternSwitchLabel)

proc gen*(c: var CsCasePatternSwitchLabel): string = discard #TODO(gen:CsCasePatternSwitchLabel)
