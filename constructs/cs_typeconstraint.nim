import ../types
type CsTypeConstraint* = ref object of CsObject #TODO(type:CsTypeConstraint)

proc newCs*(t: typedesc[CsTypeConstraint]; name: string): CsTypeConstraint =
  new result #TODO(create:CsTypeConstraint)

proc extract*(t: typedesc[CsTypeConstraint]; info: Info): CsTypeConstraint = discard #TODO(extract:CsTypeConstraint)

proc add*(parent: var Dummy; item: CsTypeConstraint) = discard # TODO(add:CsTypeConstraint)

proc gen*(c: var CsTypeConstraint): string = discard #TODO(gen:CsTypeConstraint)
