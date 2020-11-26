import ../types

type CsMethod* = ref object of CsObject
  name*: string
  isStatic*: bool
  parentClass*: string
  parameterList*: CsParameterList # seq[CsParameter]
  returnType*: string
  body*: seq[string]              # TODO: which type, and how to handle. maybe have lastMethod.addToMethodBody(...)
  ## signature*: CsMethodSignature
  ## body*: CsMethodBody

proc newCs*(t: typedesc[CsMethod]; name: string): CsMethod =
  new result
  result.name = name

proc extract*(t: typedesc[CsMethod]; info: Info): CsMethod =
  let name = info.essentials[0]
  let m = newCs(CsMethod, name)
  result = m

proc add*(parent: var CsClass; m: CsMethod) =
  parent.methods.add m

proc addSelfParam(m: var CsMethod) =
  let p = newCs(CsParameter, "this", m.parentClass)
  m.parameterList.parameters.insert(@[p], 0)

import sequtils
proc gen*(m: var CsMethod): string =
  echo "generating method (wip): " & m.name
  result = "proc "
  if not m.isStatic:
    m.addSelfParam()

  let parameterList = m.parameterList.gen()
  let returnType = m.returnType
  let body = "  discard" # TODO
  result &= m.name & "(" & parameterList & ")"
  if returnType != "": result &= ": " & returnType
  result &= " ="
  result &= "\r\n"

  result &= body
