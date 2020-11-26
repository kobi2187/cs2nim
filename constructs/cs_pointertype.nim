type CsPointerType* = ref object of CsObject #TODO(type:CsPointerType)

proc newCs*(t: typedesc[CsPointerType]; name: string): CsPointerType =
  new result #TODO(create:CsPointerType)

proc extract*(t: typedesc[CsPointerType]; info: Info): CsPointerType = discard #TODO(extract:CsPointerType)

proc add*(parent: var Dummy; item: CsPointerType) = discard # TODO(add:CsPointerType)

proc gen*(c: var CsPointerType): string = discard #TODO(gen:CsPointerType)