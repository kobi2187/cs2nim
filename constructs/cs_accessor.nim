import ../types
type CsAccessor* = ref object of CsObject #TODO(type:CsAccessor)

proc newCs*(t: typedesc[CsAccessor]; name: string): CsAccessor =
  new result #TODO(create:CsAccessor)

proc extract*(t: typedesc[CsAccessor]; info: Info): CsAccessor = discard #TODO(extract:CsAccessor)

proc add*(parent: var CsAccessor; item: Dummy) = discard # TODO(add:CsAccessor)

proc gen*(c: var CsAccessor): string = discard #TODO(gen:CsAccessor)
