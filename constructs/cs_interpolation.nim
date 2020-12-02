import ../types
type CsInterpolation* = ref object of CsObject #TODO(type:CsInterpolation)

proc newCs*(t: typedesc[CsInterpolation]; name: string): CsInterpolation =
  new result #TODO(create:CsInterpolation)

proc extract*(t: typedesc[CsInterpolation]; info: Info): CsInterpolation = discard #TODO(extract:CsInterpolation)

proc add*(parent: var CsInterpolation; item: Dummy) = discard # TODO(add:CsInterpolation)

proc gen*(c: var CsInterpolation): string = discard #TODO(gen:CsInterpolation)
