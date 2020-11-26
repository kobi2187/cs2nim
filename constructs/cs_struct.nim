type CsStruct* = ref object of CsObject #TODO(type:CsStruct)

proc newCs*(t: typedesc[CsStruct]; name: string): CsStruct =
  new result #TODO(create:CsStruct)

proc extract*(t: typedesc[CsStruct]; info: Info): CsStruct = discard #TODO(extract:CsStruct)

proc add*(parent: var Dummy; item: CsStruct) = discard # TODO(add:CsStruct)

proc gen*(c: var CsStruct): string = discard #TODO(gen:CsStruct)