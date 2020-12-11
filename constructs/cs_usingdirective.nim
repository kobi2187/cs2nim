import ../types, ../state_utils, uuids, options
type CsUsingDirective* = ref object of CsObject

proc newCs*(t: typedesc[CsUsingDirective]; name: string): CsUsingDirective =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.name = name

proc extract*(t: typedesc[CsUsingDirective]; info: Info): CsUsingDirective =
  let name = info.essentials[0]
  result = newCs(CsUsingDirective, name)

proc add*(parent: var CsUsingDirective; item: Dummy) =
  # item.parentId = parent.id
  discard # TODO(add:CsUsingDirective)

# proc add*(parent: var CsUsingDirective; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

import strutils
proc gen*(c: CsUsingDirective): string =
  result = "import dotnet/" & c.name.toLowerAscii.replace(".", "/")
