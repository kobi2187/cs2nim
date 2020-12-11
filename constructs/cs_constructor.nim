import ../types, ../state_utils, uuids, options
import cs_parameterlist
import sequtils, strutils
type CsConstructor* = ref object of CsObject
  parentClass*: string
  parameterList*: CsParameterList # seq[CsParameter]
  body*: seq[BodyExpr]

proc newCs*(t: typedesc[CsConstructor]; name: string): CsConstructor =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.name = name

proc extract*(t: typedesc[CsConstructor]; info: Info): CsConstructor =
  let name = info.essentials[0]
  let m = newCs(CsConstructor, name)
  result = m

proc add*(parent: var CsConstructor; item: CsParameterList) =
  item.parentId = parent.id
  parent.parameterList = item

# proc add*(parent: var CsConstructor; item: CsParameterList; data: AllNeededData) = parent.add(item) # TODO



proc gen*(c: var CsConstructor): string =
  echo "generating ctor (wip): (new)" & c.name
  result = "proc "

  let parameterList = c.parameterList.gen()
  let returnType = c.parentClass
  let body =
    if c.body.len == 0: "new result"
    else: c.body.mapIt(it.gen()).join("\r\n  ")

  result &= "new" & c.name & "(" & parameterList & ")"
  if returnType != "": result &= ": " & returnType
  result &= " ="
  result &= "\r\n  "

  result &= body
