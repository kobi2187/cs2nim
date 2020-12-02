import ../types
type CsArrayType* = ref object of CsObject #TODO(type:CsArrayType)

proc newCs*(t: typedesc[CsArrayType]; name: string): CsArrayType =
  new result #TODO(create:CsArrayType)

proc extract*(t: typedesc[CsArrayType]; info: Info): CsArrayType = discard #TODO(extract:CsArrayType)

proc add*(parent: var CsArrayType; item: Dummy) = discard # TODO(add:CsArrayType)

proc gen*(c: var CsArrayType): string = discard #TODO(gen:CsArrayType)
