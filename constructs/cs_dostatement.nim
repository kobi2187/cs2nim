type CsDoStatement* = ref object of CsObject #TODO(type:CsDoStatement)

proc newCs*(t: typedesc[CsDoStatement]; name: string): CsDoStatement =
  new result #TODO(create:CsDoStatement)

proc extract*(t: typedesc[CsDoStatement]; info: Info): CsDoStatement = discard #TODO(extract:CsDoStatement)

proc add*(parent: var Dummy; item: CsDoStatement) = discard # TODO(add:CsDoStatement)

proc gen*(c: var CsDoStatement): string = discard #TODO(gen:CsDoStatement)