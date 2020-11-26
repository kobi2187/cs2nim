import ../types
type CsDefaultSwitchLabel* = ref object of CsObject #TODO(type:CsDefaultSwitchLabel)

proc newCs*(t: typedesc[CsDefaultSwitchLabel]; name: string): CsDefaultSwitchLabel =
  new result #TODO(create:CsDefaultSwitchLabel)

proc extract*(t: typedesc[CsDefaultSwitchLabel]; info: Info): CsDefaultSwitchLabel = discard #TODO(extract:CsDefaultSwitchLabel)

proc add*(parent: var Dummy; item: CsDefaultSwitchLabel) = discard # TODO(add:CsDefaultSwitchLabel)

proc gen*(c: var CsDefaultSwitchLabel): string = discard #TODO(gen:CsDefaultSwitchLabel)
