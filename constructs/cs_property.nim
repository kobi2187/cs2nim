import ../types

type CsProperty* = ref object of CsObject #TODO(type:CsProperty)

proc newCs*(t: typedesc[CsProperty]; name: string): CsProperty =
  new result #TODO(create:CsProperty)

proc extract*(t: typedesc[CsProperty]; info: Info): CsProperty = discard #TODO(extract:CsProperty)

proc add*(parent: var Dummy; item: CsProperty) = discard # TODO(add:CsProperty)

proc gen*(c: var CsProperty): string = discard #TODO(gen:CsProperty)
