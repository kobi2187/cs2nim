import ../types
type CsInterpolationFormatClause* = ref object of CsObject #TODO(type:CsInterpolationFormatClause)

proc newCs*(t: typedesc[CsInterpolationFormatClause]; name: string): CsInterpolationFormatClause =
  new result #TODO(create:CsInterpolationFormatClause)

proc extract*(t: typedesc[CsInterpolationFormatClause]; info: Info): CsInterpolationFormatClause = discard #TODO(extract:CsInterpolationFormatClause)

proc add*(parent: var CsInterpolationFormatClause; item: Dummy) = discard # TODO(add:CsInterpolationFormatClause)

proc gen*(c: var CsInterpolationFormatClause): string = discard #TODO(gen:CsInterpolationFormatClause)
