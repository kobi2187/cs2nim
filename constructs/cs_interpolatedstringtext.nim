import ../types, uuids, options
type CsInterpolatedStringText* = ref object of CsObject #TODO(type:CsInterpolatedStringText)

proc newCs*(t: typedesc[CsInterpolatedStringText]; name: string): CsInterpolatedStringText =
  new result
  result.id = uuids.genUUID #TODO(create:CsInterpolatedStringText)

proc extract*(t: typedesc[CsInterpolatedStringText]; info: Info): CsInterpolatedStringText = discard #TODO(extract:CsInterpolatedStringText)

proc add*(parent: var CsInterpolatedStringText; item: Dummy) =
  discard # TODO(add:CsInterpolatedStringText)
  # item.parentId = parent.id
proc add*(parent: var CsInterpolatedStringText; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsInterpolatedStringText): string = discard #TODO(gen:CsInterpolatedStringText)
