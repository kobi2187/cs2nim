type CsEvent* = ref object of CsObject #TODO(type:CsEvent)

proc newCs*(t: typedesc[CsEvent]; name: string): CsEvent =
  new result #TODO(create:CsEvent)

proc extract*(t: typedesc[CsEvent]; info: Info): CsEvent = discard #TODO(extract:CsEvent)

proc add*(parent: var Dummy; item: CsEvent) = discard # TODO(add:CsEvent)

proc gen*(c: var CsEvent): string = discard #TODO(gen:CsEvent)