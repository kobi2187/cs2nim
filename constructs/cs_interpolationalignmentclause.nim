import ../types
type CsInterpolationAlignmentClause* = ref object of CsObject #TODO(type:CsInterpolationAlignmentClause)

proc newCs*(t: typedesc[CsInterpolationAlignmentClause]; name: string): CsInterpolationAlignmentClause =
  new result #TODO(create:CsInterpolationAlignmentClause)

proc extract*(t: typedesc[CsInterpolationAlignmentClause]; info: Info): CsInterpolationAlignmentClause = discard #TODO(extract:CsInterpolationAlignmentClause)

proc add*(parent: var Dummy; item: CsInterpolationAlignmentClause) = discard # TODO(add:CsInterpolationAlignmentClause)

proc gen*(c: var CsInterpolationAlignmentClause): string = discard #TODO(gen:CsInterpolationAlignmentClause)
