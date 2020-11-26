import ../types
type CsField* = ref object of CsObject
  name*: string
  ttype*: string
  isPublic*: bool

proc newCs*(t: typedesc[CsField]; name: string): CsField =
  new result #TODO(create:CsField)

proc extract*(t: typedesc[CsField]; info: Info): CsField = discard #TODO(extract:CsField)

proc add*(parent: var Dummy; item: CsField) = discard # TODO(add:CsField)

proc gen*(f: CsField): string =
  result = f.name
  if f.ispublic: result &= "*"
  result &= ": " & f.ttype
