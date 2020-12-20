# {.experimental: "codeReordering".}
import ../types
import ../state

import uuids, options, sets, tables, sequtils, hashes


method add*(a: var ref CsObject, b: CsObject) {.base.} =
  raise newException(Exception, "missing implementation for " & a.typ & ", " & b.typ)


# ============= CsAccessorList ========

type CsAccessor* = ref object of CsObject #TODO(type:CsAccessor)
  kind*:string # get or set
  statementsTxt*:string

type CsAccessorList* = ref object of CsObject #TODO(type:CsAccessorList)
  hasDefaultGet*:bool
  hasGetBody*:bool
  hasDefaultSet*:bool
  hasSetBody*:bool
  getPart*:CsAccessor
  setPart*:CsAccessor

proc newCs*(t: typedesc[CsAccessorList]): CsAccessorList =
  new result
  result.typ = $typeof(t)

import nre,strutils
proc extract*(t: typedesc[CsAccessorList]; info: Info): CsAccessorList = 
  let val =  info.essentials[0]
  result = newCs(CsAccessorList)
  if val.contains("get;"): 
    result.hasDefaultGet = true
    # result.hasGetBody = false
  if val.contains("set;"): 
    result.hasDefaultSet = true
    # result.hasSetBody = false
  if val.contains(re"get\s*{"): echo val; result.hasGetBody = true # TODO: check against real code.
  if val.contains(re"set\s*{"): echo val; result.hasSetBody = true

method add*(parent: var CsAccessorList; item: CsAccessor) =
  assert item.kind in [ "get","set"]
  if item.kind == "get":
    parent.getPart = item

  else:
    parent.setPart = item



# proc add*(parent: var CsAccessorList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO


proc gen*(c: var CsAccessorList): string = assert false #TODO(gen:CsAccessorList)

# ============= CsAccessor ========

proc newCs*(t: typedesc[CsAccessor]): CsAccessor =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsAccessor]; info: Info): CsAccessor = 
  echo info
  result = newCs(CsAccessor)
  # can have kind (get or set) in [0]
  if info.essentials.len > 0:
    result.kind = info.essentials[0]
    # can have body statements! in [1] # maybe they are handled later?
    if info.essentials.len > 1:
      result.statementsTxt = info.essentials[1]
  
  #todo: should find its parent accessorlist, add this field to AllNeededData ( last accessor list)
  

method add*(parent: var CsAccessor; item: Dummy) =
  assert false # TODO(add:CsAccessor)

# proc add*(parent: var CsAccessor; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAccessor): string = assert false #TODO(gen:CsAccessor)

# ============= CsAliasQualifiedName ========

type CsAliasQualifiedName* = ref object of CsObject #TODO(type:CsAliasQualifiedName)

proc newCs*(t: typedesc[CsAliasQualifiedName]; name: string): CsAliasQualifiedName =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAliasQualifiedName)

proc extract*(t: typedesc[CsAliasQualifiedName]; info: Info): CsAliasQualifiedName = assert false #TODO(extract:CsAliasQualifiedName)

method add*(parent: var CsAliasQualifiedName; item: Dummy) =
  assert false # TODO(add:CsAliasQualifiedName)

# proc add*(parent: var CsAliasQualifiedName; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAliasQualifiedName): string = assert false #TODO(gen:CsAliasQualifiedName)

# ============= CsField ========

type CsField* = ref object of CsObject
  ttype*: string
  isPublic*: bool
  isStatic*:bool
  
proc newCs*(t: typedesc[CsField]): CsField =
  new result
  result.typ = $typeof(t)


proc extract*(t: typedesc[CsField]; info: Info): CsField =
  result = newCs(CsField)
  result.name = info.essentials[2]
  result.ttype = info.essentials[1]
  result.isStatic = info.essentials[0].contains("static")
  result.isPublic = info.essentials[0].contains("public") # TODO check what CsDisplay actually provides.

  

method add*(parent: var CsField; item: Dummy) =
  assert false # TODO(add:CsField)
# proc add*(parent: var CsField; item: Dummy; data: AllNeededData) = parent.add(item) # TODO


proc gen*(f: CsField): string =
  result = f.name
  if f.ispublic: result &= "*"
  result &= ": " & f.ttype

# ============= CsAnonymousMethodExpression ========

type CsAnonymousMethodExpression* = ref object of CsObject #TODO(type:CsAnonymousMethodExpression)

proc newCs*(t: typedesc[CsAnonymousMethodExpression]; name: string): CsAnonymousMethodExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAnonymousMethodExpression)

proc extract*(t: typedesc[CsAnonymousMethodExpression]; info: Info): CsAnonymousMethodExpression = assert false #TODO(extract:CsAnonymousMethodExpression)

method add*(parent: var CsAnonymousMethodExpression; item: Dummy) =
  assert false # TODO(add:CsAnonymousMethodExpression)

# proc add*(parent: var CsAnonymousMethodExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAnonymousMethodExpression): string = assert false #TODO(gen:CsAnonymousMethodExpression)

# ============= CsAnonymousObjectCreationExpression ========

type CsAnonymousObjectCreationExpression* = ref object of CsObject #TODO(type:CsAnonymousObjectCreationExpression)

proc newCs*(t: typedesc[CsAnonymousObjectCreationExpression]; name: string): CsAnonymousObjectCreationExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAnonymousObjectCreationExpression)

proc extract*(t: typedesc[CsAnonymousObjectCreationExpression]; info: Info): CsAnonymousObjectCreationExpression = assert false #TODO(extract:CsAnonymousObjectCreationExpression)

method add*(parent: var CsAnonymousObjectCreationExpression; item: Dummy) =
  assert false # TODO(add:CsAnonymousObjectCreationExpression)

# proc add*(parent: var CsAnonymousObjectCreationExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAnonymousObjectCreationExpression): string = assert false #TODO(gen:CsAnonymousObjectCreationExpression)

# ============= CsAnonymousObjectMemberDeclarator ========

type CsAnonymousObjectMemberDeclarator* = ref object of CsObject #TODO(type:CsAnonymousObjectMemberDeclarator)

proc newCs*(t: typedesc[CsAnonymousObjectMemberDeclarator]; name: string): CsAnonymousObjectMemberDeclarator =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAnonymousObjectMemberDeclarator)

proc extract*(t: typedesc[CsAnonymousObjectMemberDeclarator]; info: Info): CsAnonymousObjectMemberDeclarator = assert false #TODO(extract:CsAnonymousObjectMemberDeclarator)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: Dummy) =
  assert false # TODO(add:CsAnonymousObjectMemberDeclarator)

# proc add*(parent: var CsAnonymousObjectMemberDeclarator; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAnonymousObjectMemberDeclarator): string = assert false #TODO(gen:CsAnonymousObjectMemberDeclarator)

# ============= CsArgumentList ========

type CsArgumentList* = ref object of CsObject
  args*: seq[string]
  # args*: seq[CsArgument] # TODO: probably needed, when arguments are more complex. need to see the flow.

import sequtils, strutils
proc newCs*(t: typedesc[CsArgumentList]; args: seq[string]): CsArgumentList =
  new result
  result.typ = $typeof(t)
  # result.args = args.mapIt(it.strip) # now handled from CsArgument

proc extract*(t: typedesc[CsArgumentList]; info: Info): CsArgumentList =
  result = newCs(CsArgumentList, info.essentials[0].split(","))


proc gen*(c: var CsArgumentList): string =
  result = c.args.join(", ")

# ============= CsArgument ========

type CsArgument* = ref object of CsObject #TODO(type:CsArgument)
  value*:string
proc newCs*(t: typedesc[CsArgument]): CsArgument =
  new result
  result.typ = $typeof(t)
#TODO(create:CsArgument)

proc extract*(t: typedesc[CsArgument]; info: Info): CsArgument =
  result = newCs(CsArgument)
  result.value = info.essentials[0]

# proc add*(parent: var CsArgument; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsArgument): string = assert false #TODO(gen:CsArgument)

# ============= CsArrayCreationExpression ========

type CsArrayCreationExpression* = ref object of CsObject #TODO(type:CsArrayCreationExpression)

proc newCs*(t: typedesc[CsArrayCreationExpression]; name: string): CsArrayCreationExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsArrayCreationExpression)

proc extract*(t: typedesc[CsArrayCreationExpression]; info: Info): CsArrayCreationExpression = assert false #TODO(extract:CsArrayCreationExpression)

method add*(parent: var CsArrayCreationExpression; item: Dummy) =
  assert false # TODO(add:CsArrayCreationExpression)

# proc add*(parent: var CsArrayCreationExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsArrayCreationExpression): string = assert false #TODO(gen:CsArrayCreationExpression)

# ============= CsArrayRankSpecifier ========

type CsArrayRankSpecifier* = ref object of CsObject #TODO(type:CsArrayRankSpecifier)

proc newCs*(t: typedesc[CsArrayRankSpecifier]; name: string): CsArrayRankSpecifier =
  new result
  result.typ = $typeof(t)
#TODO(create:CsArrayRankSpecifier)

proc extract*(t: typedesc[CsArrayRankSpecifier]; info: Info): CsArrayRankSpecifier = assert false #TODO(extract:CsArrayRankSpecifier)

method add*(parent: var CsArrayRankSpecifier; item: Dummy) =
  assert false # TODO(add:CsArrayRankSpecifier)

# proc add*(parent: var CsArrayRankSpecifier; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsArrayRankSpecifier): string = assert false #TODO(gen:CsArrayRankSpecifier)

# ============= CsArrayType ========

type CsArrayType* = ref object of CsObject #TODO(type:CsArrayType)

proc newCs*(t: typedesc[CsArrayType]; name: string): CsArrayType =
  new result
  result.typ = $typeof(t)
#TODO(create:CsArrayType)

proc extract*(t: typedesc[CsArrayType]; info: Info): CsArrayType = assert false #TODO(extract:CsArrayType)

method add*(parent: var CsArrayType; item: Dummy) =
  assert false # TODO(add:CsArrayType)

# proc add*(parent: var CsArrayType; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsArrayType): string = assert false #TODO(gen:CsArrayType)

# ============= CsArrowExpressionClause ========

type CsArrowExpressionClause* = ref object of CsObject #TODO(type:CsArrowExpressionClause)

proc newCs*(t: typedesc[CsArrowExpressionClause]; name: string): CsArrowExpressionClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsArrowExpressionClause)

proc extract*(t: typedesc[CsArrowExpressionClause]; info: Info): CsArrowExpressionClause = assert false #TODO(extract:CsArrowExpressionClause)

method add*(parent: var CsArrowExpressionClause; item: Dummy) =
  assert false # TODO(add:CsArrowExpressionClause)

# proc add*(parent: var CsArrowExpressionClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsArrowExpressionClause): string = assert false #TODO(gen:CsArrowExpressionClause)

# ============= CsAssignmentExpression ========

type CsAssignmentExpression* =ref object of BodyExpr
  left*:string # should be some variable
  right*:string # should be var or statement or literal
  # probably following fields provide that. if so, can simply store it in body, with placeholders for following.

proc newCs*(t: typedesc[CsAssignmentExpression]): CsAssignmentExpression =
  new result
  result.typ = $typeof(t)


proc extract*(t: typedesc[CsAssignmentExpression]; info: Info): CsAssignmentExpression = 
  result = newCs(CsAssignmentExpression)
  result.left = info.essentials[0]
  result.right = info.essentials[1]


method add*(parent: var CsAssignmentExpression; item: Dummy) =
  assert false # TODO(add:CsAssignmentExpression)

# proc add*(parent: var CsAssignmentExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAssignmentExpression): string = assert false #TODO(gen:CsAssignmentExpression)

# ============= CsAttributeArgumentList ========

type CsAttributeArgumentList* = ref object of CsObject #TODO(type:CsAttributeArgumentList)

proc newCs*(t: typedesc[CsAttributeArgumentList]; name: string): CsAttributeArgumentList =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAttributeArgumentList)

proc extract*(t: typedesc[CsAttributeArgumentList]; info: Info): CsAttributeArgumentList = assert false #TODO(extract:CsAttributeArgumentList)

method add*(parent: var CsAttributeArgumentList; item: Dummy) =
  assert false # TODO(add:CsAttributeArgumentList)

# proc add*(parent: var CsAttributeArgumentList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAttributeArgumentList): string = assert false #TODO(gen:CsAttributeArgumentList)

# ============= CsAttributeArgument ========

type CsAttributeArgument* = ref object of CsObject #TODO(type:CsAttributeArgument)

proc newCs*(t: typedesc[CsAttributeArgument]; name: string): CsAttributeArgument =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAttributeArgument)

proc extract*(t: typedesc[CsAttributeArgument]; info: Info): CsAttributeArgument = assert false #TODO(extract:CsAttributeArgument)

method add*(parent: var CsAttributeArgument; item: Dummy) =
  assert false # TODO(add:CsAttributeArgument)

# proc add*(parent: var CsAttributeArgument; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAttributeArgument): string = assert false #TODO(gen:CsAttributeArgument)

type CsAttributeList* = ref object of CsObject #TODO(type:CsAttributeList)

proc newCs*(t: typedesc[CsAttributeList]; name: string): CsAttributeList =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAttributeList)

proc extract*(t: typedesc[CsAttributeList]; info: Info): CsAttributeList = assert false #TODO(extract:CsAttributeList)

method add*(parent: var CsAttributeList; item: Dummy) =
  assert false # TODO(add:CsAttributeList)


# proc add*(parent: var CsAttributeList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc gen*(c: var CsAttributeList): string = assert false #TODO(gen:CsAttributeList)

# ============= CsAttribute ========

type CsAttribute* = ref object of CsObject #TODO(type:CsAttribute)

proc newCs*(t: typedesc[CsAttribute]; name: string): CsAttribute =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAttribute)

proc extract*(t: typedesc[CsAttribute]; info: Info): CsAttribute = assert false #TODO(extract:CsAttribute)

method add*(parent: var CsAttribute; item: Dummy) =
  assert false # TODO(add:CsAttribute)

# proc add*(parent: var CsAttribute; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAttribute): string = assert false #TODO(gen:CsAttribute)

# ============= CsAttributeTargetSpecifier ========

type CsAttributeTargetSpecifier* = ref object of CsObject #TODO(type:CsAttributeTargetSpecifier)

proc newCs*(t: typedesc[CsAttributeTargetSpecifier]; name: string): CsAttributeTargetSpecifier =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAttributeTargetSpecifier)

proc extract*(t: typedesc[CsAttributeTargetSpecifier]; info: Info): CsAttributeTargetSpecifier = assert false #TODO(extract:CsAttributeTargetSpecifier)

method add*(parent: var CsAttributeTargetSpecifier; item: Dummy) =
  assert false # TODO(add:CsAttributeTargetSpecifier)

# proc add*(parent: var CsAttributeTargetSpecifier; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAttributeTargetSpecifier): string = assert false #TODO(gen:CsAttributeTargetSpecifier)

# ============= CsAwaitExpression ========

type CsAwaitExpression* = ref object of CsObject #TODO(type:CsAwaitExpression)

proc newCs*(t: typedesc[CsAwaitExpression]; name: string): CsAwaitExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAwaitExpression)

proc extract*(t: typedesc[CsAwaitExpression]; info: Info): CsAwaitExpression = assert false #TODO(extract:CsAwaitExpression)

method add*(parent: var CsAwaitExpression; item: Dummy) =
  assert false # TODO(add:CsAwaitExpression)

# proc add*(parent: var CsAwaitExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAwaitExpression): string = assert false #TODO(gen:CsAwaitExpression)

# ============= CsBaseExpression ========

type CsBaseExpression* = ref object of CsObject #TODO(type:CsBaseExpression)

proc newCs*(t: typedesc[CsBaseExpression]; name: string): CsBaseExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsBaseExpression)

proc extract*(t: typedesc[CsBaseExpression]; info: Info): CsBaseExpression = assert false #TODO(extract:CsBaseExpression)

method add*(parent: var CsBaseExpression; item: Dummy) =
  assert false # TODO(add:CsBaseExpression)

# proc add*(parent: var CsBaseExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsBaseExpression): string = assert false #TODO(gen:CsBaseExpression)

# ============= CsBaseList ========

type CsBaseList* = ref object of CsObject #TODO(type:CsBaseList)
  baseList*: seq[string]

proc newCs*(t: typedesc[CsBaseList]): CsBaseList =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsBaseList]; info: Info): CsBaseList = 
  result = newCs(CsBaseList)
  if info.essentials.len > 0:
    result.baseList = info.essentials[0].split(", ").mapIt(it.strip)

method add*(parent: var CsBaseList; item: Dummy) =
  assert false # TODO(add:CsBaseList)

# proc add*(parent: var CsBaseList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsBaseList): string = assert false #TODO(gen:CsBaseList)

# ============= CsBinaryExpression ========

type CsBinaryExpression* = ref object of CsObject #TODO(type:CsBinaryExpression)

proc newCs*(t: typedesc[CsBinaryExpression]; name: string): CsBinaryExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsBinaryExpression)

proc extract*(t: typedesc[CsBinaryExpression]; info: Info): CsBinaryExpression = assert false #TODO(extract:CsBinaryExpression)

method add*(parent: var CsBinaryExpression; item: Dummy) =
  assert false # TODO(add:CsBinaryExpression)
# proc add*(parent: var CsBinaryExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO


proc gen*(c: var CsBinaryExpression): string = assert false #TODO(gen:CsBinaryExpression)

# ============= CsBracketedArgumentList ========

type CsBracketedArgumentList* = ref object of CsObject #TODO(type:CsBracketedArgumentList)

proc newCs*(t: typedesc[CsBracketedArgumentList]; name: string): CsBracketedArgumentList =
  new result
  result.typ = $typeof(t)
#TODO(create:CsBracketedArgumentList)

proc extract*(t: typedesc[CsBracketedArgumentList]; info: Info): CsBracketedArgumentList = assert false #TODO(extract:CsBracketedArgumentList)

method add*(parent: var CsBracketedArgumentList; item: Dummy) =
  assert false # TODO(add:CsBracketedArgumentList)

# proc add*(parent: var CsBracketedArgumentList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsBracketedArgumentList): string = assert false #TODO(gen:CsBracketedArgumentList)

# ============= CsBracketedParameterList ========

type CsBracketedParameterList* = ref object of CsObject #TODO(type:CsBracketedParameterList)
  plist*:string
proc newCs*(t: typedesc[CsBracketedParameterList]): CsBracketedParameterList =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsBracketedParameterList]; info: Info): CsBracketedParameterList = 
  result = newCs(CsBracketedParameterList) # for indexer, and what else?
  result.plist = info.essentials[0]
  # I suspect parameters will come next. most likely unneeded, i can easily parse that text.

method add*(parent: var CsBracketedParameterList; item: Dummy) =
  assert false # TODO(add:CsBracketedParameterList)

# proc add*(parent: var CsBracketedParameterList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsBracketedParameterList): string = assert false #TODO(gen:CsBracketedParameterList)

# ============= CsBreakStatement ========

type CsBreakStatement* = ref object of CsObject #TODO(type:CsBreakStatement)

proc newCs*(t: typedesc[CsBreakStatement]; name: string): CsBreakStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsBreakStatement)

proc extract*(t: typedesc[CsBreakStatement]; info: Info): CsBreakStatement = assert false #TODO(extract:CsBreakStatement)

method add*(parent: var CsBreakStatement; item: Dummy) =
  assert false # TODO(add:CsBreakStatement)

# proc add*(parent: var CsBreakStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsBreakStatement): string = assert false #TODO(gen:CsBreakStatement)

# ============= CsCasePatternSwitchLabel ========

type CsCasePatternSwitchLabel* = ref object of CsObject #TODO(type:CsCasePatternSwitchLabel)

proc newCs*(t: typedesc[CsCasePatternSwitchLabel]; name: string): CsCasePatternSwitchLabel =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCasePatternSwitchLabel)

proc extract*(t: typedesc[CsCasePatternSwitchLabel]; info: Info): CsCasePatternSwitchLabel = assert false #TODO(extract:CsCasePatternSwitchLabel)

method add*(parent: var CsCasePatternSwitchLabel; item: Dummy) =
  assert false # TODO(add:CsCasePatternSwitchLabel)

# proc add*(parent: var CsCasePatternSwitchLabel; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCasePatternSwitchLabel): string = assert false #TODO(gen:CsCasePatternSwitchLabel)

# ============= CsCaseSwitchLabel ========

type CsCaseSwitchLabel* = ref object of CsObject #TODO(type:CsCaseSwitchLabel)

proc newCs*(t: typedesc[CsCaseSwitchLabel]; name: string): CsCaseSwitchLabel =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCaseSwitchLabel)

proc extract*(t: typedesc[CsCaseSwitchLabel]; info: Info): CsCaseSwitchLabel = assert false #TODO(extract:CsCaseSwitchLabel)

method add*(parent: var CsCaseSwitchLabel; item: Dummy) =
  assert false # TODO(add:CsCaseSwitchLabel)

# proc add*(parent: var CsCaseSwitchLabel; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCaseSwitchLabel): string = assert false #TODO(gen:CsCaseSwitchLabel)

# ============= CsCastExpression ========

type CsCastExpression* = ref object of CsObject #TODO(type:CsCastExpression)

proc newCs*(t: typedesc[CsCastExpression]; name: string): CsCastExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCastExpression)

proc extract*(t: typedesc[CsCastExpression]; info: Info): CsCastExpression = assert false #TODO(extract:CsCastExpression)

method add*(parent: var CsCastExpression; item: Dummy) =
  assert false # TODO(add:CsCastExpression)

# proc add*(parent: var CsCastExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCastExpression): string = assert false #TODO(gen:CsCastExpression)

# ============= CsCatchClause ========

type CsCatchClause* = ref object of CsObject #TODO(type:CsCatchClause)

proc newCs*(t: typedesc[CsCatchClause]; name: string): CsCatchClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCatchClause)

proc extract*(t: typedesc[CsCatchClause]; info: Info): CsCatchClause = assert false #TODO(extract:CsCatchClause)

method add*(parent: var CsCatchClause; item: Dummy) =
  assert false # TODO(add:CsCatchClause)

# proc add*(parent: var CsCatchClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCatchClause): string = assert false #TODO(gen:CsCatchClause)

# ============= CsCatchFilterClause ========

type CsCatchFilterClause* = ref object of CsObject #TODO(type:CsCatchFilterClause)

proc newCs*(t: typedesc[CsCatchFilterClause]; name: string): CsCatchFilterClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCatchFilterClause)

proc extract*(t: typedesc[CsCatchFilterClause]; info: Info): CsCatchFilterClause = assert false #TODO(extract:CsCatchFilterClause)

method add*(parent: var CsCatchFilterClause; item: Dummy) =
  assert false # TODO(add:CsCatchFilterClause)

# proc add*(parent: var CsCatchFilterClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCatchFilterClause): string = assert false #TODO(gen:CsCatchFilterClause)

# ============= CsCatch ========

type CsCatch* = ref object of CsObject #TODO(type:CsCatch)

proc newCs*(t: typedesc[CsCatch]; name: string): CsCatch =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCatch)

proc extract*(t: typedesc[CsCatch]; info: Info): CsCatch = assert false #TODO(extract:CsCatch)

method add*(parent: var CsCatch; item: Dummy) =
  assert false # TODO(add:CsCatch)

# proc add*(parent: var CsCatch; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCatch): string = assert false #TODO(gen:CsCatch)

# ============= CsCheckedExpression ========

type CsCheckedExpression* = ref object of CsObject #TODO(type:CsCheckedExpression)

proc newCs*(t: typedesc[CsCheckedExpression]; name: string): CsCheckedExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCheckedExpression)

proc extract*(t: typedesc[CsCheckedExpression]; info: Info): CsCheckedExpression = assert false #TODO(extract:CsCheckedExpression)

method add*(parent: var CsCheckedExpression; item: Dummy) =
  assert false # TODO(add:CsCheckedExpression)

# proc add*(parent: var CsCheckedExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCheckedExpression): string = assert false #TODO(gen:CsCheckedExpression)

# ============= CsCheckedStatement ========

type CsCheckedStatement* = ref object of CsObject #TODO(type:CsCheckedStatement)

proc newCs*(t: typedesc[CsCheckedStatement]; name: string): CsCheckedStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCheckedStatement)

proc extract*(t: typedesc[CsCheckedStatement]; info: Info): CsCheckedStatement = assert false #TODO(extract:CsCheckedStatement)

method add*(parent: var CsCheckedStatement; item: Dummy) =
  assert false # TODO(add:CsCheckedStatement)

# proc add*(parent: var CsCheckedStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCheckedStatement): string = assert false #TODO(gen:CsCheckedStatement)





type ClassParts* {.pure.} = enum
  Methods, Ctors, Properties, Indexer

type PropertyParts* = enum Getter, Setter

type CsProperty* = ref object of CsObject
  lastAddedTo* : PropertyParts
  retType*: string
  hasGet*: bool
  hasSet*: bool
  parentClass*: string
  acclist*:CsAccessorList
  bodySet*: seq[BodyExpr] # dunno. TODO: this should be strongly connected to acclist (maybe extracted from it?). but lastBodyExpr wants to have constructs readily available like in this seq.
  bodyGet*: seq[BodyExpr] # NOTE: don't know yet what type to* put here. maybe something like a method body or a list of expr ?

method add*(parent:var CsProperty, item:CsAccessorList) = 
  parent.acclist = item


type CsParameter* = ref object of CsObject
  ptype*: string
  isRef*: bool
  isOut*: bool

type CsParameterList* = ref object of CsObject
  parameters*: seq[CsParameter]


type CsMethod* = ref object of CsObject
  isStatic*: bool
  parentClass*: string
  parameterList*: CsParameterList # seq[CsParameter]
  returnType*: string
  # TODO: method body can change to Construct, but limited only to the constructs applicable. (type constraints* with distinct or runtime asserts)
  # TODO: or we check with case ttype string, as before. runtime dispatch etc.
  body*: seq[BodyExpr]            # use here inheritance and methods (runtime dispatch).
                                  # seq[Expr] expressions, and each should know how to generate their line. ref objects, and methods.

type CsConstructorInitializer* = ref object of CsObject #TODO(type:CsConstructorInitializer)

type CsConstructor* = ref object of CsObject
  parentClass*: string
  parameterList*: CsParameterList # seq[CsParameter]
  body*: seq[BodyExpr]
  initializer*: CsConstructorInitializer # for example, when C# ctor passes args to base ctor # don't yet know how to generate in Nim.
  initializerArgList: CsArgumentList

type CsEnumMember* = ref object of CsObject
  value*: string #Option[int]

type CsEnum* = ref object of CsObject
  items*: seq[CsEnumMember]

proc `$`*(e:CsEnum):string=
  result = "enum: (name: " & e.name
  result &= "; items: " & $e.items.len
  result &= " )"

type CsIndexer* = ref object of CsObject
  retType*: string
  varName*: string
  varType*: string
  firstVarType*: string
  aclist*:CsAccessorList
  hasDefaultGet*: bool
  hasDefaultSet*: bool
  hasBody*:bool
  # name*: string  # no, there is no name, but there is an AccessorList, or Accessor, that provide the function body.

method add*(c:var CsIndexer, item: CsAccessorList) = 
  c.aclist=item
# ============= CsClass ========

import sets
type CsClass* = ref object of CsObject
  nsParent*: string
  extends*: string
  implements*: seq[string]
  # fields*: seq[CsField]
  properties*: seq[CsProperty]
  methods*: seq[CsMethod]
  ctors*: seq[CsConstructor]
  # enums*: seq[CsEnum]
  # enumTable*: TableRef[string, CsEnum]
  lastAddedTo*: Option[ClassParts]
  isStatic*: bool
  mods*: HashSet[string]
  indexer*: CsIndexer
  # hasIndexer*: bool
proc `$`*(c:CsClass) :string=
  result = "class: (name: " & c.name
  result &= "; methods: " & $c.methods.len
  result &= "; properties: " & $c.properties.len
  result &= ")"

proc hasIndexer*(c: CsClass): bool = not c.indexer.isNil

proc newCs*(t: typedesc[CsClass]; name: string; base = ""; impls: seq[string] = @[]): CsClass =
  new result
  result.typ = $typeof(t)

  result.name = name
  result.extends = base
  result.implements = impls



proc newCs*(t: typedesc[CsParameter]; a, b: string): CsParameter =
  new result
  result.typ = $typeof(t)
  #
  result.name = a
  result.ptype = b

method addSelfParam(m: var CsMethod) =
  let p = newCs(CsParameter, "this", m.parentClass)
  m.parameterList.parameters.insert(@[p], 0)


proc gen*(p: CsParameter): string =
  result = p.name & ": "
  if p.isRef:
    result &= "var "
  result &= p.ptype.strip


proc gen*(p: CsParameterList): string =
  result = p.parameters.mapIt(it.gen()).join("; ")

proc gen*(m: var CsMethod): string =
  echo "generating method (wip): " & m.name
  if not m.isStatic: result = "method " else: result = "proc "
  if not m.isStatic:
    m.addSelfParam()

  let parameterList = m.parameterList.gen()
  let returnType = if m.returnType != "void": m.returnType else: ""
  let body =
    if m.body.len == 0: "discard"
    else: 
      var lines : seq[string]
      for ln in m.body:
        echo ln.typ
        lines.add ln.gen()
      
      lines.join("\r\n  ")

  result &= m.name & "(" & parameterList & ")"
  if returnType != "": result &= ": " & returnType
  result &= " ="
  result &= "\r\n  "

  result &= body

method gen*(c: var CsConstructor): string =
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



proc gen*(c: var CsIndexer): string =
  echo "generating indexer"
  let x = c.firstVarType.rsplit(".", 1)[^1]
  var setPart, getPart : string
  # let sig = 
  if c.hasDefaultGet:
    getPart= "proc `[]`*(this: var " & x & "; " & c.varName & ": " & c.varType & "): " & c.retType & " = discard"
  if c.hasDefaultSet:
    setPart= "proc `[]=`*(this: var " & x & "; " & c.varName & ": " & c.varType & "; value: " & c.retType & ") = discard"
  
  result &= getPart & "\n" & setPart

proc gen*(c: CsProperty): string =
  result = ""
  if c.hasGet:  
    result &= # this is a getter
      "method " & c.name[0].toLowerAscii & c.name[1..^1] &
      "*(this: " & c.parentClass & "): " & c.retType & " = " &
      "this.u_" & c.name
  if c.hasSet:
    result &= 
      "method " & c.name[0].toLowerAscii & c.name[1..^1] &
      "*(this: " & c.parentClass & ", value: " & c.retType & "): " & c.retType & " = " &
      "this.u_" & c.name & " = value"

proc gen*(c: CsClass): string =
  echo "generating class:" & c.name
  if c.isNil: result = "" else: result &= "type " & c.name & "* = ref object"
  if c.extends != "": result &= " of " & c.extends
  result &= "\r\n\r\n"

  
  echo "methods count: " & $c.methods.len
  echo "generating methods:"
  
  for m in c.methods.mitems:

    result &= m.gen()
    result &= "\r\n"
  echo "ctors count: " & $c.ctors.len
  for ctor in c.ctors.mitems:
    result &= ctor.gen()
    result &= "\r\n"
  echo "has Indexer: " & $c.hasIndexer
  if c.hasIndexer:
    result &= c.indexer.gen()
  echo "has properties: " & $c.properties.len
  for p in c.properties:
    result &= p.gen() & "\r\n"

method add*(parent: var CsClass; m: CsConstructor) =
  echo "adding ctor to class"

  parent.ctors.add m
  parent.lastAddedTo = some(Ctors)
  m.parentClass = parent.name

method add*(parent: var CsClass; m: CsMethod) =
  echo "adding method to class"
  parent.methods.add m
  parent.lastAddedTo = some(Methods)
  m.parentClass = parent.name

method add*(parent: var CsClass; item: CsProperty) =

  parent.properties.add item
  parent.lastAddedTo = some(Properties)
  item.parentClass = parent.name
# proc add*(parent: var CsClass; item: CsProperty; data: AllNeededData) = parent.add(item) # TODO

method add*(parent: var CsClass; item: CsIndexer) =

  parent.indexer = item
  parent.lastAddedTo = some(Indexer)
  # item.parentName = parent.name

method add*(parent: var CsClass; item: CsBaseList) =
  if item.baseList.len>0:
    parent.extends = item.baseList[0]
  if item.baseList.len>1:
    parent.implements = item.baselist[1..^1]


# proc add*(parent: var CsClass; item: CsIndexer; data: AllNeededData) = parent.add(item) # TODO

# ============= CsClassOrStructConstraint ========

type CsClassOrStructConstraint* = ref object of CsObject #TODO(type:CsClassOrStructConstraint)

proc newCs*(t: typedesc[CsClassOrStructConstraint]; name: string): CsClassOrStructConstraint =
  new result
  result.typ = $typeof(t)
#TODO(create:CsClassOrStructConstraint)

proc extract*(t: typedesc[CsClassOrStructConstraint]; info: Info): CsClassOrStructConstraint = assert false #TODO(extract:CsClassOrStructConstraint)

method add*(parent: var CsClassOrStructConstraint; item: Dummy) =
  assert false # TODO(add:CsClassOrStructConstraint)

# proc add*(parent: var CsClassOrStructConstraint; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsClassOrStructConstraint): string = assert false #TODO(gen:CsClassOrStructConstraint)

# ============= CsConditionalAccessExpression ========

type CsConditionalAccessExpression* = ref object of CsObject #TODO(type:CsConditionalAccessExpression)

proc newCs*(t: typedesc[CsConditionalAccessExpression]; name: string): CsConditionalAccessExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsConditionalAccessExpression)

proc extract*(t: typedesc[CsConditionalAccessExpression]; info: Info): CsConditionalAccessExpression = assert false #TODO(extract:CsConditionalAccessExpression)

method add*(parent: var CsConditionalAccessExpression; item: Dummy) =
  assert false # TODO(add:CsConditionalAccessExpression)

# proc add*(parent: var CsConditionalAccessExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsConditionalAccessExpression): string = assert false #TODO(gen:CsConditionalAccessExpression)

# ============= CsConditionalExpression ========

type CsConditionalExpression* = ref object of CsObject #TODO(type:CsConditionalExpression)

proc newCs*(t: typedesc[CsConditionalExpression]; name: string): CsConditionalExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsConditionalExpression)

proc extract*(t: typedesc[CsConditionalExpression]; info: Info): CsConditionalExpression = assert false #TODO(extract:CsConditionalExpression)

method add*(parent: var CsConditionalExpression; item: Dummy) =
  assert false # TODO(add:CsConditionalExpression)

# proc add*(parent: var CsConditionalExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsConditionalExpression): string = assert false #TODO(gen:CsConditionalExpression)

# ============= CsConstantPattern ========

type CsConstantPattern* = ref object of CsObject #TODO(type:CsConstantPattern)

proc newCs*(t: typedesc[CsConstantPattern]; name: string): CsConstantPattern =
  new result
  result.typ = $typeof(t)
#TODO(create:CsConstantPattern)

proc extract*(t: typedesc[CsConstantPattern]; info: Info): CsConstantPattern = assert false #TODO(extract:CsConstantPattern)

method add*(parent: var CsConstantPattern; item: Dummy) =
  assert false # TODO(add:CsConstantPattern)

# proc add*(parent: var CsConstantPattern; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsConstantPattern): string = assert false #TODO(gen:CsConstantPattern)

# ============= CsConstructorConstraint ========

type CsConstructorConstraint* = ref object of CsObject #TODO(type:CsConstructorConstraint)

proc newCs*(t: typedesc[CsConstructorConstraint]; name: string): CsConstructorConstraint =
  new result
  result.typ = $typeof(t)
#TODO(create:CsConstructorConstraint)

proc extract*(t: typedesc[CsConstructorConstraint]; info: Info): CsConstructorConstraint = assert false #TODO(extract:CsConstructorConstraint)

method add*(parent: var CsConstructorConstraint; item: Dummy) =
  assert false # TODO(add:CsConstructorConstraint)

# proc add*(parent: var CsConstructorConstraint; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsConstructorConstraint): string = assert false #TODO(gen:CsConstructorConstraint)

# ============= CsConstructorInitializer ========


proc newCs*(t: typedesc[CsConstructorInitializer]; name: string): CsConstructorInitializer =
  new result
  result.typ = $typeof(t)
#TODO(create:CsConstructorInitializer)

proc extract*(t: typedesc[CsConstructorInitializer]; info: Info): CsConstructorInitializer = 
  echo info
  new result # TODO?


# proc add*(parent: var CsConstructorInitializer; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsConstructorInitializer): string = assert false #TODO(gen:CsConstructorInitializer)



# ============= CsConstructor ========



proc newCs*(t: typedesc[CsConstructor]; name: string): CsConstructor =
  new result
  result.typ = $typeof(t)

  result.name = name

proc extract*(t: typedesc[CsConstructor]; info: Info): CsConstructor =
  let name = info.essentials[0]
  let m = newCs(CsConstructor, name)
  result = m

method add*(parent: var CsConstructor; item: CsArgumentList) =
  assert (parent.initializer != nil)
  assert parent.initializerArgList.isNil
  parent.initializerArgList = item

method add*(parent: var CsConstructor; item: CsParameterList) =
  parent.parameterList = item

# proc add*(parent: var CsConstructor; item: CsParameterList; data: AllNeededData) = parent.add(item) # TODO




# ============= CsContinueStatement ========

type CsContinueStatement* = ref object of CsObject #TODO(type:CsContinueStatement)

proc newCs*(t: typedesc[CsContinueStatement]; name: string): CsContinueStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsContinueStatement)

proc extract*(t: typedesc[CsContinueStatement]; info: Info): CsContinueStatement = assert false #TODO(extract:CsContinueStatement)

method add*(parent: var CsContinueStatement; item: Dummy) =
  assert false # TODO(add:CsContinueStatement)

# proc add*(parent: var CsContinueStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsContinueStatement): string = assert false #TODO(gen:CsContinueStatement)

# ============= CsConversionOperator ========

type CsConversionOperator* = ref object of CsObject #TODO(type:CsConversionOperator)

proc newCs*(t: typedesc[CsConversionOperator]; name: string): CsConversionOperator =
  new result
  result.typ = $typeof(t)
#TODO(create:CsConversionOperator)

proc extract*(t: typedesc[CsConversionOperator]; info: Info): CsConversionOperator = assert false #TODO(extract:CsConversionOperator)

method add*(parent: var CsConversionOperator; item: Dummy) =
  assert false # TODO(add:CsConversionOperator)

# proc add*(parent: var CsConversionOperator; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsConversionOperator): string = assert false #TODO(gen:CsConversionOperator)

# ============= CsDeclarationExpression ========

type CsDeclarationExpression* = ref object of CsObject #TODO(type:CsDeclarationExpression)

proc newCs*(t: typedesc[CsDeclarationExpression]; name: string): CsDeclarationExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDeclarationExpression)

proc extract*(t: typedesc[CsDeclarationExpression]; info: Info): CsDeclarationExpression = assert false #TODO(extract:CsDeclarationExpression)

method add*(parent: var CsDeclarationExpression; item: Dummy) =
  assert false # TODO(add:CsDeclarationExpression)

# proc add*(parent: var CsDeclarationExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDeclarationExpression): string = assert false #TODO(gen:CsDeclarationExpression)

# ============= CsDeclarationPattern ========

type CsDeclarationPattern* = ref object of CsObject #TODO(type:CsDeclarationPattern)

proc newCs*(t: typedesc[CsDeclarationPattern]; name: string): CsDeclarationPattern =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDeclarationPattern)

proc extract*(t: typedesc[CsDeclarationPattern]; info: Info): CsDeclarationPattern = assert false #TODO(extract:CsDeclarationPattern)

method add*(parent: var CsDeclarationPattern; item: Dummy) =
  assert false # TODO(add:CsDeclarationPattern)

# proc add*(parent: var CsDeclarationPattern; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDeclarationPattern): string = assert false #TODO(gen:CsDeclarationPattern)

# ============= CsDefaultExpression ========

type CsDefaultExpression* = ref object of CsObject #TODO(type:CsDefaultExpression)

proc newCs*(t: typedesc[CsDefaultExpression]; name: string): CsDefaultExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDefaultExpression)

proc extract*(t: typedesc[CsDefaultExpression]; info: Info): CsDefaultExpression = assert false #TODO(extract:CsDefaultExpression)

method add*(parent: var CsDefaultExpression; item: Dummy) =
  assert false # TODO(add:CsDefaultExpression)

# proc add*(parent: var CsDefaultExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDefaultExpression): string = assert false #TODO(gen:CsDefaultExpression)

# ============= CsDefaultSwitchLabel ========

type CsDefaultSwitchLabel* = ref object of CsObject #TODO(type:CsDefaultSwitchLabel)

proc newCs*(t: typedesc[CsDefaultSwitchLabel]; name: string): CsDefaultSwitchLabel =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDefaultSwitchLabel)

proc extract*(t: typedesc[CsDefaultSwitchLabel]; info: Info): CsDefaultSwitchLabel = assert false #TODO(extract:CsDefaultSwitchLabel)

method add*(parent: var CsDefaultSwitchLabel; item: Dummy) =
  assert false # TODO(add:CsDefaultSwitchLabel)

# proc add*(parent: var CsDefaultSwitchLabel; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDefaultSwitchLabel): string = assert false #TODO(gen:CsDefaultSwitchLabel)

# ============= CsDelegate ========

type CsDelegate* = ref object of CsObject #TODO(type:CsDelegate)

proc newCs*(t: typedesc[CsDelegate]; name: string): CsDelegate =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDelegate)

proc extract*(t: typedesc[CsDelegate]; info: Info): CsDelegate = assert false #TODO(extract:CsDelegate)

method add*(parent: var CsDelegate; item: Dummy) =
  assert false # TODO(add:CsDelegate)

# proc add*(parent: var CsDelegate; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDelegate): string = assert false #TODO(gen:CsDelegate)

# ============= CsDestructor ========

type CsDestructor* = ref object of CsObject #TODO(type:CsDestructor)

proc newCs*(t: typedesc[CsDestructor]; name: string): CsDestructor =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDestructor)

proc extract*(t: typedesc[CsDestructor]; info: Info): CsDestructor = assert false #TODO(extract:CsDestructor)

method add*(parent: var CsDestructor; item: Dummy) =
  assert false # TODO(add:CsDestructor)

# proc add*(parent: var CsDestructor; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDestructor): string = assert false #TODO(gen:CsDestructor)

# ============= CsDiscardDesignation ========

type CsDiscardDesignation* = ref object of CsObject #TODO(type:CsDiscardDesignation)

proc newCs*(t: typedesc[CsDiscardDesignation]; name: string): CsDiscardDesignation =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDiscardDesignation)

proc extract*(t: typedesc[CsDiscardDesignation]; info: Info): CsDiscardDesignation = assert false #TODO(extract:CsDiscardDesignation)

method add*(parent: var CsDiscardDesignation; item: Dummy) =
  assert false # TODO(add:CsDiscardDesignation)

# proc add*(parent: var CsDiscardDesignation; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDiscardDesignation): string = assert false #TODO(gen:CsDiscardDesignation)

# ============= CsDoStatement ========

type CsDoStatement* = ref object of CsObject #TODO(type:CsDoStatement)

proc newCs*(t: typedesc[CsDoStatement]; name: string): CsDoStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDoStatement)

proc extract*(t: typedesc[CsDoStatement]; info: Info): CsDoStatement = assert false #TODO(extract:CsDoStatement)

method add*(parent: var CsDoStatement; item: Dummy) =
  assert false # TODO(add:CsDoStatement)

# proc add*(parent: var CsDoStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDoStatement): string = assert false #TODO(gen:CsDoStatement)

# ============= CsElementAccessExpression ========

type CsElementAccessExpression* = ref object of CsObject #TODO(type:CsElementAccessExpression)

proc newCs*(t: typedesc[CsElementAccessExpression]; name: string): CsElementAccessExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsElementAccessExpression)

proc extract*(t: typedesc[CsElementAccessExpression]; info: Info): CsElementAccessExpression = assert false #TODO(extract:CsElementAccessExpression)

method add*(parent: var CsElementAccessExpression; item: Dummy) =
  assert false # TODO(add:CsElementAccessExpression)

# proc add*(parent: var CsElementAccessExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsElementAccessExpression): string = assert false #TODO(gen:CsElementAccessExpression)

# ============= CsElementBindingExpression ========

type CsElementBindingExpression* = ref object of CsObject #TODO(type:CsElementBindingExpression)

proc newCs*(t: typedesc[CsElementBindingExpression]; name: string): CsElementBindingExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsElementBindingExpression)

proc extract*(t: typedesc[CsElementBindingExpression]; info: Info): CsElementBindingExpression = assert false #TODO(extract:CsElementBindingExpression)

method add*(parent: var CsElementBindingExpression; item: Dummy) =
  assert false # TODO(add:CsElementBindingExpression)

# proc add*(parent: var CsElementBindingExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsElementBindingExpression): string = assert false #TODO(gen:CsElementBindingExpression)

# ============= CsElseClause ========

type CsElseClause* = ref object of CsObject #TODO(type:CsElseClause)

proc newCs*(t: typedesc[CsElseClause]; name: string): CsElseClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsElseClause)

proc extract*(t: typedesc[CsElseClause]; info: Info): CsElseClause = assert false #TODO(extract:CsElseClause)

method add*(parent: var CsElseClause; item: Dummy) =
  assert false # TODO(add:CsElseClause)

# proc add*(parent: var CsElseClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsElseClause): string = assert false #TODO(gen:CsElseClause)

# ============= CsEmptyStatement ========

type CsEmptyStatement* = ref object of CsObject #TODO(type:CsEmptyStatement)

proc newCs*(t: typedesc[CsEmptyStatement]; name: string): CsEmptyStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsEmptyStatement)

proc extract*(t: typedesc[CsEmptyStatement]; info: Info): CsEmptyStatement = assert false #TODO(extract:CsEmptyStatement)

method add*(parent: var CsEmptyStatement; item: Dummy) =
  assert false # TODO(add:CsEmptyStatement)

# proc add*(parent: var CsEmptyStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsEmptyStatement): string = assert false #TODO(gen:CsEmptyStatement)

proc newCs*(t: typedesc[CsEnumMember]; name, value: auto): CsEnumMember =
  new result
  result.typ = $typeof(t)

  result.name = name
  result.value = value


proc extract*(t: typedesc[CsEnumMember]; info: Info): CsEnumMember =
  let name = info.essentials[0]
  let value =
    if info.essentials.len < 2: ""
    else:
      info.essentials[1]

  result = newCs(CsEnumMember, name, value)

method add*(em: CsEnumMember; val: string) =
  if em.value.isEmptyOrWhitespace:
    em.value = val.strip
  else: echo "value is already set:`", em.value, "`. got `",val ,"`;"



proc gen*(e: CsEnumMember): string =
  result = e.name
  if e.value != "": result &= " = " & $e.value


proc newCs*(t: typedesc[CsEnum]; name: string): CsEnum =
  new result
  result.typ = $typeof(t)

  result.name = name



proc extract*(t: typedesc[CsEnum]; info: Info): CsEnum =
  assert info.essentials.len > 0
  let name = info.essentials[0]
  result = newCs(CsEnum, name)

method add*(parent: var CsEnum; item: CsEnumMember) =

  parent.items.add item
# proc add*(parent: var CsEnum; item: CsEnumMember; data: AllNeededData) = parent.add(item) # TODO

proc gen*(e: CsEnum): string =
  echo "members count:" & $e.items.len

  result = "type " & e.name & "* = enum"
  if e.items.len > 0:
    result &= "\n  "
    let strs = e.items.mapIt(it.gen())
    result &= strs.join(", ")
  # echo result

# ============= CsEqualsValueClause ========

type CsEqualsValueClause* = ref object of CsObject
  value*: string


method add*(em: var CsEnumMember; item: CsEqualsValueClause) =
  em.add(item.value)



proc newCs*(t: typedesc[CsEqualsValueClause]; name: string): CsEqualsValueClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsEqualsValueClause)

proc extract*(t: typedesc[CsEqualsValueClause]; info: Info): CsEqualsValueClause = 
  echo info
  let val = info.essentials[0]
  result = newCs(CsEqualsValueClause, val)


method add*(parent: var CsEqualsValueClause; item: Dummy) =
  assert false # TODO(add:CsEqualsValueClause)

# proc add*(parent: var CsEqualsValueClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsEqualsValueClause): string = assert false #TODO(gen:CsEqualsValueClause)

# ============= CsEventField ========

type CsEventField* = ref object of CsObject #TODO(type:CsEventField)

proc newCs*(t: typedesc[CsEventField]; name: string): CsEventField =
  new result
  result.typ = $typeof(t)
#TODO(create:CsEventField)

proc extract*(t: typedesc[CsEventField]; info: Info): CsEventField = assert false #TODO(extract:CsEventField)

method add*(parent: var CsEventField; item: Dummy) =
  assert false # TODO(add:CsEventField)

# proc add*(parent: var CsEventField; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsEventField): string = assert false #TODO(gen:CsEventField)

# ============= CsEvent ========

type CsEvent* = ref object of CsObject #TODO(type:CsEvent)

proc newCs*(t: typedesc[CsEvent]; name: string): CsEvent =
  new result
  result.typ = $typeof(t)
#TODO(create:CsEvent)

proc extract*(t: typedesc[CsEvent]; info: Info): CsEvent = assert false #TODO(extract:CsEvent)

method add*(parent: var CsEvent; item: Dummy) =
  assert false # TODO(add:CsEvent)

# proc add*(parent: var CsEvent; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsEvent): string = assert false #TODO(gen:CsEvent)

# ============= CsExplicitInterfaceSpecifier ========

type CsExplicitInterfaceSpecifier* = ref object of CsObject #TODO(type:CsExplicitInterfaceSpecifier)

proc newCs*(t: typedesc[CsExplicitInterfaceSpecifier]; name: string): CsExplicitInterfaceSpecifier =
  new result
  result.typ = $typeof(t)

  result.name = name

proc extract*(t: typedesc[CsExplicitInterfaceSpecifier]; info: Info): CsExplicitInterfaceSpecifier = #TODO(extract:CsExplicitInterfaceSpecifier)
  let name = info.essentials[0]
  result = newCs(CsExplicitInterfaceSpecifier, name)

# proc add*(parent: var CsExplicitInterfaceSpecifier; item: Dummy, data:AllNeededData) = parent.add(item) # TODO
method add*(parent: var CsExplicitInterfaceSpecifier; item: Dummy) = assert false # TODO(add:CsExplicitInterfaceSpecifier)

# proc gen*(c: var CsExplicitInterfaceSpecifier): string = assert false #TODO(gen:CsExplicitInterfaceSpecifier)


type CsInvocationExpression* = ref object of BodyExpr
  callName*: string


# A method body's line.
type CsExpressionStatement* = ref object of BodyExpr
  call*: CsInvocationExpression
  args*: CsArgumentList


method add*(c:var CsConstructor; item: CsExpressionStatement) = 
  c.body.add(item)
method add*(c:var CsConstructor; item: CsAssignmentExpression) = 
  c.body.add(item)
method add*(c:var CsConstructor; item: CsConstructorInitializer) = 
  c.initializer = item

proc newCs*(t: typedesc[CsExpressionStatement]): CsExpressionStatement =
  new result
  result.typ = $typeof(t)
  result.ttype = "CsExpressionStatement"
  # result.typ = $typeof(t)


proc extract*(t: typedesc[CsExpressionStatement]; info: Info): CsExpressionStatement =
  result = newCs(CsExpressionStatement)

method add*(parent: var CsExpressionStatement; item: CsArgumentList) =
  parent.args = item

method add*(parent: var CsArgumentList; item: CsArgument) =
  parent.args.add item.value

method add*(parent: var CsExpressionStatement; item: CsArgument) =
  parent.args.add item

# proc add*(parent: var CsExpressionStatement; item: CsArgumentList; data: AllNeededData) = parent.add(item) # TODO

method add*(parent: var CsExpressionStatement; item: CsInvocationExpression) =
  parent.call = item

# proc add*(parent: var CsExpressionStatement; item: CsInvocationExpression; data: AllNeededData) = parent.add(item) # TODO

import re, strutils
method gen*(c: CsExpressionStatement): string =
  echo "generating for expression statement"
  result = c.call.gen() & "("
  if c.args.args.len > 0:
    result &= c.args.gen()
  result &= ")"
  if c.call.callName.contains(".") and c.call.callName.startsWith(re.re"[A-Z]"):
    result &= " # " & c.call.callName.rsplit(".",1)[0]


# ============= CsExternAliasDirective ========

type CsExternAliasDirective* = ref object of CsObject #TODO(type:CsExternAliasDirective)

proc newCs*(t: typedesc[CsExternAliasDirective]; name: string): CsExternAliasDirective =
  new result
  result.typ = $typeof(t)
#TODO(create:CsExternAliasDirective)

proc extract*(t: typedesc[CsExternAliasDirective]; info: Info): CsExternAliasDirective = assert false #TODO(extract:CsExternAliasDirective)

method add*(parent: var CsExternAliasDirective; item: Dummy) =
  assert false # TODO(add:CsExternAliasDirective)

# proc add*(parent: var CsExternAliasDirective; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsExternAliasDirective): string = assert false #TODO(gen:CsExternAliasDirective)
# hmm, it's actually called a property.



# ============= CsFinallyClause ========

type CsFinallyClause* = ref object of CsObject #TODO(type:CsFinallyClause)

proc newCs*(t: typedesc[CsFinallyClause]; name: string): CsFinallyClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsFinallyClause)

proc extract*(t: typedesc[CsFinallyClause]; info: Info): CsFinallyClause = assert false #TODO(extract:CsFinallyClause)

method add*(parent: var CsFinallyClause; item: Dummy) =
  assert false # TODO(add:CsFinallyClause)

# proc add*(parent: var CsFinallyClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsFinallyClause): string = assert false #TODO(gen:CsFinallyClause)

# ============= CsFixedStatement ========

type CsFixedStatement* = ref object of CsObject #TODO(type:CsFixedStatement)

proc newCs*(t: typedesc[CsFixedStatement]; name: string): CsFixedStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsFixedStatement)

proc extract*(t: typedesc[CsFixedStatement]; info: Info): CsFixedStatement = assert false #TODO(extract:CsFixedStatement)

method add*(parent: var CsFixedStatement; item: Dummy) =
  assert false # TODO(add:CsFixedStatement)

# proc add*(parent: var CsFixedStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsFixedStatement): string = assert false #TODO(gen:CsFixedStatement)

# ============= CsForEachStatement ========

type CsForEachStatement* = ref object of CsObject #TODO(type:CsForEachStatement)

proc newCs*(t: typedesc[CsForEachStatement]; name: string): CsForEachStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsForEachStatement)

proc extract*(t: typedesc[CsForEachStatement]; info: Info): CsForEachStatement = assert false #TODO(extract:CsForEachStatement)

method add*(parent: var CsForEachStatement; item: Dummy) =
  assert false # TODO(add:CsForEachStatement)

# proc add*(parent: var CsForEachStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsForEachStatement): string = assert false #TODO(gen:CsForEachStatement)

# ============= CsForEachVariableStatement ========

type CsForEachVariableStatement* = ref object of CsObject #TODO(type:CsForEachVariableStatement)

proc newCs*(t: typedesc[CsForEachVariableStatement]; name: string): CsForEachVariableStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsForEachVariableStatement)

proc extract*(t: typedesc[CsForEachVariableStatement]; info: Info): CsForEachVariableStatement = assert false #TODO(extract:CsForEachVariableStatement)

method add*(parent: var CsForEachVariableStatement; item: Dummy) =
  assert false # TODO(add:CsForEachVariableStatement)

# proc add*(parent: var CsForEachVariableStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsForEachVariableStatement): string = assert false #TODO(gen:CsForEachVariableStatement)

# ============= CsForStatement ========

type CsForStatement* = ref object of CsObject #TODO(type:CsForStatement)

proc newCs*(t: typedesc[CsForStatement]; name: string): CsForStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsForStatement)

proc extract*(t: typedesc[CsForStatement]; info: Info): CsForStatement = assert false #TODO(extract:CsForStatement)

method add*(parent: var CsForStatement; item: Dummy) =
  assert false # TODO(add:CsForStatement)

# proc add*(parent: var CsForStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsForStatement): string = assert false #TODO(gen:CsForStatement)

# ============= CsFromClause ========

type CsFromClause* = ref object of CsObject #TODO(type:CsFromClause)

proc newCs*(t: typedesc[CsFromClause]; name: string): CsFromClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsFromClause)

proc extract*(t: typedesc[CsFromClause]; info: Info): CsFromClause = assert false #TODO(extract:CsFromClause)

method add*(parent: var CsFromClause; item: Dummy) =
  assert false # TODO(add:CsFromClause)

# proc add*(parent: var CsFromClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsFromClause): string = assert false #TODO(gen:CsFromClause)

# ============= CsGenericName ========
type CsTypeArgumentList* = ref object of CsObject #TODO(type:CsTypeArgumentList)
  # the types a generic has
  types*:seq[string]

type CsGenericName* = ref object of CsObject 
  typearglist*:CsTypeArgumentList

proc newCs*(t: typedesc[CsGenericName]; name: string): CsGenericName =
  new result
  result.typ = $typeof(t)
#TODO(create:CsGenericName)

proc extract*(t: typedesc[CsGenericName]; info: Info): CsGenericName = 
  new result
  # assert false #TODO(extract:CsGenericName)

method add*(parent: var CsGenericName; item: Dummy) =
  assert false # TODO(add:CsGenericName)

# proc add*(parent: var CsGenericName; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsGenericName): string = assert false #TODO(gen:CsGenericName)

# ============= CsGlobalStatement ========

type CsGlobalStatement* = ref object of CsObject #TODO(type:CsGlobalStatement)

proc newCs*(t: typedesc[CsGlobalStatement]; name: string): CsGlobalStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsGlobalStatement)

proc extract*(t: typedesc[CsGlobalStatement]; info: Info): CsGlobalStatement = assert false #TODO(extract:CsGlobalStatement)

method add*(parent: var CsGlobalStatement; item: Dummy) =
  assert false # TODO(add:CsGlobalStatement)

# proc add*(parent: var CsGlobalStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsGlobalStatement): string = assert false #TODO(gen:CsGlobalStatement)

# ============= CsGotoStatement ========

type CsGotoStatement* = ref object of CsObject #TODO(type:CsGotoStatement)

proc newCs*(t: typedesc[CsGotoStatement]; name: string): CsGotoStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsGotoStatement)

proc extract*(t: typedesc[CsGotoStatement]; info: Info): CsGotoStatement = assert false #TODO(extract:CsGotoStatement)

method add*(parent: var CsGotoStatement; item: Dummy) =
  assert false # TODO(add:CsGotoStatement)

# proc add*(parent: var CsGotoStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsGotoStatement): string = assert false #TODO(gen:CsGotoStatement)

# ============= CsGroupClause ========

type CsGroupClause* = ref object of CsObject #TODO(type:CsGroupClause)

proc newCs*(t: typedesc[CsGroupClause]; name: string): CsGroupClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsGroupClause)

proc extract*(t: typedesc[CsGroupClause]; info: Info): CsGroupClause = assert false #TODO(extract:CsGroupClause)

method add*(parent: var CsGroupClause; item: Dummy) =
  assert false # TODO(add:CsGroupClause)

# proc add*(parent: var CsGroupClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsGroupClause): string = assert false #TODO(gen:CsGroupClause)

# ============= CsIfStatement ========

type CsIfStatement* = ref object of CsObject #TODO(type:CsIfStatement)

proc newCs*(t: typedesc[CsIfStatement]; name: string): CsIfStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsIfStatement)

proc extract*(t: typedesc[CsIfStatement]; info: Info): CsIfStatement = assert false #TODO(extract:CsIfStatement)

method add*(parent: var CsIfStatement; item: Dummy) =
  assert false # TODO(add:CsIfStatement)

# proc add*(parent: var CsIfStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsIfStatement): string = assert false #TODO(gen:CsIfStatement)

# ============= CsImplicitArrayCreationExpression ========

type CsImplicitArrayCreationExpression* = ref object of CsObject #TODO(type:CsImplicitArrayCreationExpression)

proc newCs*(t: typedesc[CsImplicitArrayCreationExpression]; name: string): CsImplicitArrayCreationExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsImplicitArrayCreationExpression)

proc extract*(t: typedesc[CsImplicitArrayCreationExpression]; info: Info): CsImplicitArrayCreationExpression = assert false #TODO(extract:CsImplicitArrayCreationExpression)

method add*(parent: var CsImplicitArrayCreationExpression; item: Dummy) =
  assert false # TODO(add:CsImplicitArrayCreationExpression)

# proc add*(parent: var CsImplicitArrayCreationExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsImplicitArrayCreationExpression): string = assert false #TODO(gen:CsImplicitArrayCreationExpression)

# ============= CsImplicitElementAccess ========

type CsImplicitElementAccess* = ref object of CsObject #TODO(type:CsImplicitElementAccess)

proc newCs*(t: typedesc[CsImplicitElementAccess]; name: string): CsImplicitElementAccess =
  new result
  result.typ = $typeof(t)
#TODO(create:CsImplicitElementAccess)

proc extract*(t: typedesc[CsImplicitElementAccess]; info: Info): CsImplicitElementAccess = assert false #TODO(extract:CsImplicitElementAccess)

method add*(parent: var CsImplicitElementAccess; item: Dummy) =
  assert false # TODO(add:CsImplicitElementAccess)

# proc add*(parent: var CsImplicitElementAccess; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsImplicitElementAccess): string = assert false #TODO(gen:CsImplicitElementAccess)

# ============= CsIncompleteMember ========

type CsIncompleteMember* = ref object of CsObject #TODO(type:CsIncompleteMember)

proc newCs*(t: typedesc[CsIncompleteMember]; name: string): CsIncompleteMember =
  new result
  result.typ = $typeof(t)
#TODO(create:CsIncompleteMember)

proc extract*(t: typedesc[CsIncompleteMember]; info: Info): CsIncompleteMember = assert false #TODO(extract:CsIncompleteMember)

method add*(parent: var CsIncompleteMember; item: Dummy) =
  assert false # TODO(add:CsIncompleteMember)

# proc add*(parent: var CsIncompleteMember; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsIncompleteMember): string = assert false #TODO(gen:CsIncompleteMember)


# ============= CsIndexer ========

proc newCs*(t: typedesc[CsIndexer]): CsIndexer =
  new result
  result.typ = $typeof(t)

  result.hasDefaultGet = true
  result.hasDefaultSet = true

proc extract*(t: typedesc[CsIndexer]; info: Info): CsIndexer =
  echo "extract info:", info
  result = newCs(CsIndexer)

method add*(parent: var CsIndexer; item: CsParameter) =
  parent.varName = item.name
  parent.varType = item.ptype

method add*(parent: var CsIndexer; item: CsBracketedParameterList) =
  discard # add (csindexer, csparameter) already does what we need. because indexer has just one parameter.

type CsPredefinedType* = ref object of CsObject

method add*(parent: var CsIndexer; item: CsPredefinedType) =

  parent.retType = item.name
# proc add*(parent: var CsIndexer; item: CsPredefinedType; data: AllNeededData) = parent.add(item) # TODO

method add*(parent: var CsIndexer; item: CsExplicitInterfaceSpecifier) =

  parent.firstVarType = item.name
# proc add*(parent: var CsIndexer; item: CsExplicitInterfaceSpecifier; data: AllNeededData) = parent.add(item) # TODO



# ============= CsInitializerExpression ========

type CsInitializerExpression* = ref object of CsObject #TODO(type:CsInitializerExpression)

proc newCs*(t: typedesc[CsInitializerExpression]; name: string): CsInitializerExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsInitializerExpression)

proc extract*(t: typedesc[CsInitializerExpression]; info: Info): CsInitializerExpression = assert false #TODO(extract:CsInitializerExpression)

method add*(parent: var CsInitializerExpression; item: Dummy) =
  assert false # TODO(add:CsInitializerExpression)

# proc add*(parent: var CsInitializerExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsInitializerExpression): string = assert false #TODO(gen:CsInitializerExpression)

# ============= CsInterface ========

type CsInterface* = ref object of CsObject #TODO(type:CsInterface)
proc newCs*(t: typedesc[CsInterface]; name: string): CsInterface =
  new result
  result.typ = $typeof(t)
#TODO(create:CsInterface)

proc extract*(t: typedesc[CsInterface]; info: Info): CsInterface = assert false #TODO(extract:CsInterface)


method add*(parent: var CsInterface; item: CsProperty) =
  assert false # TODO(add:CsInterface)

# proc add*(parent: var CsInterface; item: CsProperty; data: AllNeededData) = parent.add(item) # TODO



proc gen*(c: var CsInterface): string = assert false #TODO(gen:CsInterface)

# ============= CsInterpolatedStringExpression ========

type CsInterpolatedStringExpression* = ref object of CsObject #TODO(type:CsInterpolatedStringExpression)

proc newCs*(t: typedesc[CsInterpolatedStringExpression]; name: string): CsInterpolatedStringExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsInterpolatedStringExpression)

proc extract*(t: typedesc[CsInterpolatedStringExpression]; info: Info): CsInterpolatedStringExpression = assert false #TODO(extract:CsInterpolatedStringExpression)

method add*(parent: var CsInterpolatedStringExpression; item: Dummy) =
  assert false # TODO(add:CsInterpolatedStringExpression)

# proc add*(parent: var CsInterpolatedStringExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsInterpolatedStringExpression): string = assert false #TODO(gen:CsInterpolatedStringExpression)

# ============= CsInterpolatedStringText ========

type CsInterpolatedStringText* = ref object of CsObject #TODO(type:CsInterpolatedStringText)

proc newCs*(t: typedesc[CsInterpolatedStringText]; name: string): CsInterpolatedStringText =
  new result
  result.typ = $typeof(t)
#TODO(create:CsInterpolatedStringText)

proc extract*(t: typedesc[CsInterpolatedStringText]; info: Info): CsInterpolatedStringText = assert false #TODO(extract:CsInterpolatedStringText)

method add*(parent: var CsInterpolatedStringText; item: Dummy) =
  assert false # TODO(add:CsInterpolatedStringText)

# proc add*(parent: var CsInterpolatedStringText; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsInterpolatedStringText): string = assert false #TODO(gen:CsInterpolatedStringText)

# ============= CsInterpolationAlignmentClause ========

type CsInterpolationAlignmentClause* = ref object of CsObject #TODO(type:CsInterpolationAlignmentClause)

proc newCs*(t: typedesc[CsInterpolationAlignmentClause]; name: string): CsInterpolationAlignmentClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsInterpolationAlignmentClause)

proc extract*(t: typedesc[CsInterpolationAlignmentClause]; info: Info): CsInterpolationAlignmentClause = assert false #TODO(extract:CsInterpolationAlignmentClause)

method add*(parent: var CsInterpolationAlignmentClause; item: Dummy) =
  assert false # TODO(add:CsInterpolationAlignmentClause)

# proc add*(parent: var CsInterpolationAlignmentClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsInterpolationAlignmentClause): string = assert false #TODO(gen:CsInterpolationAlignmentClause)

# ============= CsInterpolationFormatClause ========

type CsInterpolationFormatClause* = ref object of CsObject #TODO(type:CsInterpolationFormatClause)

proc newCs*(t: typedesc[CsInterpolationFormatClause]; name: string): CsInterpolationFormatClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsInterpolationFormatClause)

proc extract*(t: typedesc[CsInterpolationFormatClause]; info: Info): CsInterpolationFormatClause = assert false #TODO(extract:CsInterpolationFormatClause)

method add*(parent: var CsInterpolationFormatClause; item: Dummy) =
  assert false # TODO(add:CsInterpolationFormatClause)

# proc add*(parent: var CsInterpolationFormatClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsInterpolationFormatClause): string = assert false #TODO(gen:CsInterpolationFormatClause)

# ============= CsInterpolation ========

type CsInterpolation* = ref object of CsObject #TODO(type:CsInterpolation)

proc newCs*(t: typedesc[CsInterpolation]; name: string): CsInterpolation =
  new result
  result.typ = $typeof(t)
#TODO(create:CsInterpolation)

proc extract*(t: typedesc[CsInterpolation]; info: Info): CsInterpolation = assert false #TODO(extract:CsInterpolation)

method add*(parent: var CsInterpolation; item: Dummy) =
  assert false # TODO(add:CsInterpolation)

# proc add*(parent: var CsInterpolation; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsInterpolation): string = assert false #TODO(gen:CsInterpolation)

# ============= CsInvocationExpression ========

proc newCs*(t: typedesc[CsInvocationExpression]; name: string): CsInvocationExpression =
  new result
  result.typ = $typeof(t)
  result.ttype = "CsInvocationExpression"
  result.callName = name

proc extract*(t: typedesc[CsInvocationExpression]; info: Info): CsInvocationExpression =
  let name = info.essentials[0]
  result = newCs(CsInvocationExpression, name)



func normalizeCallName(s: string): string =
  assert s.contains(".")
  let parts = s.rsplit(".", 1)
  let lastPart = parts[1] # last part is the function name that was called.

  if lastPart.len == 1:
    result = lastPart.toLowerAscii
  else:
    result = lastPart[0].toLowerAscii & lastPart[1..^1]


method gen*(c: CsInvocationExpression): string =
  
  result = if c.callName.contains("."):
    normalizeCallName(c.callName)
  else: c.callName


  #[
  let exprStmt = root.exprsTable[c.parentId] # method or class... how do we do this? uuid to the rescue.
  let assumingMethod = root.allMethodsTable[exprStmt.parentId]
  if assumingMethod.isStatic or assumingMethod.parentClass().isStatic: discard
    # ......  so everyone gets a unique id, and that's how we call back to parent

  # refactor to proc isInStatic(for each type that* needs it)

  # for handling c# static calls, we don't need the static class it was defined in.

    ]#

  # ============= CsIsPatternExpression ========

type CsIsPatternExpression* = ref object of CsObject #TODO(type:CsIsPatternExpression)

proc newCs*(t: typedesc[CsIsPatternExpression]; name: string): CsIsPatternExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsIsPatternExpression)

proc extract*(t: typedesc[CsIsPatternExpression]; info: Info): CsIsPatternExpression = assert false #TODO(extract:CsIsPatternExpression)

method add*(parent: var CsIsPatternExpression; item: Dummy) =
  assert false # TODO(add:CsIsPatternExpression)

# proc add*(parent: var CsIsPatternExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsIsPatternExpression): string = assert false #TODO(gen:CsIsPatternExpression)

# ============= CsJoinClause ========

type CsJoinClause* = ref object of CsObject #TODO(type:CsJoinClause)

proc newCs*(t: typedesc[CsJoinClause]; name: string): CsJoinClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsJoinClause)

proc extract*(t: typedesc[CsJoinClause]; info: Info): CsJoinClause = assert false #TODO(extract:CsJoinClause)

method add*(parent: var CsJoinClause; item: Dummy) =
  assert false # TODO(add:CsJoinClause)

# proc add*(parent: var CsJoinClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsJoinClause): string = assert false #TODO(gen:CsJoinClause)

# ============= CsJoinIntoClause ========

type CsJoinIntoClause* = ref object of CsObject #TODO(type:CsJoinIntoClause)

proc newCs*(t: typedesc[CsJoinIntoClause]; name: string): CsJoinIntoClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsJoinIntoClause)

proc extract*(t: typedesc[CsJoinIntoClause]; info: Info): CsJoinIntoClause = assert false #TODO(extract:CsJoinIntoClause)

method add*(parent: var CsJoinIntoClause; item: Dummy) =
  assert false # TODO(add:CsJoinIntoClause)

# proc add*(parent: var CsJoinIntoClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsJoinIntoClause): string = assert false #TODO(gen:CsJoinIntoClause)

# ============= CsLabeledStatement ========

type CsLabeledStatement* = ref object of CsObject #TODO(type:CsLabeledStatement)

proc newCs*(t: typedesc[CsLabeledStatement]; name: string): CsLabeledStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsLabeledStatement)

proc extract*(t: typedesc[CsLabeledStatement]; info: Info): CsLabeledStatement = assert false #TODO(extract:CsLabeledStatement)

method add*(parent: var CsLabeledStatement; item: Dummy) =
  assert false # TODO(add:CsLabeledStatement)

# proc add*(parent: var CsLabeledStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsLabeledStatement): string = assert false #TODO(gen:CsLabeledStatement)

# ============= CsLetClause ========

type CsLetClause* = ref object of CsObject #TODO(type:CsLetClause)

proc newCs*(t: typedesc[CsLetClause]; name: string): CsLetClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsLetClause)

proc extract*(t: typedesc[CsLetClause]; info: Info): CsLetClause = assert false #TODO(extract:CsLetClause)

method add*(parent: var CsLetClause; item: Dummy) =
  assert false # TODO(add:CsLetClause)

# proc add*(parent: var CsLetClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsLetClause): string = assert false #TODO(gen:CsLetClause)

# ============= CsLiteralExpression ========

type CsLiteralExpression* = ref object of BodyExpr
  value*: string
method add*(em: var CsEnumMember; item: CsLiteralExpression) =
  em.add(item.value)
proc newCs(t: typedesc[CsLiteralExpression]; val: string): CsLiteralExpression =
  new result
  result.typ = $typeof(t)
  result.ttype = "CsLiteralExpression"
  result.value = val

proc extract*(_: typedesc[CsLiteralExpression]; info: Info): CsLiteralExpression =
  let strVal = info.essentials[0]
  result = newCs(CsLiteralExpression, strVal)

method gen*(lit: CsLiteralExpression): string =
  lit.value

# ============= CsLocalDeclarationStatement ========

type CsVariableDeclarator* = ref object of BodyExpr
  ev*:CsEqualsValueClause # so i can get (with its parentid) the expression statement which is the right hand side, afterwards.
  expr*:BodyExpr # either expressionStatement or objectcreationexpression

proc newCs*(_: typedesc[CsVariableDeclarator]):CsVariableDeclarator = 
  new result

method add*(parent: var CsVariableDeclarator; item: CsEqualsValueClause)=
  parent.ev = item

proc extract*(_: typedesc[CsVariableDeclarator]; info: Info): CsVariableDeclarator =
  result = newCs(CsVariableDeclarator)
  result.name = info.essentials[0]

# proc add*(parent: var CsLocalDeclarationStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO



# ============= CsLocalFunctionStatement ========

type CsLocalFunctionStatement* = ref object of CsObject #TODO(type:CsLocalFunctionStatement)

proc newCs*(t: typedesc[CsLocalFunctionStatement]; name: string): CsLocalFunctionStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsLocalFunctionStatement)

proc extract*(t: typedesc[CsLocalFunctionStatement]; info: Info): CsLocalFunctionStatement = assert false #TODO(extract:CsLocalFunctionStatement)

method add*(parent: var CsLocalFunctionStatement; item: Dummy) =
  assert false # TODO(add:CsLocalFunctionStatement)

# proc add*(parent: var CsLocalFunctionStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsLocalFunctionStatement): string = assert false #TODO(gen:CsLocalFunctionStatement)

# ============= CsLockStatement ========

type CsLockStatement* = ref object of CsObject #TODO(type:CsLockStatement)

proc newCs*(t: typedesc[CsLockStatement]; name: string): CsLockStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsLockStatement)

proc extract*(t: typedesc[CsLockStatement]; info: Info): CsLockStatement = assert false #TODO(extract:CsLockStatement)

method add*(parent: var CsLockStatement; item: Dummy) =
  assert false # TODO(add:CsLockStatement)

# proc add*(parent: var CsLockStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsLockStatement): string = assert false #TODO(gen:CsLockStatement)

# ============= CsMakeRefExpression ========

type CsMakeRefExpression* = ref object of CsObject #TODO(type:CsMakeRefExpression)

proc newCs*(t: typedesc[CsMakeRefExpression]; name: string): CsMakeRefExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsMakeRefExpression)

proc extract*(t: typedesc[CsMakeRefExpression]; info: Info): CsMakeRefExpression = assert false #TODO(extract:CsMakeRefExpression)

method add*(parent: var CsMakeRefExpression; item: Dummy) =
  assert false # TODO(add:CsMakeRefExpression)

# proc add*(parent: var CsMakeRefExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsMakeRefExpression): string = assert false #TODO(gen:CsMakeRefExpression)

# ============= CsMemberBindingExpression ========

type CsMemberBindingExpression* = ref object of CsObject #TODO(type:CsMemberBindingExpression)

proc newCs*(t: typedesc[CsMemberBindingExpression]; name: string): CsMemberBindingExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsMemberBindingExpression)

proc extract*(t: typedesc[CsMemberBindingExpression]; info: Info): CsMemberBindingExpression = assert false #TODO(extract:CsMemberBindingExpression)

method add*(parent: var CsMemberBindingExpression; item: Dummy) =
  assert false # TODO(add:CsMemberBindingExpression)

# proc add*(parent: var CsMemberBindingExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsMemberBindingExpression): string = assert false #TODO(gen:CsMemberBindingExpression)




proc newCs*(t: typedesc[CsMethod]; name: string): CsMethod =
  new result
  result.typ = $typeof(t)

  result.name = name



method add*(parent: var CsMethod; t: CsPredefinedType) =
  parent.returnType = t.name



method add*(parent: var CsMethod; p: CsParameterList) =
  parent.parameterList = p

type CsObjectCreationExpression* = ref object of BodyExpr
  # args*: CsParameterList
  args*: CsArgumentList

method add*(parent: var CsVariableDeclarator; item: CsObjectCreationExpression)=
  assert parent.expr.isNil
  parent.expr = item

method add*(parent: var CsMethod; item: CsObjectCreationExpression) =
  parent.body.add item
# proc add*(parent: var CsMethod; item: CsObjectCreationExpression; data: AllNeededData) = parent.add(item) # TODO


type CsReturnStatement* = ref object of BodyExpr # type:CsReturnStatement
  expr*: BodyExpr                                # can have one expr that can be nil

method add*(parent: var CsMethod; item: CsReturnStatement) =
  parent.body.add item
# proc add*(parent: var CsMethod; item: CsReturnStatement; data: AllNeededData) = parent.add(item) # TODO
method add*(parent: var CsMethod; item: CsExpressionStatement) =
  parent.body.add item



# ============= CsNameColon ========

type CsNameColon* = ref object of CsObject #TODO(type:CsNameColon)

proc newCs*(t: typedesc[CsNameColon]; name: string): CsNameColon =
  new result
  result.typ = $typeof(t)
#TODO(create:CsNameColon)

proc extract*(t: typedesc[CsNameColon]; info: Info): CsNameColon = assert false #TODO(extract:CsNameColon)

method add*(parent: var CsNameColon; item: Dummy) =
  assert false # TODO(add:CsNameColon)

# proc add*(parent: var CsNameColon; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsNameColon): string = assert false #TODO(gen:CsNameColon)

# ============= CsNameEquals ========

type CsNameEquals* = ref object of CsObject #TODO(type:CsNameEquals)

proc newCs*(t: typedesc[CsNameEquals]; name: string): CsNameEquals =
  new result
  result.typ = $typeof(t)
#TODO(create:CsNameEquals)

proc extract*(t: typedesc[CsNameEquals]; info: Info): CsNameEquals = assert false #TODO(extract:CsNameEquals)

method add*(parent: var CsNameEquals; item: Dummy) =
  assert false # TODO(add:CsNameEquals)

# proc add*(parent: var CsNameEquals; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsNameEquals): string = assert false #TODO(gen:CsNameEquals)



type NamespaceParts* {.pure.} = enum
  Unset, Interfaces, Enums, Classes, Using


# type Child* = object
#   name: string
#   case kind: NamespaceParts
#   of NamespaceParts.Classes:
#     npCls: CsClass
#   of NamespaceParts.Interfaces:
#     npIface: CsInterface
#   of NamespaceParts.Enums:
#     npEnum: CsEnum
type CsUsingDirective* = ref object of CsObject
proc `$`*(c:CsUsingDirective):string=
  result = "import: (" 
  result &= "name: " & c.name 
  result &= ")"

type CsNamespace* = ref object of CsObject
  # id*: UUID
  parent*: string
  classes*: seq[CsClass]
  classTable*: TableRef[string, CsClass]
  enums*: seq[CsEnum]
  enumTable*: TableRef[string, CsEnum]
  interfaces*: seq[CsInterface]
  interfaceTable*: TableRef[string, CsInterface]
  lastAddedTo*: Option[NamespaceParts] # TODO: !!! we actually want here an object variant, so we can simply ask for the object.
                                       # lastAdded: Construct
  imports*: seq[CsUsingDirective]

import sequtils, strutils
proc `$`*(n: CsNamespace): string =
  result = "namespace: ("
  result &= "name: " & n.name
  result &= "; imports: [" & n.imports.mapIt($it).join(", ") & "]"
  result &= "; classes: [" & n.classes.mapIt($it).join(", ") & "]"
  result &= "; enums: [" & n.enums.mapIt($it).join(", ") & "]"
  result &= ")"

proc newCs*(t: typedesc[CsNamespace]; name: string): CsNamespace =
  new result
  result.typ = $typeof(t)
  result.name = name
  result.classes = @[]
  result.classTable = newTable[string, CsClass]()
  result.enums = @[]
  result.enumTable = newTable[string, CsEnum]()
  result.interfaces = @[]
  result.interfaceTable = newTable[string, CsInterface]()

type AllNeededData* = object
  sourceCode*: string
  constructDeclName*: string
  
  currentNamespace*: CsNamespace
  nsLastAdded*: NamespaceParts
  classLastAdded*: ClassParts
  
  lastUsing*:CsUsingDirective
  lastEnum*: CsEnum
  lastEnumMember*: CsEnumMember
  lastInterface*:CsInterface
  lastClass*: CsClass
  lastMethod*: CsMethod
  lastProp*: CsProperty
  lastCtor*: CsConstructor

  lastMethodBodyExpr*: BodyExpr
  lastBodyExprId*:Option[UUID]
  lastBodyExpr* : Option[BodyExpr]

  inBlock*: Block
  prevBlock*: Block
  currentConstruct*: Option[Block]
  previousConstruct*: Option[Block]
  previousPreviousConstruct*: Option[Block]




proc extract*(t: typedesc[CsMethod]; info: Info; data: AllNeededData): CsMethod =
  let name = info.essentials[0]
  let m = newCs(CsMethod, name)
  result = m
  if info.extras.len > 0:
    let e = info.extras[0]
    echo e
    if e.contains("static"):
      result.isStatic = true

proc extract*(t: typedesc[CsClass]; info: Info; data: AllNeededData): CsClass =
  # new result
  let name = info.essentials[0]
  if info.essentials.len > 1:
    let baseTypes = info.essentials[1].split(", ")
    # echo "BASETYPES: " & $baseTypes
    if baseTypes.len > 1:
      result = newCs(CsClass, name, baseTypes[0], baseTypes[1..^1])
    else: result = newCs(CsClass, name, baseTypes[0])
  else:
    result = newCs(CsClass, name)
  if info.extras.len > 0:
    let modifiers = info.extras[0]
    for m in modifiers.split(" "):
      result.mods.incl(m)

proc extract*(t: typedesc[CsNamespace]; info: Info; ): CsNamespace =
  echo "extract CsNamespace"
  echo info
  echo info.essentials[0]
  result = newCs(t, info.essentials[0])

proc extract*(t: typedesc[CsNamespace]; info: Info; data: AllNeededData): CsNamespace =
  extract(t, info)

method add*(parent: var CsNamespace; item: CsEnum) =

  parent.enums.add item
  parent.enumTable[item.name] = item
  parent.lastAddedTo = some(NamespaceParts.Enums)
  # parent.lastAdded = Child(kind: NamespaceParts.Enums, npEnum: item)

# proc add*(parent: var CsNamespace; item: CsEnum; data: AllNeededData) = parent.add(item) # TODO

method add*(ns: var CsNamespace; class: CsClass) =
  ns.classes.add(class)
  ns.classTable[class.name] = class
  ns.lastAddedTo = some(NamespaceParts.Classes)

method add*(ns: var CsNamespace; use: CsUsingDirective) =
  ns.imports.add use
  ns.lastAddedTo = some(NamespaceParts.Using)
  


proc gen*(c: CsUsingDirective): string =
  result = "import dotnet/" & c.name.toLowerAscii.replace(".", "/")

proc gen*(r: CsNamespace): string =
  echo "generating namespace: " & r.name
  var s: seq[string] = @[]
  for u in r.imports:
    s.add(u.gen())
  s.add("")
  for c in r.classes:
    s.add(c.gen())
  s.add("")
  for e in r.enums:
    s.add(e.gen())
  result = s.join("\r\n")


proc hash*(c: CsNamespace): Hash =
  result = hash(c.name)

# ============= CsNullableType ========

type CsNullableType* = ref object of CsObject #TODO(type:CsNullableType)

proc newCs*(t: typedesc[CsNullableType]; name: string): CsNullableType =
  new result
  result.typ = $typeof(t)
#TODO(create:CsNullableType)

proc extract*(t: typedesc[CsNullableType]; info: Info): CsNullableType = assert false #TODO(extract:CsNullableType)

method add*(parent: var CsNullableType; item: Dummy) =
  assert false # TODO(add:CsNullableType)

# proc add*(parent: var CsNullableType; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsNullableType): string = assert false #TODO(gen:CsNullableType)

# ============= CsObjectCreationExpression ========

proc newCs*(t: typedesc[CsObjectCreationExpression]; name: string): CsObjectCreationExpression =
  new result
  result.typ = $typeof(t)

  result.name = name
  result.ttype = "CsObjectCreationExpression"

proc extract*(t: typedesc[CsObjectCreationExpression]; info: Info): CsObjectCreationExpression =
  let newClassName = info.essentials[0]
  result = newCs(CsObjectCreationExpression, newClassName)


method add*(parent: var CsObjectCreationExpression; item: CsArgumentList) =

  parent.args = item

# proc add*(parent: var CsObjectCreationExpression; item: CsArgumentList; data: AllNeededData) = parent.add(item) # TODO
# proc add*(parent: var CsObjectCreationExpression; item: CsParameterList, data:AllNeededData) = parent.add(item) # TODO

# proc add*(parent: var CsObjectCreationExpression; item: CsParameterList) = assert false

method gen*(c: var CsObjectCreationExpression): string = assert false #TODO(gen:CsObjectCreationExpression)

# ============= CsOmittedArraySizeExpression ========

type CsOmittedArraySizeExpression* = ref object of CsObject #TODO(type:CsOmittedArraySizeExpression)

proc newCs*(t: typedesc[CsOmittedArraySizeExpression]; name: string): CsOmittedArraySizeExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsOmittedArraySizeExpression)

proc extract*(t: typedesc[CsOmittedArraySizeExpression]; info: Info): CsOmittedArraySizeExpression = assert false #TODO(extract:CsOmittedArraySizeExpression)

method add*(parent: var CsOmittedArraySizeExpression; item: Dummy) =
  assert false # TODO(add:CsOmittedArraySizeExpression)

# proc add*(parent: var CsOmittedArraySizeExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsOmittedArraySizeExpression): string = assert false #TODO(gen:CsOmittedArraySizeExpression)

# ============= CsOmittedTypeArgument ========

type CsOmittedTypeArgument* = ref object of CsObject #TODO(type:CsOmittedTypeArgument)

proc newCs*(t: typedesc[CsOmittedTypeArgument]; name: string): CsOmittedTypeArgument =
  new result
  result.typ = $typeof(t)
#TODO(create:CsOmittedTypeArgument)

proc extract*(t: typedesc[CsOmittedTypeArgument]; info: Info): CsOmittedTypeArgument = assert false #TODO(extract:CsOmittedTypeArgument)

method add*(parent: var CsOmittedTypeArgument; item: Dummy) =
  assert false # TODO(add:CsOmittedTypeArgument)

# proc add*(parent: var CsOmittedTypeArgument; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsOmittedTypeArgument): string = assert false #TODO(gen:CsOmittedTypeArgument)

# ============= CsOperator ========

type CsOperator* = ref object of CsObject #TODO(type:CsOperator)

proc newCs*(t: typedesc[CsOperator]; name: string): CsOperator =
  new result
  result.typ = $typeof(t)
#TODO(create:CsOperator)

proc extract*(t: typedesc[CsOperator]; info: Info): CsOperator = assert false #TODO(extract:CsOperator)

method add*(parent: var CsOperator; item: Dummy) =
  assert false # TODO(add:CsOperator)

# proc add*(parent: var CsOperator; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsOperator): string = assert false #TODO(gen:CsOperator)

# ============= CsOrderByClause ========

type CsOrderByClause* = ref object of CsObject #TODO(type:CsOrderByClause)

proc newCs*(t: typedesc[CsOrderByClause]; name: string): CsOrderByClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsOrderByClause)

proc extract*(t: typedesc[CsOrderByClause]; info: Info): CsOrderByClause = assert false #TODO(extract:CsOrderByClause)

method add*(parent: var CsOrderByClause; item: Dummy) =
  assert false # TODO(add:CsOrderByClause)

# proc add*(parent: var CsOrderByClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsOrderByClause): string = assert false #TODO(gen:CsOrderByClause)

# ============= CsOrdering ========

type CsOrdering* = ref object of CsObject #TODO(type:CsOrdering)

proc newCs*(t: typedesc[CsOrdering]; name: string): CsOrdering =
  new result
  result.typ = $typeof(t)
#TODO(create:CsOrdering)

proc extract*(t: typedesc[CsOrdering]; info: Info): CsOrdering = assert false #TODO(extract:CsOrdering)

method add*(parent: var CsOrdering; item: Dummy) =
  assert false # TODO(add:CsOrdering)

# proc add*(parent: var CsOrdering; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsOrdering): string = assert false #TODO(gen:CsOrdering)

# ============ CsParameterList =================

proc newCs*(t: typedesc[CsParameterList]): CsParameterList =
  new result # start empty.
  result.typ = $typeof(t)


proc extract*(t: typedesc[CsParameterList]; info: Info; data: AllNeededData): CsParameterList =
  result = newCs(CsParameterList)

method add*(parent: var CsParameterList; item: CsParameter) =

  parent.parameters.add item

# proc add*(parent: var CsParameterList; item: CsParameter; data: AllNeededData) = parent.add(item) # TODO

proc extract*(t: typedesc[CsParameter]; info: Info): CsParameter =
  assert info.essentials.len >= 2
  let name = info.essentials[0].strip()
  let ty = info.essentials[1].strip()
  result = newCs(CsParameter, name, ty)
  if info.extras.len > 0:
    let e = info.extras[0]
    if e.contains("ref"): result.isRef = true



# ============= CsParenthesizedExpression ========

type CsParenthesizedExpression* = ref object of CsObject #TODO(type:CsParenthesizedExpression)

proc newCs*(t: typedesc[CsParenthesizedExpression]; name: string): CsParenthesizedExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsParenthesizedExpression)

proc extract*(t: typedesc[CsParenthesizedExpression]; info: Info): CsParenthesizedExpression = assert false #TODO(extract:CsParenthesizedExpression)

method add*(parent: var CsParenthesizedExpression; item: Dummy) =
  assert false # TODO(add:CsParenthesizedExpression)

# proc add*(parent: var CsParenthesizedExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsParenthesizedExpression): string = assert false #TODO(gen:CsParenthesizedExpression)

# ============= CsParenthesizedLambdaExpression ========

type CsParenthesizedLambdaExpression* = ref object of CsObject #TODO(type:CsParenthesizedLambdaExpression)

proc newCs*(t: typedesc[CsParenthesizedLambdaExpression]; name: string): CsParenthesizedLambdaExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsParenthesizedLambdaExpression)

proc extract*(t: typedesc[CsParenthesizedLambdaExpression]; info: Info): CsParenthesizedLambdaExpression = assert false #TODO(extract:CsParenthesizedLambdaExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: Dummy) =
  assert false # TODO(add:CsParenthesizedLambdaExpression)

# proc add*(parent: var CsParenthesizedLambdaExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsParenthesizedLambdaExpression): string = assert false #TODO(gen:CsParenthesizedLambdaExpression)

# ============= CsParenthesizedVariableDesignation ========

type CsParenthesizedVariableDesignation* = ref object of CsObject #TODO(type:CsParenthesizedVariableDesignation)

proc newCs*(t: typedesc[CsParenthesizedVariableDesignation]; name: string): CsParenthesizedVariableDesignation =
  new result
  result.typ = $typeof(t)
#TODO(create:CsParenthesizedVariableDesignation)

proc extract*(t: typedesc[CsParenthesizedVariableDesignation]; info: Info): CsParenthesizedVariableDesignation = assert false #TODO(extract:CsParenthesizedVariableDesignation)

method add*(parent: var CsParenthesizedVariableDesignation; item: Dummy) =
  assert false # TODO(add:CsParenthesizedVariableDesignation)

# proc add*(parent: var CsParenthesizedVariableDesignation; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsParenthesizedVariableDesignation): string = assert false #TODO(gen:CsParenthesizedVariableDesignation)

# ============= CsPointerType ========

type CsPointerType* = ref object of CsObject #TODO(type:CsPointerType)

proc newCs*(t: typedesc[CsPointerType]; name: string): CsPointerType =
  new result
  result.typ = $typeof(t)
#TODO(create:CsPointerType)

proc extract*(t: typedesc[CsPointerType]; info: Info): CsPointerType = assert false #TODO(extract:CsPointerType)

method add*(parent: var CsPointerType; item: Dummy) =
  assert false # TODO(add:CsPointerType)

# proc add*(parent: var CsPointerType; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsPointerType): string = assert false #TODO(gen:CsPointerType)

# ============= CsPostfixUnaryExpression ========

type CsPostfixUnaryExpression* = ref object of CsObject #TODO(type:CsPostfixUnaryExpression)

proc newCs*(t: typedesc[CsPostfixUnaryExpression]; name: string): CsPostfixUnaryExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsPostfixUnaryExpression)

proc extract*(t: typedesc[CsPostfixUnaryExpression]; info: Info): CsPostfixUnaryExpression = assert false #TODO(extract:CsPostfixUnaryExpression)

method add*(parent: var CsPostfixUnaryExpression; item: Dummy) =
  assert false # TODO(add:CsPostfixUnaryExpression)

# proc add*(parent: var CsPostfixUnaryExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsPostfixUnaryExpression): string = assert false #TODO(gen:CsPostfixUnaryExpression)

# ============= CsPredefinedType ========


proc newCs*(t: typedesc[CsPredefinedType]; name: string): CsPredefinedType =
  new result
  result.typ = $typeof(t)
  result.name = name

proc extract*(t: typedesc[CsPredefinedType]; info: Info; data: AllNeededData): CsPredefinedType =
  var name: string
  if info.essentials.len > 0:
    name = info.essentials[0]
  else: name = ""
  result = newCs(CsPredefinedType, name)

proc gen*(c: var CsPredefinedType): string = assert false #TODO(gen:CsPredefinedType)

# ============= CsPrefixUnaryExpression ========

type CsPrefixUnaryExpression* = ref object of CsObject #TODO(type:CsPrefixUnaryExpression)

proc newCs*(t: typedesc[CsPrefixUnaryExpression]; name: string): CsPrefixUnaryExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsPrefixUnaryExpression)

proc extract*(t: typedesc[CsPrefixUnaryExpression]; info: Info): CsPrefixUnaryExpression = assert false #TODO(extract:CsPrefixUnaryExpression)

method add*(parent: var CsPrefixUnaryExpression; item: Dummy) =
  assert false # TODO(add:CsPrefixUnaryExpression)

# proc add*(parent: var CsPrefixUnaryExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsPrefixUnaryExpression): string = assert false #TODO(gen:CsPrefixUnaryExpression)

proc newCs*(t: typedesc[CsProperty]; name: string): CsProperty =
  new result
  result.typ = $typeof(t)
  result.name = name

proc extract*(t: typedesc[CsProperty]; info: Info): CsProperty =
  echo info
  let name = info.essentials[0] #name
  result = newCs(CsProperty, name)
  let cnt = info.essentials[1].parseInt # how many
  if cnt > 0:
    let acc1 = info.extras[0] # get, or set, or both
    case acc1
    of "get": result.hasGet = true
    of "set": result.hasSet = true
    if cnt > 1:
      let acc2 = info.extras[1]
      case acc2
      of "get": result.hasGet = true
      of "set": result.hasSet = true



method add*(parent: var CsProperty; a: CsPredefinedType) =
  parent.retType = a.name

# ============= CsQueryBody ========

type CsQueryBody* = ref object of CsObject #TODO(type:CsQueryBody)

proc newCs*(t: typedesc[CsQueryBody]; name: string): CsQueryBody =
  new result
  result.typ = $typeof(t)
#TODO(create:CsQueryBody)

proc extract*(t: typedesc[CsQueryBody]; info: Info): CsQueryBody = assert false #TODO(extract:CsQueryBody)

method add*(parent: var CsQueryBody; item: Dummy) =
  assert false # TODO(add:CsQueryBody)

# proc add*(parent: var CsQueryBody; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsQueryBody): string = assert false #TODO(gen:CsQueryBody)

# ============= CsQueryContinuation ========

type CsQueryContinuation* = ref object of CsObject #TODO(type:CsQueryContinuation)

proc newCs*(t: typedesc[CsQueryContinuation]; name: string): CsQueryContinuation =
  new result
  result.typ = $typeof(t)
#TODO(create:CsQueryContinuation)

proc extract*(t: typedesc[CsQueryContinuation]; info: Info): CsQueryContinuation = assert false #TODO(extract:CsQueryContinuation)

method add*(parent: var CsQueryContinuation; item: Dummy) =
  assert false # TODO(add:CsQueryContinuation)

# proc add*(parent: var CsQueryContinuation; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsQueryContinuation): string = assert false #TODO(gen:CsQueryContinuation)

# ============= CsQueryExpression ========

type CsQueryExpression* = ref object of CsObject #TODO(type:CsQueryExpression)

proc newCs*(t: typedesc[CsQueryExpression]; name: string): CsQueryExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsQueryExpression)

proc extract*(t: typedesc[CsQueryExpression]; info: Info): CsQueryExpression = assert false #TODO(extract:CsQueryExpression)

method add*(parent: var CsQueryExpression; item: Dummy) =
  assert false # TODO(add:CsQueryExpression)

# proc add*(parent: var CsQueryExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsQueryExpression): string = assert false #TODO(gen:CsQueryExpression)

# ============= CsRefExpression ========

type CsRefExpression* = ref object of CsObject #TODO(type:CsRefExpression)

proc newCs*(t: typedesc[CsRefExpression]; name: string): CsRefExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsRefExpression)

proc extract*(t: typedesc[CsRefExpression]; info: Info): CsRefExpression = assert false #TODO(extract:CsRefExpression)

method add*(parent: var CsRefExpression; item: Dummy) =
  assert false # TODO(add:CsRefExpression)

# proc add*(parent: var CsRefExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsRefExpression): string = assert false #TODO(gen:CsRefExpression)

# ============= CsRefTypeExpression ========

type CsRefTypeExpression* = ref object of CsObject #TODO(type:CsRefTypeExpression)

proc newCs*(t: typedesc[CsRefTypeExpression]; name: string): CsRefTypeExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsRefTypeExpression)

proc extract*(t: typedesc[CsRefTypeExpression]; info: Info): CsRefTypeExpression = assert false #TODO(extract:CsRefTypeExpression)

method add*(parent: var CsRefTypeExpression; item: Dummy) =
  assert false # TODO(add:CsRefTypeExpression)

# proc add*(parent: var CsRefTypeExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsRefTypeExpression): string = assert false #TODO(gen:CsRefTypeExpression)

# ============= CsRefType ========

type CsRefType* = ref object of CsObject #TODO(type:CsRefType)

proc newCs*(t: typedesc[CsRefType]; name: string): CsRefType =
  new result
  result.typ = $typeof(t)
#TODO(create:CsRefType)

proc extract*(t: typedesc[CsRefType]; info: Info): CsRefType = assert false #TODO(extract:CsRefType)

method add*(parent: var CsRefType; item: Dummy) =
  assert false # TODO(add:CsRefType)

# proc add*(parent: var CsRefType; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsRefType): string = assert false #TODO(gen:CsRefType)

# ============= CsRefValueExpression ========

type CsRefValueExpression* = ref object of CsObject #TODO(type:CsRefValueExpression)

proc newCs*(t: typedesc[CsRefValueExpression]; name: string): CsRefValueExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsRefValueExpression)

proc extract*(t: typedesc[CsRefValueExpression]; info: Info): CsRefValueExpression = assert false #TODO(extract:CsRefValueExpression)

method add*(parent: var CsRefValueExpression; item: Dummy) =
  assert false # TODO(add:CsRefValueExpression)

# proc add*(parent: var CsRefValueExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsRefValueExpression): string = assert false #TODO(gen:CsRefValueExpression)

# ============= CsReturnStatement ========

proc newCs*(t: typedesc[CsReturnStatement]): CsReturnStatement =
  new result
  result.typ = $typeof(t)
  result.ttype = "CsReturnStatement"

proc extract*(t: typedesc[CsReturnStatement]; info: Info): CsReturnStatement =
  result = newCs(CsReturnStatement)
  let expectedFollowupAsString = if info.essentials.len > 0: info.essentials[0] else: ""
  echo "From C# side -- expected to follow after return: " & expectedFollowupAsString


method add*(parent: var CsReturnStatement; item: BodyExpr) =
  if parent.isComplete:
    assert false, "already complete with bodyExpr:" & $(not parent.expr.isNil)
  parent.expr = item; parent.isComplete = true


method gen*(c: CsReturnStatement): string =
  result = if c.expr.isNil: "return"
  else: "return " & c.expr.gen()


# ============= CsSelectClause ========

type CsSelectClause* = ref object of CsObject #TODO(type:CsSelectClause)

proc newCs*(t: typedesc[CsSelectClause]; name: string): CsSelectClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsSelectClause)

proc extract*(t: typedesc[CsSelectClause]; info: Info): CsSelectClause = assert false #TODO(extract:CsSelectClause)

method add*(parent: var CsSelectClause; item: Dummy) =
  assert false # TODO(add:CsSelectClause)

# proc add*(parent: var CsSelectClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsSelectClause): string = assert false #TODO(gen:CsSelectClause)

type CsSimpleBaseType* = ref object of CsObject #TODO(type:CsSimpleBaseType)

proc newCs*(t: typedesc[CsSimpleBaseType]; name: string): CsSimpleBaseType =
  new result
  result.typ = $typeof(t)
#TODO(create:CsSimpleBaseType)

proc extract*(t: typedesc[CsSimpleBaseType]; info: Info): CsSimpleBaseType = 
  new result   # TODO


method add*(parent: var CsSimpleBaseType; item: Dummy) =
  assert false # TODO(add:CsSimpleBaseType)

# proc add*(parent: var CsSimpleBaseType; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsSimpleBaseType): string = assert false #TODO(gen:CsSimpleBaseType)

# ============= CsSimpleLambdaExpression ========

type CsSimpleLambdaExpression* = ref object of CsObject #TODO(type:CsSimpleLambdaExpression)

proc newCs*(t: typedesc[CsSimpleLambdaExpression]; name: string): CsSimpleLambdaExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsSimpleLambdaExpression)

proc extract*(t: typedesc[CsSimpleLambdaExpression]; info: Info): CsSimpleLambdaExpression = assert false #TODO(extract:CsSimpleLambdaExpression)

method add*(parent: var CsSimpleLambdaExpression; item: Dummy) =
  assert false # TODO(add:CsSimpleLambdaExpression)

# proc add*(parent: var CsSimpleLambdaExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsSimpleLambdaExpression): string = assert false #TODO(gen:CsSimpleLambdaExpression)

# ============= CsSingleVariableDesignation ========

type CsSingleVariableDesignation* = ref object of CsObject #TODO(type:CsSingleVariableDesignation)

proc newCs*(t: typedesc[CsSingleVariableDesignation]; name: string): CsSingleVariableDesignation =
  new result
  result.typ = $typeof(t)
#TODO(create:CsSingleVariableDesignation)

proc extract*(t: typedesc[CsSingleVariableDesignation]; info: Info): CsSingleVariableDesignation = assert false #TODO(extract:CsSingleVariableDesignation)

method add*(parent: var CsSingleVariableDesignation; item: Dummy) =
  assert false # TODO(add:CsSingleVariableDesignation)

# proc add*(parent: var CsSingleVariableDesignation; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsSingleVariableDesignation): string = assert false #TODO(gen:CsSingleVariableDesignation)

# ============= CsSizeOfExpression ========

type CsSizeOfExpression* = ref object of CsObject #TODO(type:CsSizeOfExpression)

proc newCs*(t: typedesc[CsSizeOfExpression]; name: string): CsSizeOfExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsSizeOfExpression)

proc extract*(t: typedesc[CsSizeOfExpression]; info: Info): CsSizeOfExpression = assert false #TODO(extract:CsSizeOfExpression)

method add*(parent: var CsSizeOfExpression; item: Dummy) =
  assert false # TODO(add:CsSizeOfExpression)

# proc add*(parent: var CsSizeOfExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsSizeOfExpression): string = assert false #TODO(gen:CsSizeOfExpression)

# ============= CsStackAllocArrayCreationExpression ========

type CsStackAllocArrayCreationExpression* = ref object of CsObject #TODO(type:CsStackAllocArrayCreationExpression)

proc newCs*(t: typedesc[CsStackAllocArrayCreationExpression]; name: string): CsStackAllocArrayCreationExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsStackAllocArrayCreationExpression)

proc extract*(t: typedesc[CsStackAllocArrayCreationExpression]; info: Info): CsStackAllocArrayCreationExpression = assert false #TODO(extract:CsStackAllocArrayCreationExpression)

method add*(parent: var CsStackAllocArrayCreationExpression; item: Dummy) =
  assert false # TODO(add:CsStackAllocArrayCreationExpression)

# proc add*(parent: var CsStackAllocArrayCreationExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsStackAllocArrayCreationExpression): string = assert false #TODO(gen:CsStackAllocArrayCreationExpression)

# ============= CsStruct ========

type CsStruct* = ref object of CsObject #TODO(type:CsStruct)

proc newCs*(t: typedesc[CsStruct]; name: string): CsStruct =
  new result
  result.typ = $typeof(t)
#TODO(create:CsStruct)

proc extract*(t: typedesc[CsStruct]; info: Info): CsStruct = assert false #TODO(extract:CsStruct)

method add*(parent: var CsStruct; item: Dummy) =
  assert false # TODO(add:CsStruct)

# proc add*(parent: var CsStruct; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsStruct): string = assert false #TODO(gen:CsStruct)

# ============= CsSwitchSection ========

type CsSwitchSection* = ref object of CsObject #TODO(type:CsSwitchSection)

proc newCs*(t: typedesc[CsSwitchSection]; name: string): CsSwitchSection =
  new result
  result.typ = $typeof(t)
#TODO(create:CsSwitchSection)

proc extract*(t: typedesc[CsSwitchSection]; info: Info): CsSwitchSection = assert false #TODO(extract:CsSwitchSection)

method add*(parent: var CsSwitchSection; item: Dummy) =
  assert false # TODO(add:CsSwitchSection)

# proc add*(parent: var CsSwitchSection; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsSwitchSection): string = assert false #TODO(gen:CsSwitchSection)

# ============= CsSwitchStatement ========

type CsSwitchStatement* = ref object of CsObject #TODO(type:CsSwitchStatement)

proc newCs*(t: typedesc[CsSwitchStatement]; name: string): CsSwitchStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsSwitchStatement)

proc extract*(t: typedesc[CsSwitchStatement]; info: Info): CsSwitchStatement = assert false #TODO(extract:CsSwitchStatement)

method add*(parent: var CsSwitchStatement; item: Dummy) =
  assert false # TODO(add:CsSwitchStatement)

# proc add*(parent: var CsSwitchStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsSwitchStatement): string = assert false #TODO(gen:CsSwitchStatement)

type CsThisExpression* = ref object of CsObject #TODO(type:CsThisExpression)

proc newCs*(t: typedesc[CsThisExpression]; name: string): CsThisExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsThisExpression)

proc extract*(t: typedesc[CsThisExpression]; info: Info): CsThisExpression = assert false #TODO(extract:CsThisExpression)

method add*(parent: var CsThisExpression; item: Dummy) =
  assert false # TODO(add:CsThisExpression)

# proc add*(parent: var CsThisExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsThisExpression): string = assert false #TODO(gen:CsThisExpression)

# ============= CsThrowExpression ========

type CsThrowExpression* = ref object of CsObject #TODO(type:CsThrowExpression)

proc newCs*(t: typedesc[CsThrowExpression]; name: string): CsThrowExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsThrowExpression)

proc extract*(t: typedesc[CsThrowExpression]; info: Info): CsThrowExpression = assert false #TODO(extract:CsThrowExpression)

method add*(parent: var CsThrowExpression; item: Dummy) =
  assert false # TODO(add:CsThrowExpression)

# proc add*(parent: var CsThrowExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsThrowExpression): string = assert false #TODO(gen:CsThrowExpression)

# ============= CsThrowStatement ========

type CsThrowStatement* = ref object of CsObject #TODO(type:CsThrowStatement)

proc newCs*(t: typedesc[CsThrowStatement]; name: string): CsThrowStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsThrowStatement)

proc extract*(t: typedesc[CsThrowStatement]; info: Info): CsThrowStatement = assert false #TODO(extract:CsThrowStatement)

method add*(parent: var CsThrowStatement; item: Dummy) =
  assert false # TODO(add:CsThrowStatement)

# proc add*(parent: var CsThrowStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsThrowStatement): string = assert false #TODO(gen:CsThrowStatement)

# ============= CsTryStatement ========

type CsTryStatement* = ref object of CsObject #TODO(type:CsTryStatement)

proc newCs*(t: typedesc[CsTryStatement]; name: string): CsTryStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTryStatement)

proc extract*(t: typedesc[CsTryStatement]; info: Info): CsTryStatement = assert false #TODO(extract:CsTryStatement)

method add*(parent: var CsTryStatement; item: Dummy) =
  assert false # TODO(add:CsTryStatement)

# proc add*(parent: var CsTryStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTryStatement): string = assert false #TODO(gen:CsTryStatement)

# ============= CsTupleElement ========

type CsTupleElement* = ref object of CsObject #TODO(type:CsTupleElement)

proc newCs*(t: typedesc[CsTupleElement]; name: string): CsTupleElement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTupleElement)

proc extract*(t: typedesc[CsTupleElement]; info: Info): CsTupleElement = assert false #TODO(extract:CsTupleElement)

method add*(parent: var CsTupleElement; item: Dummy) =
  assert false # TODO(add:CsTupleElement)

# proc add*(parent: var CsTupleElement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTupleElement): string = assert false #TODO(gen:CsTupleElement)

# ============= CsTupleExpression ========

type CsTupleExpression* = ref object of CsObject #TODO(type:CsTupleExpression)

proc newCs*(t: typedesc[CsTupleExpression]; name: string): CsTupleExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTupleExpression)

proc extract*(t: typedesc[CsTupleExpression]; info: Info): CsTupleExpression = assert false #TODO(extract:CsTupleExpression)

method add*(parent: var CsTupleExpression; item: Dummy) =
  assert false # TODO(add:CsTupleExpression)

# proc add*(parent: var CsTupleExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTupleExpression): string = assert false #TODO(gen:CsTupleExpression)

# ============= CsTupleType ========

type CsTupleType* = ref object of CsObject #TODO(type:CsTupleType)

proc newCs*(t: typedesc[CsTupleType]; name: string): CsTupleType =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTupleType)

proc extract*(t: typedesc[CsTupleType]; info: Info): CsTupleType = assert false #TODO(extract:CsTupleType)

method add*(parent: var CsTupleType; item: Dummy) =
  assert false # TODO(add:CsTupleType)

# proc add*(parent: var CsTupleType; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTupleType): string = assert false #TODO(gen:CsTupleType)

# ============= CsTypeArgumentList ========



proc newCs*(t: typedesc[CsTypeArgumentList]): CsTypeArgumentList =
  new result
  result.typ = $typeof(t)
  

proc extract*(t: typedesc[CsTypeArgumentList]; info: Info): CsTypeArgumentList = 
  result = newCs(CsTypeArgumentList)
  result.types= info.essentials[0].split(",").mapIt(it.strip)

method add*(parent: var CsTypeArgumentList; item: Dummy) =
  assert false # TODO(add:CsTypeArgumentList)

# proc add*(parent: var CsTypeArgumentList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTypeArgumentList): string = assert false #TODO(gen:CsTypeArgumentList)

# ============= CsTypeConstraint ========

type CsTypeConstraint* = ref object of CsObject #TODO(type:CsTypeConstraint)

proc newCs*(t: typedesc[CsTypeConstraint]; name: string): CsTypeConstraint =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTypeConstraint)

proc extract*(t: typedesc[CsTypeConstraint]; info: Info): CsTypeConstraint = assert false #TODO(extract:CsTypeConstraint)

method add*(parent: var CsTypeConstraint; item: Dummy) =
  assert false # TODO(add:CsTypeConstraint)

# proc add*(parent: var CsTypeConstraint; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTypeConstraint): string = assert false #TODO(gen:CsTypeConstraint)

type CsTypeOfExpression* = ref object of CsObject #TODO(type:CsTypeOfExpression)

proc newCs*(t: typedesc[CsTypeOfExpression]; name: string): CsTypeOfExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTypeOfExpression)

proc extract*(t: typedesc[CsTypeOfExpression]; info: Info): CsTypeOfExpression = assert false #TODO(extract:CsTypeOfExpression)

method add*(parent: var CsTypeOfExpression; item: Dummy) =
  assert false # TODO(add:CsTypeOfExpression)

# proc add*(parent: var CsTypeOfExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTypeOfExpression): string = assert false #TODO(gen:CsTypeOfExpression)

# ============= CsTypeParameterConstraintClause ========

type CsTypeParameterConstraintClause* = ref object of CsObject #TODO(type:CsTypeParameterConstraintClause)

proc newCs*(t: typedesc[CsTypeParameterConstraintClause]; name: string): CsTypeParameterConstraintClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTypeParameterConstraintClause)

proc extract*(t: typedesc[CsTypeParameterConstraintClause]; info: Info): CsTypeParameterConstraintClause = assert false #TODO(extract:CsTypeParameterConstraintClause)

method add*(parent: var CsTypeParameterConstraintClause; item: Dummy) =
  assert false # TODO(add:CsTypeParameterConstraintClause)

# proc add*(parent: var CsTypeParameterConstraintClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTypeParameterConstraintClause): string = assert false #TODO(gen:CsTypeParameterConstraintClause)

# ============= CsTypeParameterList ========

type CsTypeParameterList* = ref object of CsObject #TODO(type:CsTypeParameterList)

proc newCs*(t: typedesc[CsTypeParameterList]; name: string): CsTypeParameterList =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTypeParameterList)

proc extract*(t: typedesc[CsTypeParameterList]; info: Info): CsTypeParameterList = assert false #TODO(extract:CsTypeParameterList)

method add*(parent: var CsTypeParameterList; item: Dummy) =
  assert false # TODO(add:CsTypeParameterList)

# proc add*(parent: var CsTypeParameterList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTypeParameterList): string = assert false #TODO(gen:CsTypeParameterList)

# ============= CsTypeParameter ========

type CsTypeParameter* = ref object of CsObject #TODO(type:CsTypeParameter)

proc newCs*(t: typedesc[CsTypeParameter]; name: string): CsTypeParameter =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTypeParameter)

proc extract*(t: typedesc[CsTypeParameter]; info: Info): CsTypeParameter = assert false #TODO(extract:CsTypeParameter)

method add*(parent: var CsTypeParameter; item: Dummy) =
  assert false # TODO(add:CsTypeParameter)

# proc add*(parent: var CsTypeParameter; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTypeParameter): string = assert false #TODO(gen:CsTypeParameter)

# ============= CsUnsafeStatement ========

type CsUnsafeStatement* = ref object of CsObject #TODO(type:CsUnsafeStatement)

proc newCs*(t: typedesc[CsUnsafeStatement]; name: string): CsUnsafeStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsUnsafeStatement)

proc extract*(t: typedesc[CsUnsafeStatement]; info: Info): CsUnsafeStatement = assert false #TODO(extract:CsUnsafeStatement)

method add*(parent: var CsUnsafeStatement; item: Dummy) =
  assert false # TODO(add:CsUnsafeStatement)

# proc add*(parent: var CsUnsafeStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsUnsafeStatement): string = assert false #TODO(gen:CsUnsafeStatement)

# ============= CsUsingDirective ========


proc newCs*(t: typedesc[CsUsingDirective]; name: string): CsUsingDirective =
  new result
  result.typ = $typeof(t)
  result.name = name

proc extract*(t: typedesc[CsUsingDirective]; info: Info): CsUsingDirective =
  let name = info.essentials[0]
  result = newCs(CsUsingDirective, name)

method add*(parent: var CsUsingDirective; item: Dummy) =

  assert false # TODO(add:CsUsingDirective)

# proc add*(parent: var CsUsingDirective; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

# ============= CsUsingStatement ========

type CsUsingStatement* = ref object of CsObject #TODO(type:CsUsingStatement)

proc newCs*(t: typedesc[CsUsingStatement]; name: string): CsUsingStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsUsingStatement)

proc extract*(t: typedesc[CsUsingStatement]; info: Info): CsUsingStatement = assert false #TODO(extract:CsUsingStatement)

method add*(parent: var CsUsingStatement; item: Dummy) =
  assert false # TODO(add:CsUsingStatement)

# proc add*(parent: var CsUsingStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsUsingStatement): string = assert false #TODO(gen:CsUsingStatement)

# ============= CsWhenClause ========

type CsWhenClause* = ref object of CsObject #TODO(type:CsWhenClause)

proc newCs*(t: typedesc[CsWhenClause]; name: string): CsWhenClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsWhenClause)

proc extract*(t: typedesc[CsWhenClause]; info: Info): CsWhenClause = assert false #TODO(extract:CsWhenClause)

method add*(parent: var CsWhenClause; item: Dummy) =
  assert false # TODO(add:CsWhenClause)

# proc add*(parent: var CsWhenClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsWhenClause): string = assert false #TODO(gen:CsWhenClause)

# ============= CsWhereClause ========

type CsWhereClause* = ref object of CsObject #TODO(type:CsWhereClause)

proc newCs*(t: typedesc[CsWhereClause]; name: string): CsWhereClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsWhereClause)

proc extract*(t: typedesc[CsWhereClause]; info: Info): CsWhereClause = assert false #TODO(extract:CsWhereClause)

method add*(parent: var CsWhereClause; item: Dummy) =
  assert false # TODO(add:CsWhereClause)

# proc add*(parent: var CsWhereClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsWhereClause): string = assert false #TODO(gen:CsWhereClause)

# ============= CsWhileStatement ========

type CsWhileStatement* = ref object of CsObject #TODO(type:CsWhileStatement)

proc newCs*(t: typedesc[CsWhileStatement]; name: string): CsWhileStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsWhileStatement)

proc extract*(t: typedesc[CsWhileStatement]; info: Info): CsWhileStatement = assert false #TODO(extract:CsWhileStatement)

method add*(parent: var CsWhileStatement; item: Dummy) =
  assert false # TODO(add:CsWhileStatement)

# proc add*(parent: var CsWhileStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsWhileStatement): string = assert false #TODO(gen:CsWhileStatement)

# ============= CsYieldStatement ========

type CsYieldStatement* = ref object of CsObject #TODO(type:CsYieldStatement)

proc newCs*(t: typedesc[CsYieldStatement]; name: string): CsYieldStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsYieldStatement)

proc extract*(t: typedesc[CsYieldStatement]; info: Info): CsYieldStatement = assert false #TODO(extract:CsYieldStatement)

method add*(parent: var CsYieldStatement; item: Dummy) =
  assert false # TODO(add:CsYieldStatement)

# proc add*(parent: var CsYieldStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsYieldStatement): string = assert false #TODO(gen:CsYieldStatement)

# ======================================================

type CsBlock* = ref object of CsObject

method add*(parent:var CsBlock; item: Dummy) = assert false
proc extract*(t:typedesc[CsBlock], info:Info,data:AllNeededData):CsBlock = 
  new result
  # assert false

method gen*(c: var CsBlock):string = assert false

type CsVariable* = ref object of BodyExpr 
  # name*:string
  thetype*:string
  generic*:CsGenericName

type CsLocalDeclarationStatement* = ref object of BodyExpr
  names*: seq[string]
  vartype*: string
  lhs*: CsVariable # lhs = left hand side, rhs = right hand side.
  rhs*:CsVariableDeclarator  # which has what's after the equals-value-clause.

proc extract*(t: typedesc[CsLocalDeclarationStatement]; info: Info; data:AllNeededData): CsLocalDeclarationStatement =
  new result
  echo info
  result.vartype = info.essentials[1]
  result.names = info.essentials[0].split(",").mapIt(it.strip)
proc gen*(c: var CsLocalDeclarationStatement): string = assert false #TODO(gen:CsLocalDeclarationStatement)
method add*(parent: var CsMethod; t: CsLocalDeclarationStatement) =
  parent.body.add t
proc newCs*(t: typedesc[CsLocalDeclarationStatement]; name: string): CsLocalDeclarationStatement =
  new result
  result.typ = $typeof(t)
  result.ttype = "CsLocalDeclarationStatement"

method add*(parent: var CsLocalDeclarationStatement; item: CsVariable) =
  parent.lhs = item
  
method add*(parent: var CsLocalDeclarationStatement; item: CsGenericName) =
  parent.lhs.generic = item

method add*(parent: var CsLocalDeclarationStatement; item: CsTypeArgumentList) =
  parent.lhs.generic.typearglist = item
method add*(parent: var CsLocalDeclarationStatement; item: CsVariableDeclarator) =
  parent.rhs = item

method add*(parent:var CsVariable; item: Dummy) = assert false

proc extract*(t:typedesc[CsVariable], info:Info,data:AllNeededData):CsVariable = 
  new result
  let p = info.essentials[0].split(":"); 
  result.thetype = p[1]
  assert p[0] == "type"
  let n = info.essentials[1].split(":"); 
  result.name = n[1]
  assert n[0] == "name"

method gen*(c: var CsVariable):string = assert false

type CsBinaryPattern* = ref object of CsObject
method add*(parent:var CsBinaryPattern; item: Dummy) = assert false
proc extract*(t:typedesc[CsBinaryPattern], info:Info,data:AllNeededData):CsBinaryPattern = assert false
method gen*(c: var CsBinaryPattern):string = assert false

type CsDiscardPattern* = ref object of CsObject
method add*(parent:var CsDiscardPattern; item: Dummy) = assert false
proc extract*(t:typedesc[CsDiscardPattern], info:Info,data:AllNeededData):CsDiscardPattern = assert false
method gen*(c: var CsDiscardPattern):string = assert false

type CsFunctionPointerType* = ref object of CsObject
method add*(parent:var CsFunctionPointerType; item: Dummy) = assert false
proc extract*(t:typedesc[CsFunctionPointerType], info:Info,data:AllNeededData):CsFunctionPointerType = assert false
method gen*(c: var CsFunctionPointerType):string = assert false

type CsImplicitObjectCreationExpression* = ref object of CsObject
method add*(parent:var CsImplicitObjectCreationExpression; item: Dummy) = assert false
proc extract*(t:typedesc[CsImplicitObjectCreationExpression], info:Info,data:AllNeededData):CsImplicitObjectCreationExpression = assert false
method gen*(c: var CsImplicitObjectCreationExpression):string = assert false

type CsMemberAccessExpression* = ref object of CsObject
method add*(parent:var CsMemberAccessExpression; item: Dummy) = assert false


proc extract*(t:typedesc[CsMemberAccessExpression], info:Info,data:AllNeededData):CsMemberAccessExpression =
  new result  # i think we can discard it.
  
method gen*(c: var CsMemberAccessExpression):string = assert false

type CsParenthesizedPattern* = ref object of CsObject
method add*(parent:var CsParenthesizedPattern; item: Dummy) = assert false
proc extract*(t:typedesc[CsParenthesizedPattern], info:Info,data:AllNeededData):CsParenthesizedPattern = assert false
method gen*(c: var CsParenthesizedPattern):string = assert false

type CsPositionalPatternClause* = ref object of CsObject
method add*(parent:var CsPositionalPatternClause; item: Dummy) = assert false
proc extract*(t:typedesc[CsPositionalPatternClause], info:Info,data:AllNeededData):CsPositionalPatternClause = assert false
method gen*(c: var CsPositionalPatternClause):string = assert false

type CsPrimaryConstructorBaseType* = ref object of CsObject
method add*(parent:var CsPrimaryConstructorBaseType; item: Dummy) = assert false
proc extract*(t:typedesc[CsPrimaryConstructorBaseType], info:Info,data:AllNeededData):CsPrimaryConstructorBaseType = assert false
method gen*(c: var CsPrimaryConstructorBaseType):string = assert false

type CsPropertyPatternClause* = ref object of CsObject
method add*(parent:var CsPropertyPatternClause; item: Dummy) = assert false
proc extract*(t:typedesc[CsPropertyPatternClause], info:Info,data:AllNeededData):CsPropertyPatternClause = assert false
method gen*(c: var CsPropertyPatternClause):string = assert false

type CsRangeExpression* = ref object of CsObject
method add*(parent:var CsRangeExpression; item: Dummy) = assert false
proc extract*(t:typedesc[CsRangeExpression], info:Info,data:AllNeededData):CsRangeExpression = assert false
method gen*(c: var CsRangeExpression):string = assert false

type CsRecord* = ref object of CsObject
method add*(parent:var CsRecord; item: Dummy) = assert false
proc extract*(t:typedesc[CsRecord], info:Info,data:AllNeededData):CsRecord = assert false
method gen*(c: var CsRecord):string = assert false

type CsRecursivePattern* = ref object of CsObject
method add*(parent:var CsRecursivePattern; item: Dummy) = assert false
proc extract*(t:typedesc[CsRecursivePattern], info:Info,data:AllNeededData):CsRecursivePattern = assert false
method gen*(c: var CsRecursivePattern):string = assert false

type CsRelationalPattern* = ref object of CsObject
method add*(parent:var CsRelationalPattern; item: Dummy) = assert false
proc extract*(t:typedesc[CsRelationalPattern], info:Info,data:AllNeededData):CsRelationalPattern = assert false
method gen*(c: var CsRelationalPattern):string = assert false

type CsSubpattern* = ref object of CsObject
method add*(parent:var CsSubpattern; item: Dummy) = assert false
proc extract*(t:typedesc[CsSubpattern], info:Info,data:AllNeededData):CsSubpattern = assert false
method gen*(c: var CsSubpattern):string = assert false

type CsSwitchExpression* = ref object of CsObject
method add*(parent:var CsSwitchExpression; item: Dummy) = assert false
proc extract*(t:typedesc[CsSwitchExpression], info:Info,data:AllNeededData):CsSwitchExpression = assert false
method gen*(c: var CsSwitchExpression):string = assert false

type CsSwitchExpressionArm* = ref object of CsObject
method add*(parent:var CsSwitchExpressionArm; item: Dummy) = assert false
proc extract*(t:typedesc[CsSwitchExpressionArm], info:Info,data:AllNeededData):CsSwitchExpressionArm = assert false
method gen*(c: var CsSwitchExpressionArm):string = assert false

type CsTypePattern* = ref object of CsObject
method add*(parent:var CsTypePattern; item: Dummy) = assert false
proc extract*(t:typedesc[CsTypePattern], info:Info,data:AllNeededData):CsTypePattern = assert false
method gen*(c: var CsTypePattern):string = assert false

type CsUnaryPattern* = ref object of CsObject
method add*(parent:var CsUnaryPattern; item: Dummy) = assert false
proc extract*(t:typedesc[CsUnaryPattern], info:Info,data:AllNeededData):CsUnaryPattern = assert false
method gen*(c: var CsUnaryPattern):string = assert false

type CsVarPattern* = ref object of CsObject
method add*(parent:var CsVarPattern; item: Dummy) = assert false
proc extract*(t:typedesc[CsVarPattern], info:Info,data:AllNeededData):CsVarPattern = assert false
method gen*(c: var CsVarPattern):string = assert false

type CsWithExpression* = ref object of CsObject
method add*(parent:var CsWithExpression; item: Dummy) = assert false
proc extract*(t:typedesc[CsWithExpression], info:Info,data:AllNeededData):CsWithExpression = assert false
method gen*(c: var CsWithExpression):string = assert false

type CsImplicitStackAllocArrayCreationExpression* = ref object of CsObject
method add*(parent:var CsImplicitStackAllocArrayCreationExpression; item: Dummy) = assert false
proc extract*(t:typedesc[CsImplicitStackAllocArrayCreationExpression], info:Info,data:AllNeededData):CsImplicitStackAllocArrayCreationExpression = assert false
method gen*(c: var CsImplicitStackAllocArrayCreationExpression):string = assert false