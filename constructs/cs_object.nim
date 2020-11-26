import ../types
type CsObject* = ref object of CsObject #TODO(type:CsObject)

proc newCs*(t: typedesc[CsObject]; name: string): CsObject =
  new result #TODO(create:CsObject)

proc extract*(t: typedesc[CsObject]; info: Info): CsObject = discard #TODO(extract:CsObject)

proc add*(parent: var Dummy; item: CsObject) = discard # TODO(add:CsObject)

proc gen*(c: var CsObject): string = discard #TODO(gen:CsObject)
