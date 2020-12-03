import ../types
type CsUsingDirective* = ref object of CsObject
  name*: string

proc newCs*(t: typedesc[CsUsingDirective]; name: string): CsUsingDirective =
  new result
  result.name = name

proc extract*(t: typedesc[CsUsingDirective]; info: Info): CsUsingDirective =
  let name = info.essentials[0]
  result = newCs(CsUsingDirective, name)

# proc add*(parent: var CsUsingDirective; item: Dummy) =
  # discard # TODO(add:CsUsingDirective)
import strutils
proc gen*(c: CsUsingDirective): string =
  result = "import dotnet/" & c.name.toLowerAscii.replace(".", "/")
