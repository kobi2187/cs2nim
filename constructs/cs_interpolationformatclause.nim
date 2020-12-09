import ../types, uuids, options
type CsInterpolationFormatClause* = ref object of CsObject #TODO(type:CsInterpolationFormatClause)

proc newCs*(t: typedesc[CsInterpolationFormatClause]; name: string): CsInterpolationFormatClause =
  new result
  result.id = uuids.genUUID #TODO(create:CsInterpolationFormatClause)

proc extract*(t: typedesc[CsInterpolationFormatClause]; info: Info): CsInterpolationFormatClause = discard #TODO(extract:CsInterpolationFormatClause)

proc add*(parent: var CsInterpolationFormatClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsInterpolationFormatClause; item: Dummy) =
  discard # TODO(add:CsInterpolationFormatClause)
  # item.parentId = parent.id

proc gen*(c: var CsInterpolationFormatClause): string = discard #TODO(gen:CsInterpolationFormatClause)
