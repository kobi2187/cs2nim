import ../types
type CsConstructorConstraint* = ref object of CsObject #TODO(type:CsConstructorConstraint)

proc newCs*(t: typedesc[CsConstructorConstraint]; name: string): CsConstructorConstraint =
  new result #TODO(create:CsConstructorConstraint)

proc extract*(t: typedesc[CsConstructorConstraint]; info: Info): CsConstructorConstraint = discard #TODO(extract:CsConstructorConstraint)

proc add*(parent: var CsConstructorConstraint; item: Dummy) = discard # TODO(add:CsConstructorConstraint)

proc gen*(c: var CsConstructorConstraint): string = discard #TODO(gen:CsConstructorConstraint)
