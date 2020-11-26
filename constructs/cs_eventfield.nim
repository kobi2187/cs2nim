type CsEventField* = ref object of CsObject #TODO(type:CsEventField)

proc newCs*(t: typedesc[CsEventField]; name: string): CsEventField =
  new result #TODO(create:CsEventField)

proc extract*(t: typedesc[CsEventField]; info: Info): CsEventField = discard #TODO(extract:CsEventField)

proc add*(parent: var Dummy; item: CsEventField) = discard # TODO(add:CsEventField)

proc gen*(c: var CsEventField): string = discard #TODO(gen:CsEventField)