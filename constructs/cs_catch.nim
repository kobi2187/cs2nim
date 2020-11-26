type CsCatch* = ref object of CsObject #TODO(type:CsCatch)

proc newCs*(t: typedesc[CsCatch]; name: string): CsCatch =
  new result #TODO(create:CsCatch)

proc extract*(t: typedesc[CsCatch]; info: Info): CsCatch = discard #TODO(extract:CsCatch)

proc add*(parent: var Dummy; item: CsCatch) = discard # TODO(add:CsCatch)

proc gen*(c: var CsCatch): string = discard #TODO(gen:CsCatch)