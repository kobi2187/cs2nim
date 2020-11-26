type CsFixedStatement* = ref object of CsObject #TODO(type:CsFixedStatement)

proc newCs*(t: typedesc[CsFixedStatement]; name: string): CsFixedStatement =
  new result #TODO(create:CsFixedStatement)

proc extract*(t: typedesc[CsFixedStatement]; info: Info): CsFixedStatement = discard #TODO(extract:CsFixedStatement)

proc add*(parent: var Dummy; item: CsFixedStatement) = discard # TODO(add:CsFixedStatement)

proc gen*(c: var CsFixedStatement): string = discard #TODO(gen:CsFixedStatement)