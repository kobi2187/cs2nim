import ../types
type CsInterpolatedStringText* = ref object of CsObject #TODO(type:CsInterpolatedStringText)

proc newCs*(t: typedesc[CsInterpolatedStringText]; name: string): CsInterpolatedStringText =
  new result #TODO(create:CsInterpolatedStringText)

proc extract*(t: typedesc[CsInterpolatedStringText]; info: Info): CsInterpolatedStringText = discard #TODO(extract:CsInterpolatedStringText)

proc add*(parent: var Dummy; item: CsInterpolatedStringText) = discard # TODO(add:CsInterpolatedStringText)

proc gen*(c: var CsInterpolatedStringText): string = discard #TODO(gen:CsInterpolatedStringText)
