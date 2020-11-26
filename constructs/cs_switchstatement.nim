import ../types
type CsSwitchStatement* = ref object of CsObject #TODO(type:CsSwitchStatement)

proc newCs*(t: typedesc[CsSwitchStatement]; name: string): CsSwitchStatement =
  new result #TODO(create:CsSwitchStatement)

proc extract*(t: typedesc[CsSwitchStatement]; info: Info): CsSwitchStatement = discard #TODO(extract:CsSwitchStatement)

proc add*(parent: var Dummy; item: CsSwitchStatement) = discard # TODO(add:CsSwitchStatement)

proc gen*(c: var CsSwitchStatement): string = discard #TODO(gen:CsSwitchStatement)
