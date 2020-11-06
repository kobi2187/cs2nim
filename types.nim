# types.nim

import tables
import json

type CsObject = object of RootRef
  line: JsonNode
  src: string




type MethodArgument* = object of CsObject
  name*: string
  ttype*: string
  defaultVal*: string

type CsMethodSignature* = object of CsObject
  name*: string
  argList*: seq[MethodArgument]
  returnType*: string

type CsMethodBody* = object of CsObject
  # exprs
  # stmts
  # ret


type CsMethod* = ref object of CsObject
  signature*: CsMethodSignature
  body*: CsMethodBody
  isStatic*: bool

type CsField* = ref object of CsObject
  name*: string
  ttype*: string
  isPublic*: bool

type CsClass* = ref object of CsObject
  name*: string
  fields*: seq[CsField]
  methods*: seq[CsMethod]
  isStatic*: bool

type CsNamespace* = ref object of CsObject
  name*: string
  classes*: seq[CsClass]
  classTable*: TableRef[string, CsClass]

proc newCsNamespace*(name: string): CsNamespace =
  new result
  result.name = name
  # result.classes = @[]
  result.classTable = newTable[string, CsClass]()

type CsRoot* = object
  global*: CsNamespace
  ns*: seq[CsNamespace]
  nsTables*: TableRef[string, CsNamespace]

proc newCsRoot*(): CsRoot =
  result.global = newCsNamespace("default")
  result.ns = @[]
  result.nsTables = newTable[string, CsNamespace]()
