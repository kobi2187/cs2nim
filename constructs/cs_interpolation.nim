import ../types, uuids, options
type CsInterpolation* = ref object of CsObject #TODO(type:CsInterpolation)

proc newCs*(t: typedesc[CsInterpolation]; name: string): CsInterpolation =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsInterpolation)

proc extract*(t: typedesc[CsInterpolation]; info: Info): CsInterpolation = discard #TODO(extract:CsInterpolation)

proc add*(parent: var CsInterpolation; item: Dummy) =
  discard # TODO(add:CsInterpolation)
  # item.parentId = parent.id
proc add*(parent: var CsInterpolation; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsInterpolation): string = discard #TODO(gen:CsInterpolation)
