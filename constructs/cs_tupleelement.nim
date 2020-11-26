type CsTupleElement* = ref object of CsObject #TODO(type:CsTupleElement)

proc newCs*(t: typedesc[CsTupleElement]; name: string): CsTupleElement =
  new result #TODO(create:CsTupleElement)

proc extract*(t: typedesc[CsTupleElement]; info: Info): CsTupleElement = discard #TODO(extract:CsTupleElement)

proc add*(parent: var Dummy; item: CsTupleElement) = discard # TODO(add:CsTupleElement)

proc gen*(c: var CsTupleElement): string = discard #TODO(gen:CsTupleElement)