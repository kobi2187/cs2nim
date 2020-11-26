type CsQueryBody* = ref object of CsObject #TODO(type:CsQueryBody)

proc newCs*(t: typedesc[CsQueryBody]; name: string): CsQueryBody =
  new result #TODO(create:CsQueryBody)

proc extract*(t: typedesc[CsQueryBody]; info: Info): CsQueryBody = discard #TODO(extract:CsQueryBody)

proc add*(parent: var Dummy; item: CsQueryBody) = discard # TODO(add:CsQueryBody)

proc gen*(c: var CsQueryBody): string = discard #TODO(gen:CsQueryBody)