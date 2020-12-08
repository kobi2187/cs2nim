import ../types, uuids, options
type CsPredefinedType* = ref object of CsObject

proc newCs*(t: typedesc[CsPredefinedType]; name: string): CsPredefinedType =
  new result
  result.id = genUUID().some
  result.name = name

proc extract*(t: typedesc[CsPredefinedType]; info: Info): CsPredefinedType =
  var name: string
  if info.essentials.len > 0:
    name = info.essentials[0]
  else: name = ""
  result = newCs(CsPredefinedType, name)

proc gen*(c: var CsPredefinedType): string = discard #TODO(gen:CsPredefinedType)
