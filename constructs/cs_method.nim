import ../types, uuids, options
import cs_parameterlist, cs_parameter, cs_predefinedtype, cs_objectcreationexpression


type CsMethod* = ref object of CsObject
  isStatic*: bool
  parentClass*: string
  parameterList*: CsParameterList # seq[CsParameter]
  returnType*: string
  body*: seq[BodyExpr]            # use here inheritance and methods (runtime dispatch).
                                  # seq[Expr] expressions, and each should know how to generate their line. ref objects, and methods.

proc newCs*(t: typedesc[CsMethod]; name: string): CsMethod =
  new result
  result.id = genUUID().some
  result.name = name

proc extract*(t: typedesc[CsMethod]; info: Info): CsMethod =
  let name = info.essentials[0]
  let m = newCs(CsMethod, name)
  result = m
  if info.extras.len > 0:
    let e = info.extras[0]
    echo e
    if e.contains("static"):
      result.isStatic = true

proc add*(parent: var CsMethod; t: CsPredefinedType) =
  parent.returnType = t.name

proc add*(parent: var CsMethod; p: CsParameterList) =
  parent.parameterList = p

proc add*(parent: var CsMethod; item: CsObjectCreationExpression) =
  item.parentId = parent.id
  parent.body.add item
proc add*(parent: var CsMethod; item: CsObjectCreationExpression; data: AllNeededData) = parent.add(item) # TODO

import cs_returnstatement
proc add*(parent: var CsMethod; item: CsReturnStatement) =
  item.parentId = parent.id
  parent.body.add item
proc add*(parent: var CsMethod; item: CsReturnStatement; data: AllNeededData) = parent.add(item) # TODO

import sequtils, strutils

proc addSelfParam(m: var CsMethod) =
  let p = newCs(CsParameter, "this", m.parentClass)
  m.parameterList.parameters.insert(@[p], 0)

proc gen*(m: var CsMethod): string =
  echo "generating method (wip): " & m.name
  if not m.isStatic: result = "method " else: result = "proc "
  if not m.isStatic:
    m.addSelfParam()

  let parameterList = m.parameterList.gen()
  let returnType = if m.returnType != "void": m.returnType else: ""
  let body =
    if m.body.len == 0: "discard"
    else: m.body.mapIt(it.gen()).join("\r\n  ")

  result &= m.name & "(" & parameterList & ")"
  if returnType != "": result &= ": " & returnType
  result &= " ="
  result &= "\r\n  "

  result &= body
