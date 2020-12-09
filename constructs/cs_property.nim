import ../types, uuids, options
import cs_predefinedtype

type CsProperty* = ref object of CsObject
  retType*: string
  hasGet*: bool
  hasSet*: bool
  parentClass*: string
  bodySet*: string # dunno.
  bodyGet*: string # NOTE: don't know yet what type to put here. maybe something like a method body or a list of expr ?

proc newCs*(t: typedesc[CsProperty]; name: string): CsProperty =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.name = name

proc extract*(t: typedesc[CsProperty]; info: Info): CsProperty =
  let name = info.essentials[0]
  result = newCs(CsProperty, name)
  let cnt = info.essentials[1].parseInt
  if cnt > 0:
    let acc1 = info.extras[0]
    if acc1 == "get": result.hasGet = true
    if acc1 == "set": result.hasSet = true
    if cnt > 1:
      let acc2 = info.extras[1]
      if acc2 == "get": result.hasGet = true
      if acc2 == "set": result.hasSet = true



proc add*(parent: var CsProperty; a: CsPredefinedType) =
  parent.retType = a.name

import strutils
proc gen*(c: CsProperty): string =
  result = "method " & c.name[0].toLowerAscii & c.name[1..^1] & "*(this: " & c.parentClass & "): " & c.retType & " = " &
  "this.u_" & c.name
