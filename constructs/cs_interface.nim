import ../types, cs_property
type CsInterface* = ref object of CsObject #TODO(type:CsInterface)

proc newCs*(t: typedesc[CsInterface]; name: string): CsInterface =
  new result #TODO(create:CsInterface)

proc extract*(t: typedesc[CsInterface]; info: Info): CsInterface = discard #TODO(extract:CsInterface)


proc add*(parent: var CsInterface; item: CsProperty) = discard # TODO(add:CsInterface)



proc gen*(c: var CsInterface): string = discard #TODO(gen:CsInterface)
