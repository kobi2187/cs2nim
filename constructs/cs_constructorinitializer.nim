import ../types
type CsConstructorInitializer* = ref object of CsObject #TODO(type:CsConstructorInitializer)

proc newCs*(t: typedesc[CsConstructorInitializer]; name: string): CsConstructorInitializer =
  new result #TODO(create:CsConstructorInitializer)

proc extract*(t: typedesc[CsConstructorInitializer]; info: Info): CsConstructorInitializer = discard #TODO(extract:CsConstructorInitializer)

proc add*(parent: var CsConstructorInitializer; item: Dummy) = discard # TODO(add:CsConstructorInitializer)

proc gen*(c: var CsConstructorInitializer): string = discard #TODO(gen:CsConstructorInitializer)
