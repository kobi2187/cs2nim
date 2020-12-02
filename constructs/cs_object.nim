import ../types
type CsObject* = ref object of RootRef

proc newCs*(t: typedesc[CsObject]; name: string): CsObject =
  new result
  result.name = name

proc extract*(t: typedesc[CsObject]; info: Info): CsObject = discard #TODO(extract:CsObject)

proc add*(parent: var CsObject; item: Dummy) = discard # TODO(add:CsObject)

proc gen*(c: var CsObject): string = discard #TODO(gen:CsObject)
