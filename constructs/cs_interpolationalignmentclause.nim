import ../types, uuids, options
type CsInterpolationAlignmentClause* = ref object of CsObject #TODO(type:CsInterpolationAlignmentClause)

proc newCs*(t: typedesc[CsInterpolationAlignmentClause]; name: string): CsInterpolationAlignmentClause =
  new result
  result.id = uuids.genUUID #TODO(create:CsInterpolationAlignmentClause)

proc extract*(t: typedesc[CsInterpolationAlignmentClause]; info: Info): CsInterpolationAlignmentClause = discard #TODO(extract:CsInterpolationAlignmentClause)

proc add*(parent: var CsInterpolationAlignmentClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsInterpolationAlignmentClause; item: Dummy) =
  discard # TODO(add:CsInterpolationAlignmentClause)
  # item.parentId = parent.id

proc gen*(c: var CsInterpolationAlignmentClause): string = discard #TODO(gen:CsInterpolationAlignmentClause)
