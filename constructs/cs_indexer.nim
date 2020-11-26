type CsIndexer* = ref object of CsObject #TODO(type:CsIndexer)

proc newCs*(t: typedesc[CsIndexer]; name: string): CsIndexer =
  new result #TODO(create:CsIndexer)

proc extract*(t: typedesc[CsIndexer]; info: Info): CsIndexer = discard #TODO(extract:CsIndexer)

proc add*(parent: var Dummy; item: CsIndexer) = discard # TODO(add:CsIndexer)

proc gen*(c: var CsIndexer): string = discard #TODO(gen:CsIndexer)