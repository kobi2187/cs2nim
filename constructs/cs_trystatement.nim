import ../types
type CsTryStatement* = ref object of CsObject #TODO(type:CsTryStatement)

proc newCs*(t: typedesc[CsTryStatement]; name: string): CsTryStatement =
  new result #TODO(create:CsTryStatement)

proc extract*(t: typedesc[CsTryStatement]; info: Info): CsTryStatement = discard #TODO(extract:CsTryStatement)

proc add*(parent: var Dummy; item: CsTryStatement) = discard # TODO(add:CsTryStatement)

proc gen*(c: var CsTryStatement): string = discard #TODO(gen:CsTryStatement)
