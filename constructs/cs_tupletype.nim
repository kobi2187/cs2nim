import ../types
type CsTupleType* = ref object of CsObject #TODO(type:CsTupleType)

proc newCs*(t: typedesc[CsTupleType]; name: string): CsTupleType =
  new result #TODO(create:CsTupleType)

proc extract*(t: typedesc[CsTupleType]; info: Info): CsTupleType = discard #TODO(extract:CsTupleType)

proc add*(parent: var CsTupleType; item: Dummy) = discard # TODO(add:CsTupleType)

proc gen*(c: var CsTupleType): string = discard #TODO(gen:CsTupleType)
