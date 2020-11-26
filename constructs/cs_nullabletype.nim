import ../types
type CsNullableType* = ref object of CsObject #TODO(type:CsNullableType)

proc newCs*(t: typedesc[CsNullableType]; name: string): CsNullableType =
  new result #TODO(create:CsNullableType)

proc extract*(t: typedesc[CsNullableType]; info: Info): CsNullableType = discard #TODO(extract:CsNullableType)

proc add*(parent: var Dummy; item: CsNullableType) = discard # TODO(add:CsNullableType)

proc gen*(c: var CsNullableType): string = discard #TODO(gen:CsNullableType)
