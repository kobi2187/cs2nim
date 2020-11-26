import ../types
type CsClassOrStructConstraint* = ref object of CsObject #TODO(type:CsClassOrStructConstraint)

proc newCs*(t: typedesc[CsClassOrStructConstraint]; name: string): CsClassOrStructConstraint =
  new result #TODO(create:CsClassOrStructConstraint)

proc extract*(t: typedesc[CsClassOrStructConstraint]; info: Info): CsClassOrStructConstraint = discard #TODO(extract:CsClassOrStructConstraint)

proc add*(parent: var Dummy; item: CsClassOrStructConstraint) = discard # TODO(add:CsClassOrStructConstraint)

proc gen*(c: var CsClassOrStructConstraint): string = discard #TODO(gen:CsClassOrStructConstraint)
