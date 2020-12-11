# hmm, it's actually called a property.

import ../types, ../state_utils, uuids, options
type CsField* = ref object of CsObject
  ttype*: string
  isPublic*: bool

proc newCs*(t: typedesc[CsField]; name: string): CsField =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsField)

proc extract*(t: typedesc[CsField]; info: Info): CsField =
  discard #TODO(extract:CsField)

proc add*(parent: var CsField; item: Dummy) =
  discard # TODO(add:CsField)
# proc add*(parent: var CsField; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
  # item.parentId = parent.id

proc gen*(f: CsField): string =
  result = f.name
  if f.ispublic: result &= "*"
  result &= ": " & f.ttype
