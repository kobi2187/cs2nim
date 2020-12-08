# hmm, it's actually called a property.

import ../types, uuids, options
type CsField* = ref object of CsObject
  ttype*: string
  isPublic*: bool

proc newCs*(t: typedesc[CsField]; name: string): CsField =
  new result
  result.id = uuids.genUUID #TODO(create:CsField)

proc extract*(t: typedesc[CsField]; info: Info): CsField =
  discard #TODO(extract:CsField)

proc add*(parent: var CsField; item: Dummy) =
  discard # TODO(add:CsField)
  # item.parentId = parent.id

proc gen*(f: CsField): string =
  result = f.name
  if f.ispublic: result &= "*"
  result &= ": " & f.ttype
