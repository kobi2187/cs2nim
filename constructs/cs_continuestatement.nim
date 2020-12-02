import ../types
type CsContinueStatement* = ref object of CsObject #TODO(type:CsContinueStatement)

proc newCs*(t: typedesc[CsContinueStatement]; name: string): CsContinueStatement =
  new result #TODO(create:CsContinueStatement)

proc extract*(t: typedesc[CsContinueStatement]; info: Info): CsContinueStatement = discard #TODO(extract:CsContinueStatement)

proc add*(parent: var CsContinueStatement; item: Dummy) = discard # TODO(add:CsContinueStatement)

proc gen*(c: var CsContinueStatement): string = discard #TODO(gen:CsContinueStatement)
