# {.experimental: "codeReordering".}
import ../types
import ../state

import uuids, options, sets, tables, sequtils, hashes

# ============= CsAccessorList ========

type CsAccessorList* = ref object of CsObject #TODO(type:CsAccessorList)

proc newCs*(t: typedesc[CsAccessorList]; name: string): CsAccessorList =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAccessorList)

proc extract*(t: typedesc[CsAccessorList]; info: Info): CsAccessorList = discard #TODO(extract:CsAccessorList)

proc add*(parent: var CsAccessorList; item: Dummy) =
  discard # TODO(add:CsAccessorList)
  # item.parentId = parent.id
# proc add*(parent: var CsAccessorList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO


proc gen*(c: var CsAccessorList): string = discard #TODO(gen:CsAccessorList)

# ============= CsAccessor ========

type CsAccessor* = ref object of CsObject #TODO(type:CsAccessor)

proc newCs*(t: typedesc[CsAccessor]; name: string): CsAccessor =
  new result
  result.typ = $typeof(t)
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAccessor)

proc extract*(t: typedesc[CsAccessor]; info: Info): CsAccessor = discard #TODO(extract:CsAccessor)

proc add*(parent: var CsAccessor; item: Dummy) =
  discard # TODO(add:CsAccessor)
  # item.parentId = parent.id
# proc add*(parent: var CsAccessor; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAccessor): string = discard #TODO(gen:CsAccessor)

# ============= CsAliasQualifiedName ========

type CsAliasQualifiedName* = ref object of CsObject #TODO(type:CsAliasQualifiedName)

proc newCs*(t: typedesc[CsAliasQualifiedName]; name: string): CsAliasQualifiedName =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAliasQualifiedName)

proc extract*(t: typedesc[CsAliasQualifiedName]; info: Info): CsAliasQualifiedName = discard #TODO(extract:CsAliasQualifiedName)

proc add*(parent: var CsAliasQualifiedName; item: Dummy) =
  discard # TODO(add:CsAliasQualifiedName)
  # item.parentId = parent.id
# proc add*(parent: var CsAliasQualifiedName; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAliasQualifiedName): string = discard #TODO(gen:CsAliasQualifiedName)

# ============= CsField ========

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

# ============= CsAnonymousMethodExpression ========

type CsAnonymousMethodExpression* = ref object of CsObject #TODO(type:CsAnonymousMethodExpression)

proc newCs*(t: typedesc[CsAnonymousMethodExpression]; name: string): CsAnonymousMethodExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAnonymousMethodExpression)

proc extract*(t: typedesc[CsAnonymousMethodExpression]; info: Info): CsAnonymousMethodExpression = discard #TODO(extract:CsAnonymousMethodExpression)

proc add*(parent: var CsAnonymousMethodExpression; item: Dummy) =
  discard # TODO(add:CsAnonymousMethodExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsAnonymousMethodExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAnonymousMethodExpression): string = discard #TODO(gen:CsAnonymousMethodExpression)

# ============= CsAnonymousObjectCreationExpression ========

type CsAnonymousObjectCreationExpression* = ref object of CsObject #TODO(type:CsAnonymousObjectCreationExpression)

proc newCs*(t: typedesc[CsAnonymousObjectCreationExpression]; name: string): CsAnonymousObjectCreationExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAnonymousObjectCreationExpression)

proc extract*(t: typedesc[CsAnonymousObjectCreationExpression]; info: Info): CsAnonymousObjectCreationExpression = discard #TODO(extract:CsAnonymousObjectCreationExpression)

proc add*(parent: var CsAnonymousObjectCreationExpression; item: Dummy) =
  discard # TODO(add:CsAnonymousObjectCreationExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsAnonymousObjectCreationExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAnonymousObjectCreationExpression): string = discard #TODO(gen:CsAnonymousObjectCreationExpression)

# ============= CsAnonymousObjectMemberDeclarator ========

type CsAnonymousObjectMemberDeclarator* = ref object of CsObject #TODO(type:CsAnonymousObjectMemberDeclarator)

proc newCs*(t: typedesc[CsAnonymousObjectMemberDeclarator]; name: string): CsAnonymousObjectMemberDeclarator =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAnonymousObjectMemberDeclarator)

proc extract*(t: typedesc[CsAnonymousObjectMemberDeclarator]; info: Info): CsAnonymousObjectMemberDeclarator = discard #TODO(extract:CsAnonymousObjectMemberDeclarator)

proc add*(parent: var CsAnonymousObjectMemberDeclarator; item: Dummy) =
  discard # TODO(add:CsAnonymousObjectMemberDeclarator)
  # item.parentId = parent.id
# proc add*(parent: var CsAnonymousObjectMemberDeclarator; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAnonymousObjectMemberDeclarator): string = discard #TODO(gen:CsAnonymousObjectMemberDeclarator)

# ============= CsArgumentList ========

type CsArgumentList* = ref object of CsObject
  args*: seq[string]
  # args*: seq[CsArgument] # TODO: probably needed, when arguments are more complex. need to see the flow.

import sequtils, strutils
proc newCs*(t: typedesc[CsArgumentList]; args: seq[string]): CsArgumentList =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.args = args.mapIt(it.strip)

proc extract*(t: typedesc[CsArgumentList]; info: Info): CsArgumentList =
  result = newCs(CsArgumentList, info.essentials[0].split(","))

# proc add*(parent: var CsArgumentList; item: Dummy, data:AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsArgumentList; item: Dummy) =
#   item.parentId = parent.id
  discard

proc gen*(c: var CsArgumentList): string =
  result = c.args.join(", ")

# ============= CsArgument ========

type CsArgument* = ref object of CsObject #TODO(type:CsArgument)

proc newCs*(t: typedesc[CsArgument]; name: string): CsArgument =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsArgument)

proc extract*(t: typedesc[CsArgument]; info: Info): CsArgument = discard #TODO(extract:CsArgument)

proc add*(parent: var CsArgument; item: Dummy) =
  discard # TODO(add:CsArgument)
  # item.parentId = parent.id
# proc add*(parent: var CsArgument; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsArgument): string = discard #TODO(gen:CsArgument)

# ============= CsArrayCreationExpression ========

type CsArrayCreationExpression* = ref object of CsObject #TODO(type:CsArrayCreationExpression)

proc newCs*(t: typedesc[CsArrayCreationExpression]; name: string): CsArrayCreationExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsArrayCreationExpression)

proc extract*(t: typedesc[CsArrayCreationExpression]; info: Info): CsArrayCreationExpression = discard #TODO(extract:CsArrayCreationExpression)

proc add*(parent: var CsArrayCreationExpression; item: Dummy) =
  discard # TODO(add:CsArrayCreationExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsArrayCreationExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsArrayCreationExpression): string = discard #TODO(gen:CsArrayCreationExpression)

# ============= CsArrayRankSpecifier ========

type CsArrayRankSpecifier* = ref object of CsObject #TODO(type:CsArrayRankSpecifier)

proc newCs*(t: typedesc[CsArrayRankSpecifier]; name: string): CsArrayRankSpecifier =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsArrayRankSpecifier)

proc extract*(t: typedesc[CsArrayRankSpecifier]; info: Info): CsArrayRankSpecifier = discard #TODO(extract:CsArrayRankSpecifier)

proc add*(parent: var CsArrayRankSpecifier; item: Dummy) =
  discard # TODO(add:CsArrayRankSpecifier)
  # item.parentId = parent.id
# proc add*(parent: var CsArrayRankSpecifier; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsArrayRankSpecifier): string = discard #TODO(gen:CsArrayRankSpecifier)

# ============= CsArrayType ========

type CsArrayType* = ref object of CsObject #TODO(type:CsArrayType)

proc newCs*(t: typedesc[CsArrayType]; name: string): CsArrayType =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsArrayType)

proc extract*(t: typedesc[CsArrayType]; info: Info): CsArrayType = discard #TODO(extract:CsArrayType)

proc add*(parent: var CsArrayType; item: Dummy) =
  discard # TODO(add:CsArrayType)
  # item.parentId = parent.id
# proc add*(parent: var CsArrayType; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsArrayType): string = discard #TODO(gen:CsArrayType)

# ============= CsArrowExpressionClause ========

type CsArrowExpressionClause* = ref object of CsObject #TODO(type:CsArrowExpressionClause)

proc newCs*(t: typedesc[CsArrowExpressionClause]; name: string): CsArrowExpressionClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsArrowExpressionClause)

proc extract*(t: typedesc[CsArrowExpressionClause]; info: Info): CsArrowExpressionClause = discard #TODO(extract:CsArrowExpressionClause)

proc add*(parent: var CsArrowExpressionClause; item: Dummy) =
  discard # TODO(add:CsArrowExpressionClause)
  # item.parentId = parent.id
# proc add*(parent: var CsArrowExpressionClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsArrowExpressionClause): string = discard #TODO(gen:CsArrowExpressionClause)

# ============= CsAssignmentExpression ========

type CsAssignmentExpression* = ref object of CsObject #TODO(type:CsAssignmentExpression)

proc newCs*(t: typedesc[CsAssignmentExpression]; name: string): CsAssignmentExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAssignmentExpression)

proc extract*(t: typedesc[CsAssignmentExpression]; info: Info): CsAssignmentExpression = discard #TODO(extract:CsAssignmentExpression)

proc add*(parent: var CsAssignmentExpression; item: Dummy) =
  discard # TODO(add:CsAssignmentExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsAssignmentExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAssignmentExpression): string = discard #TODO(gen:CsAssignmentExpression)

# ============= CsAttributeArgumentList ========

type CsAttributeArgumentList* = ref object of CsObject #TODO(type:CsAttributeArgumentList)

proc newCs*(t: typedesc[CsAttributeArgumentList]; name: string): CsAttributeArgumentList =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAttributeArgumentList)

proc extract*(t: typedesc[CsAttributeArgumentList]; info: Info): CsAttributeArgumentList = discard #TODO(extract:CsAttributeArgumentList)

proc add*(parent: var CsAttributeArgumentList; item: Dummy) =
  discard # TODO(add:CsAttributeArgumentList)
  # item.parentId = parent.id
# proc add*(parent: var CsAttributeArgumentList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAttributeArgumentList): string = discard #TODO(gen:CsAttributeArgumentList)

# ============= CsAttributeArgument ========

type CsAttributeArgument* = ref object of CsObject #TODO(type:CsAttributeArgument)

proc newCs*(t: typedesc[CsAttributeArgument]; name: string): CsAttributeArgument =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAttributeArgument)

proc extract*(t: typedesc[CsAttributeArgument]; info: Info): CsAttributeArgument = discard #TODO(extract:CsAttributeArgument)

proc add*(parent: var CsAttributeArgument; item: Dummy) =
  discard # TODO(add:CsAttributeArgument)
  # item.parentId = parent.id
# proc add*(parent: var CsAttributeArgument; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAttributeArgument): string = discard #TODO(gen:CsAttributeArgument)

type CsAttributeList* = ref object of CsObject #TODO(type:CsAttributeList)

proc newCs*(t: typedesc[CsAttributeList]; name: string): CsAttributeList =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAttributeList)

proc extract*(t: typedesc[CsAttributeList]; info: Info): CsAttributeList = discard #TODO(extract:CsAttributeList)

proc add*(parent: var CsAttributeList; item: Dummy) =
  discard # TODO(add:CsAttributeList)
  # item.parentId = parent.id

# proc add*(parent: var CsAttributeList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc gen*(c: var CsAttributeList): string = discard #TODO(gen:CsAttributeList)

# ============= CsAttribute ========

type CsAttribute* = ref object of CsObject #TODO(type:CsAttribute)

proc newCs*(t: typedesc[CsAttribute]; name: string): CsAttribute =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAttribute)

proc extract*(t: typedesc[CsAttribute]; info: Info): CsAttribute = discard #TODO(extract:CsAttribute)

proc add*(parent: var CsAttribute; item: Dummy) =
  discard # TODO(add:CsAttribute)
  # item.parentId = parent.id
# proc add*(parent: var CsAttribute; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAttribute): string = discard #TODO(gen:CsAttribute)

# ============= CsAttributeTargetSpecifier ========

type CsAttributeTargetSpecifier* = ref object of CsObject #TODO(type:CsAttributeTargetSpecifier)

proc newCs*(t: typedesc[CsAttributeTargetSpecifier]; name: string): CsAttributeTargetSpecifier =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAttributeTargetSpecifier)

proc extract*(t: typedesc[CsAttributeTargetSpecifier]; info: Info): CsAttributeTargetSpecifier = discard #TODO(extract:CsAttributeTargetSpecifier)

proc add*(parent: var CsAttributeTargetSpecifier; item: Dummy) =
  discard # TODO(add:CsAttributeTargetSpecifier)
  # item.parentId = parent.id
# proc add*(parent: var CsAttributeTargetSpecifier; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAttributeTargetSpecifier): string = discard #TODO(gen:CsAttributeTargetSpecifier)

# ============= CsAwaitExpression ========

type CsAwaitExpression* = ref object of CsObject #TODO(type:CsAwaitExpression)

proc newCs*(t: typedesc[CsAwaitExpression]; name: string): CsAwaitExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAwaitExpression)

proc extract*(t: typedesc[CsAwaitExpression]; info: Info): CsAwaitExpression = discard #TODO(extract:CsAwaitExpression)

proc add*(parent: var CsAwaitExpression; item: Dummy) =
  discard # TODO(add:CsAwaitExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsAwaitExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAwaitExpression): string = discard #TODO(gen:CsAwaitExpression)

# ============= CsBaseExpression ========

type CsBaseExpression* = ref object of CsObject #TODO(type:CsBaseExpression)

proc newCs*(t: typedesc[CsBaseExpression]; name: string): CsBaseExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsBaseExpression)

proc extract*(t: typedesc[CsBaseExpression]; info: Info): CsBaseExpression = discard #TODO(extract:CsBaseExpression)

proc add*(parent: var CsBaseExpression; item: Dummy) =
  discard # TODO(add:CsBaseExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsBaseExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsBaseExpression): string = discard #TODO(gen:CsBaseExpression)

# ============= CsBaseList ========

type CsBaseList* = ref object of CsObject #TODO(type:CsBaseList)

proc newCs*(t: typedesc[CsBaseList]; name: string): CsBaseList =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsBaseList)

proc extract*(t: typedesc[CsBaseList]; info: Info): CsBaseList = discard #TODO(extract:CsBaseList)

proc add*(parent: var CsBaseList; item: Dummy) =
  discard # TODO(add:CsBaseList)
  # item.parentId = parent.id
# proc add*(parent: var CsBaseList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsBaseList): string = discard #TODO(gen:CsBaseList)

# ============= CsBinaryExpression ========

type CsBinaryExpression* = ref object of CsObject #TODO(type:CsBinaryExpression)

proc newCs*(t: typedesc[CsBinaryExpression]; name: string): CsBinaryExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsBinaryExpression)

proc extract*(t: typedesc[CsBinaryExpression]; info: Info): CsBinaryExpression = discard #TODO(extract:CsBinaryExpression)

proc add*(parent: var CsBinaryExpression; item: Dummy) =
  discard # TODO(add:CsBinaryExpression)
# proc add*(parent: var CsBinaryExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
  # item.parentId = parent.id

proc gen*(c: var CsBinaryExpression): string = discard #TODO(gen:CsBinaryExpression)

# ============= CsBracketedArgumentList ========

type CsBracketedArgumentList* = ref object of CsObject #TODO(type:CsBracketedArgumentList)

proc newCs*(t: typedesc[CsBracketedArgumentList]; name: string): CsBracketedArgumentList =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsBracketedArgumentList)

proc extract*(t: typedesc[CsBracketedArgumentList]; info: Info): CsBracketedArgumentList = discard #TODO(extract:CsBracketedArgumentList)

proc add*(parent: var CsBracketedArgumentList; item: Dummy) =
  discard # TODO(add:CsBracketedArgumentList)
  # item.parentId = parent.id
# proc add*(parent: var CsBracketedArgumentList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsBracketedArgumentList): string = discard #TODO(gen:CsBracketedArgumentList)

# ============= CsBracketedParameterList ========

type CsBracketedParameterList* = ref object of CsObject #TODO(type:CsBracketedParameterList)

proc newCs*(t: typedesc[CsBracketedParameterList]; name: string): CsBracketedParameterList =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsBracketedParameterList)

proc extract*(t: typedesc[CsBracketedParameterList]; info: Info): CsBracketedParameterList = discard #TODO(extract:CsBracketedParameterList)

proc add*(parent: var CsBracketedParameterList; item: Dummy) =
  discard # TODO(add:CsBracketedParameterList)
  # item.parentId = parent.id
# proc add*(parent: var CsBracketedParameterList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsBracketedParameterList): string = discard #TODO(gen:CsBracketedParameterList)

# ============= CsBreakStatement ========

type CsBreakStatement* = ref object of CsObject #TODO(type:CsBreakStatement)

proc newCs*(t: typedesc[CsBreakStatement]; name: string): CsBreakStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsBreakStatement)

proc extract*(t: typedesc[CsBreakStatement]; info: Info): CsBreakStatement = discard #TODO(extract:CsBreakStatement)

proc add*(parent: var CsBreakStatement; item: Dummy) =
  discard # TODO(add:CsBreakStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsBreakStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsBreakStatement): string = discard #TODO(gen:CsBreakStatement)

# ============= CsCasePatternSwitchLabel ========

type CsCasePatternSwitchLabel* = ref object of CsObject #TODO(type:CsCasePatternSwitchLabel)

proc newCs*(t: typedesc[CsCasePatternSwitchLabel]; name: string): CsCasePatternSwitchLabel =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsCasePatternSwitchLabel)

proc extract*(t: typedesc[CsCasePatternSwitchLabel]; info: Info): CsCasePatternSwitchLabel = discard #TODO(extract:CsCasePatternSwitchLabel)

proc add*(parent: var CsCasePatternSwitchLabel; item: Dummy) =
  discard # TODO(add:CsCasePatternSwitchLabel)
  # item.parentId = parent.id
# proc add*(parent: var CsCasePatternSwitchLabel; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCasePatternSwitchLabel): string = discard #TODO(gen:CsCasePatternSwitchLabel)

# ============= CsCaseSwitchLabel ========

type CsCaseSwitchLabel* = ref object of CsObject #TODO(type:CsCaseSwitchLabel)

proc newCs*(t: typedesc[CsCaseSwitchLabel]; name: string): CsCaseSwitchLabel =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsCaseSwitchLabel)

proc extract*(t: typedesc[CsCaseSwitchLabel]; info: Info): CsCaseSwitchLabel = discard #TODO(extract:CsCaseSwitchLabel)

proc add*(parent: var CsCaseSwitchLabel; item: Dummy) =
  discard # TODO(add:CsCaseSwitchLabel)
  # item.parentId = parent.id
# proc add*(parent: var CsCaseSwitchLabel; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCaseSwitchLabel): string = discard #TODO(gen:CsCaseSwitchLabel)

# ============= CsCastExpression ========

type CsCastExpression* = ref object of CsObject #TODO(type:CsCastExpression)

proc newCs*(t: typedesc[CsCastExpression]; name: string): CsCastExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsCastExpression)

proc extract*(t: typedesc[CsCastExpression]; info: Info): CsCastExpression = discard #TODO(extract:CsCastExpression)

proc add*(parent: var CsCastExpression; item: Dummy) =
  discard # TODO(add:CsCastExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsCastExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCastExpression): string = discard #TODO(gen:CsCastExpression)

# ============= CsCatchClause ========

type CsCatchClause* = ref object of CsObject #TODO(type:CsCatchClause)

proc newCs*(t: typedesc[CsCatchClause]; name: string): CsCatchClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsCatchClause)

proc extract*(t: typedesc[CsCatchClause]; info: Info): CsCatchClause = discard #TODO(extract:CsCatchClause)

proc add*(parent: var CsCatchClause; item: Dummy) =
  discard # TODO(add:CsCatchClause)
  # item.parentId = parent.id
# proc add*(parent: var CsCatchClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCatchClause): string = discard #TODO(gen:CsCatchClause)

# ============= CsCatchFilterClause ========

type CsCatchFilterClause* = ref object of CsObject #TODO(type:CsCatchFilterClause)

proc newCs*(t: typedesc[CsCatchFilterClause]; name: string): CsCatchFilterClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsCatchFilterClause)

proc extract*(t: typedesc[CsCatchFilterClause]; info: Info): CsCatchFilterClause = discard #TODO(extract:CsCatchFilterClause)

proc add*(parent: var CsCatchFilterClause; item: Dummy) =
  discard # TODO(add:CsCatchFilterClause)
  # item.parentId = parent.id
# proc add*(parent: var CsCatchFilterClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCatchFilterClause): string = discard #TODO(gen:CsCatchFilterClause)

# ============= CsCatch ========

type CsCatch* = ref object of CsObject #TODO(type:CsCatch)

proc newCs*(t: typedesc[CsCatch]; name: string): CsCatch =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsCatch)

proc extract*(t: typedesc[CsCatch]; info: Info): CsCatch = discard #TODO(extract:CsCatch)

proc add*(parent: var CsCatch; item: Dummy) =
  discard # TODO(add:CsCatch)
  # item.parentId = parent.id
# proc add*(parent: var CsCatch; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCatch): string = discard #TODO(gen:CsCatch)

# ============= CsCheckedExpression ========

type CsCheckedExpression* = ref object of CsObject #TODO(type:CsCheckedExpression)

proc newCs*(t: typedesc[CsCheckedExpression]; name: string): CsCheckedExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsCheckedExpression)

proc extract*(t: typedesc[CsCheckedExpression]; info: Info): CsCheckedExpression = discard #TODO(extract:CsCheckedExpression)

proc add*(parent: var CsCheckedExpression; item: Dummy) =
  discard # TODO(add:CsCheckedExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsCheckedExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCheckedExpression): string = discard #TODO(gen:CsCheckedExpression)

# ============= CsCheckedStatement ========

type CsCheckedStatement* = ref object of CsObject #TODO(type:CsCheckedStatement)

proc newCs*(t: typedesc[CsCheckedStatement]; name: string): CsCheckedStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsCheckedStatement)

proc extract*(t: typedesc[CsCheckedStatement]; info: Info): CsCheckedStatement = discard #TODO(extract:CsCheckedStatement)

proc add*(parent: var CsCheckedStatement; item: Dummy) =
  discard # TODO(add:CsCheckedStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsCheckedStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCheckedStatement): string = discard #TODO(gen:CsCheckedStatement)





type ClassParts* {.pure.} = enum
  Fields, Methods, Ctors, Enums, Properties, Indexer


type CsProperty* = ref object of CsObject
  retType*: string
  hasGet*: bool
  hasSet*: bool
  parentClass*: string
  bodySet*: string # dunno.
  bodyGet*: string # NOTE: don't know yet what type to put here. maybe something like a method body or a list of expr ?


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
  body*: seq[BodyExpr]            # use here inheritance and methods (runtime dispatch).
                                  # seq[Expr] expressions, and each should know how to generate their line. ref objects, and methods.
type CsConstructor* = ref object of CsObject
  parentClass*: string
  parameterList*: CsParameterList # seq[CsParameter]
  body*: seq[BodyExpr]


type CsEnumMember* = ref object of CsObject
  value*: string #Option[int]

type CsEnum* = ref object of CsObject
  items*: seq[CsEnumMember]

type CsIndexer* = ref object of CsObject
  retType*: string
  varName*: string
  varType*: string
  firstVarType*: string
  hasGet*: bool
  hasSet*: bool
  # name*: string  # no, there is no name, but there is an AccessorList, or Accessor, that provide the function body.

# ============= CsClass ========

type CsClass* = ref object of CsObject
  nsParent*: string
  extends*: string
  implements*: seq[string]
  fields*: seq[CsField]
  properties*: seq[CsProperty]
  methods*: seq[CsMethod]
  ctors*: seq[CsConstructor]
  enums*: seq[CsEnum]
  enumTable*: TableRef[string, CsEnum]
  lastAddedTo*: Option[ClassParts]
  isStatic*: bool
  indexer*: CsIndexer
  # hasIndexer*: bool

proc hasIndexer*(c: CsClass): bool = not c.indexer.isNil

proc newCs*(t: typedesc[CsClass]; name: string; base = ""; impls: seq[string] = @[]): CsClass =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.name = name
  result.extends = base
  result.implements = impls

proc extract*(t: typedesc[CsClass]; info: Info): CsClass =
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


proc newCs*(t: typedesc[CsParameter]; a, b: string): CsParameter =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.name = a
  result.ptype = b

proc addSelfParam(m: var CsMethod) =
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
    else: m.body.mapIt(it.gen()).join("\r\n  ")

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
  let x = c.firstVarType.rsplit(".", 1)[^1]
  echo x
  if c.hasGet:
    result &= "proc `[]`*(this: var " & x & "; " & c.varName & ": " & c.varType & "): " & c.retType & " = discard"
  if c.hasSet:
    result &= "\nproc `[]=`*(this: var " & x & "; " & c.varName & ": " & c.varType & "; value: " & c.retType & ") = discard"

proc gen*(c: CsProperty): string =
  result = "method " & c.name[0].toLowerAscii & c.name[1..^1] & "*(this: " & c.parentClass & "): " & c.retType & " = " &
  "this.u_" & c.name

proc gen*(c: CsClass): string =
  echo "generating class:" & c.name
  if c.isNil: result = "" else: result &= "type " & c.name & "* = ref object"
  if c.extends != "": result &= " of " & c.extends
  result &= "\r\n\r\n"
  for f in c.fields:
    result &= "\t" & f.gen() & "\r\n"
  echo "methods count: " & $c.methods.len
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
    result &= p.gen()

proc add*(parent: var CsClass; m: CsConstructor) =
  parent.ctors.add m
  parent.lastAddedTo = some(Ctors)
  m.parentClass = parent.name

proc add*(parent: var CsClass; m: CsMethod) =
  parent.methods.add m
  parent.lastAddedTo = some(Methods)
  m.parentClass = parent.name

proc add*(parent: var CsClass; item: CsProperty) =
  item.parentId = parent.id
  parent.properties.add item
  parent.lastAddedTo = some(Properties)
  item.parentClass = parent.name
# proc add*(parent: var CsClass; item: CsProperty; data: AllNeededData) = parent.add(item) # TODO

proc add*(parent: var CsClass; item: CsIndexer) =
  item.parentId = parent.id
  parent.indexer = item
  parent.lastAddedTo = some(Indexer)
  # item.parentName = parent.name

# proc add*(parent: var CsClass; item: CsIndexer; data: AllNeededData) = parent.add(item) # TODO

# ============= CsClassOrStructConstraint ========

type CsClassOrStructConstraint* = ref object of CsObject #TODO(type:CsClassOrStructConstraint)

proc newCs*(t: typedesc[CsClassOrStructConstraint]; name: string): CsClassOrStructConstraint =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsClassOrStructConstraint)

proc extract*(t: typedesc[CsClassOrStructConstraint]; info: Info): CsClassOrStructConstraint = discard #TODO(extract:CsClassOrStructConstraint)

proc add*(parent: var CsClassOrStructConstraint; item: Dummy) =
  discard # TODO(add:CsClassOrStructConstraint)
  # item.parentId = parent.id
# proc add*(parent: var CsClassOrStructConstraint; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsClassOrStructConstraint): string = discard #TODO(gen:CsClassOrStructConstraint)

# ============= CsConditionalAccessExpression ========

type CsConditionalAccessExpression* = ref object of CsObject #TODO(type:CsConditionalAccessExpression)

proc newCs*(t: typedesc[CsConditionalAccessExpression]; name: string): CsConditionalAccessExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsConditionalAccessExpression)

proc extract*(t: typedesc[CsConditionalAccessExpression]; info: Info): CsConditionalAccessExpression = discard #TODO(extract:CsConditionalAccessExpression)

proc add*(parent: var CsConditionalAccessExpression; item: Dummy) =
  discard # TODO(add:CsConditionalAccessExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsConditionalAccessExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsConditionalAccessExpression): string = discard #TODO(gen:CsConditionalAccessExpression)

# ============= CsConditionalExpression ========

type CsConditionalExpression* = ref object of CsObject #TODO(type:CsConditionalExpression)

proc newCs*(t: typedesc[CsConditionalExpression]; name: string): CsConditionalExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsConditionalExpression)

proc extract*(t: typedesc[CsConditionalExpression]; info: Info): CsConditionalExpression = discard #TODO(extract:CsConditionalExpression)

proc add*(parent: var CsConditionalExpression; item: Dummy) =
  discard # TODO(add:CsConditionalExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsConditionalExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsConditionalExpression): string = discard #TODO(gen:CsConditionalExpression)

# ============= CsConstantPattern ========

type CsConstantPattern* = ref object of CsObject #TODO(type:CsConstantPattern)

proc newCs*(t: typedesc[CsConstantPattern]; name: string): CsConstantPattern =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsConstantPattern)

proc extract*(t: typedesc[CsConstantPattern]; info: Info): CsConstantPattern = discard #TODO(extract:CsConstantPattern)

proc add*(parent: var CsConstantPattern; item: Dummy) =
  discard # TODO(add:CsConstantPattern)
  # item.parentId = parent.id
# proc add*(parent: var CsConstantPattern; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsConstantPattern): string = discard #TODO(gen:CsConstantPattern)

# ============= CsConstructorConstraint ========

type CsConstructorConstraint* = ref object of CsObject #TODO(type:CsConstructorConstraint)

proc newCs*(t: typedesc[CsConstructorConstraint]; name: string): CsConstructorConstraint =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsConstructorConstraint)

proc extract*(t: typedesc[CsConstructorConstraint]; info: Info): CsConstructorConstraint = discard #TODO(extract:CsConstructorConstraint)

proc add*(parent: var CsConstructorConstraint; item: Dummy) =
  discard # TODO(add:CsConstructorConstraint)
  # item.parentId = parent.id
# proc add*(parent: var CsConstructorConstraint; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsConstructorConstraint): string = discard #TODO(gen:CsConstructorConstraint)

# ============= CsConstructorInitializer ========

type CsConstructorInitializer* = ref object of CsObject #TODO(type:CsConstructorInitializer)

proc newCs*(t: typedesc[CsConstructorInitializer]; name: string): CsConstructorInitializer =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsConstructorInitializer)

proc extract*(t: typedesc[CsConstructorInitializer]; info: Info): CsConstructorInitializer = discard #TODO(extract:CsConstructorInitializer)

proc add*(parent: var CsConstructorInitializer; item: Dummy) =
  discard # TODO(add:CsConstructorInitializer)
  # item.parentId = parent.id
# proc add*(parent: var CsConstructorInitializer; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsConstructorInitializer): string = discard #TODO(gen:CsConstructorInitializer)



# ============= CsConstructor ========



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




# ============= CsContinueStatement ========

type CsContinueStatement* = ref object of CsObject #TODO(type:CsContinueStatement)

proc newCs*(t: typedesc[CsContinueStatement]; name: string): CsContinueStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsContinueStatement)

proc extract*(t: typedesc[CsContinueStatement]; info: Info): CsContinueStatement = discard #TODO(extract:CsContinueStatement)

proc add*(parent: var CsContinueStatement; item: Dummy) =
  discard # TODO(add:CsContinueStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsContinueStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsContinueStatement): string = discard #TODO(gen:CsContinueStatement)

# ============= CsConversionOperator ========

type CsConversionOperator* = ref object of CsObject #TODO(type:CsConversionOperator)

proc newCs*(t: typedesc[CsConversionOperator]; name: string): CsConversionOperator =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsConversionOperator)

proc extract*(t: typedesc[CsConversionOperator]; info: Info): CsConversionOperator = discard #TODO(extract:CsConversionOperator)

proc add*(parent: var CsConversionOperator; item: Dummy) =
  discard # TODO(add:CsConversionOperator)
  # item.parentId = parent.id
# proc add*(parent: var CsConversionOperator; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsConversionOperator): string = discard #TODO(gen:CsConversionOperator)

# ============= CsDeclarationExpression ========

type CsDeclarationExpression* = ref object of CsObject #TODO(type:CsDeclarationExpression)

proc newCs*(t: typedesc[CsDeclarationExpression]; name: string): CsDeclarationExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsDeclarationExpression)

proc extract*(t: typedesc[CsDeclarationExpression]; info: Info): CsDeclarationExpression = discard #TODO(extract:CsDeclarationExpression)

proc add*(parent: var CsDeclarationExpression; item: Dummy) =
  discard # TODO(add:CsDeclarationExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsDeclarationExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDeclarationExpression): string = discard #TODO(gen:CsDeclarationExpression)

# ============= CsDeclarationPattern ========

type CsDeclarationPattern* = ref object of CsObject #TODO(type:CsDeclarationPattern)

proc newCs*(t: typedesc[CsDeclarationPattern]; name: string): CsDeclarationPattern =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsDeclarationPattern)

proc extract*(t: typedesc[CsDeclarationPattern]; info: Info): CsDeclarationPattern = discard #TODO(extract:CsDeclarationPattern)

proc add*(parent: var CsDeclarationPattern; item: Dummy) =
  discard # TODO(add:CsDeclarationPattern)
  # item.parentId = parent.id
# proc add*(parent: var CsDeclarationPattern; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDeclarationPattern): string = discard #TODO(gen:CsDeclarationPattern)

# ============= CsDefaultExpression ========

type CsDefaultExpression* = ref object of CsObject #TODO(type:CsDefaultExpression)

proc newCs*(t: typedesc[CsDefaultExpression]; name: string): CsDefaultExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsDefaultExpression)

proc extract*(t: typedesc[CsDefaultExpression]; info: Info): CsDefaultExpression = discard #TODO(extract:CsDefaultExpression)

proc add*(parent: var CsDefaultExpression; item: Dummy) =
  discard # TODO(add:CsDefaultExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsDefaultExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDefaultExpression): string = discard #TODO(gen:CsDefaultExpression)

# ============= CsDefaultSwitchLabel ========

type CsDefaultSwitchLabel* = ref object of CsObject #TODO(type:CsDefaultSwitchLabel)

proc newCs*(t: typedesc[CsDefaultSwitchLabel]; name: string): CsDefaultSwitchLabel =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsDefaultSwitchLabel)

proc extract*(t: typedesc[CsDefaultSwitchLabel]; info: Info): CsDefaultSwitchLabel = discard #TODO(extract:CsDefaultSwitchLabel)

proc add*(parent: var CsDefaultSwitchLabel; item: Dummy) =
  discard # TODO(add:CsDefaultSwitchLabel)
  # item.parentId = parent.id
# proc add*(parent: var CsDefaultSwitchLabel; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDefaultSwitchLabel): string = discard #TODO(gen:CsDefaultSwitchLabel)

# ============= CsDelegate ========

type CsDelegate* = ref object of CsObject #TODO(type:CsDelegate)

proc newCs*(t: typedesc[CsDelegate]; name: string): CsDelegate =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsDelegate)

proc extract*(t: typedesc[CsDelegate]; info: Info): CsDelegate = discard #TODO(extract:CsDelegate)

proc add*(parent: var CsDelegate; item: Dummy) =
  discard # TODO(add:CsDelegate)
  # item.parentId = parent.id
# proc add*(parent: var CsDelegate; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDelegate): string = discard #TODO(gen:CsDelegate)

# ============= CsDestructor ========

type CsDestructor* = ref object of CsObject #TODO(type:CsDestructor)

proc newCs*(t: typedesc[CsDestructor]; name: string): CsDestructor =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsDestructor)

proc extract*(t: typedesc[CsDestructor]; info: Info): CsDestructor = discard #TODO(extract:CsDestructor)

proc add*(parent: var CsDestructor; item: Dummy) =
  discard # TODO(add:CsDestructor)
  # item.parentId = parent.id
# proc add*(parent: var CsDestructor; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDestructor): string = discard #TODO(gen:CsDestructor)

# ============= CsDiscardDesignation ========

type CsDiscardDesignation* = ref object of CsObject #TODO(type:CsDiscardDesignation)

proc newCs*(t: typedesc[CsDiscardDesignation]; name: string): CsDiscardDesignation =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsDiscardDesignation)

proc extract*(t: typedesc[CsDiscardDesignation]; info: Info): CsDiscardDesignation = discard #TODO(extract:CsDiscardDesignation)

proc add*(parent: var CsDiscardDesignation; item: Dummy) =
  discard # TODO(add:CsDiscardDesignation)
  # item.parentId = parent.id
# proc add*(parent: var CsDiscardDesignation; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDiscardDesignation): string = discard #TODO(gen:CsDiscardDesignation)

# ============= CsDoStatement ========

type CsDoStatement* = ref object of CsObject #TODO(type:CsDoStatement)

proc newCs*(t: typedesc[CsDoStatement]; name: string): CsDoStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsDoStatement)

proc extract*(t: typedesc[CsDoStatement]; info: Info): CsDoStatement = discard #TODO(extract:CsDoStatement)

proc add*(parent: var CsDoStatement; item: Dummy) =
  discard # TODO(add:CsDoStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsDoStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDoStatement): string = discard #TODO(gen:CsDoStatement)

# ============= CsElementAccessExpression ========

type CsElementAccessExpression* = ref object of CsObject #TODO(type:CsElementAccessExpression)

proc newCs*(t: typedesc[CsElementAccessExpression]; name: string): CsElementAccessExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsElementAccessExpression)

proc extract*(t: typedesc[CsElementAccessExpression]; info: Info): CsElementAccessExpression = discard #TODO(extract:CsElementAccessExpression)

proc add*(parent: var CsElementAccessExpression; item: Dummy) =
  discard # TODO(add:CsElementAccessExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsElementAccessExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsElementAccessExpression): string = discard #TODO(gen:CsElementAccessExpression)

# ============= CsElementBindingExpression ========

type CsElementBindingExpression* = ref object of CsObject #TODO(type:CsElementBindingExpression)

proc newCs*(t: typedesc[CsElementBindingExpression]; name: string): CsElementBindingExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsElementBindingExpression)

proc extract*(t: typedesc[CsElementBindingExpression]; info: Info): CsElementBindingExpression = discard #TODO(extract:CsElementBindingExpression)

proc add*(parent: var CsElementBindingExpression; item: Dummy) =
  discard # TODO(add:CsElementBindingExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsElementBindingExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsElementBindingExpression): string = discard #TODO(gen:CsElementBindingExpression)

# ============= CsElseClause ========

type CsElseClause* = ref object of CsObject #TODO(type:CsElseClause)

proc newCs*(t: typedesc[CsElseClause]; name: string): CsElseClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsElseClause)

proc extract*(t: typedesc[CsElseClause]; info: Info): CsElseClause = discard #TODO(extract:CsElseClause)

proc add*(parent: var CsElseClause; item: Dummy) =
  discard # TODO(add:CsElseClause)
  # item.parentId = parent.id
# proc add*(parent: var CsElseClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsElseClause): string = discard #TODO(gen:CsElseClause)

# ============= CsEmptyStatement ========

type CsEmptyStatement* = ref object of CsObject #TODO(type:CsEmptyStatement)

proc newCs*(t: typedesc[CsEmptyStatement]; name: string): CsEmptyStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsEmptyStatement)

proc extract*(t: typedesc[CsEmptyStatement]; info: Info): CsEmptyStatement = discard #TODO(extract:CsEmptyStatement)

proc add*(parent: var CsEmptyStatement; item: Dummy) =
  discard # TODO(add:CsEmptyStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsEmptyStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsEmptyStatement): string = discard #TODO(gen:CsEmptyStatement)

proc newCs*(t: typedesc[CsEnumMember]; name, value: auto): CsEnumMember =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.name = name
  result.value = value


proc extract*(t: typedesc[CsEnumMember]; info: Info): CsEnumMember =
  let name = info.essentials[0]
  let value =
    if info.essentials.len < 2: ""
    else:
      info.essentials[1]

  result = newCs(CsEnumMember, name, value)

proc add*(em: CsEnumMember; val: string) =
  em.value = val


proc gen*(e: CsEnumMember): string =
  result = e.name
  if e.value != "": result &= " = " & $e.value


proc newCs*(t: typedesc[CsEnum]; name: string): CsEnum =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.name = name



proc extract*(t: typedesc[CsEnum]; info: Info): CsEnum =
  assert info.essentials.len > 0
  let name = info.essentials[0]
  result = newCs(CsEnum, name)

proc add*(parent: var CsEnum; item: CsEnumMember) =
  item.parentId = parent.id
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

type CsEqualsValueClause* = ref object of CsObject #TODO(type:CsEqualsValueClause)

proc newCs*(t: typedesc[CsEqualsValueClause]; name: string): CsEqualsValueClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsEqualsValueClause)

proc extract*(t: typedesc[CsEqualsValueClause]; info: Info): CsEqualsValueClause = discard #TODO(extract:CsEqualsValueClause)

proc add*(parent: var CsEqualsValueClause; item: Dummy) =
  discard # TODO(add:CsEqualsValueClause)
  # item.parentId = parent.id
# proc add*(parent: var CsEqualsValueClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsEqualsValueClause): string = discard #TODO(gen:CsEqualsValueClause)

# ============= CsEventField ========

type CsEventField* = ref object of CsObject #TODO(type:CsEventField)

proc newCs*(t: typedesc[CsEventField]; name: string): CsEventField =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsEventField)

proc extract*(t: typedesc[CsEventField]; info: Info): CsEventField = discard #TODO(extract:CsEventField)

proc add*(parent: var CsEventField; item: Dummy) =
  discard # TODO(add:CsEventField)
  # item.parentId = parent.id
# proc add*(parent: var CsEventField; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsEventField): string = discard #TODO(gen:CsEventField)

# ============= CsEvent ========

type CsEvent* = ref object of CsObject #TODO(type:CsEvent)

proc newCs*(t: typedesc[CsEvent]; name: string): CsEvent =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsEvent)

proc extract*(t: typedesc[CsEvent]; info: Info): CsEvent = discard #TODO(extract:CsEvent)

proc add*(parent: var CsEvent; item: Dummy) =
  discard # TODO(add:CsEvent)
  # item.parentId = parent.id
# proc add*(parent: var CsEvent; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsEvent): string = discard #TODO(gen:CsEvent)

# ============= CsExplicitInterfaceSpecifier ========

type CsExplicitInterfaceSpecifier* = ref object of CsObject #TODO(type:CsExplicitInterfaceSpecifier)

proc newCs*(t: typedesc[CsExplicitInterfaceSpecifier]; name: string): CsExplicitInterfaceSpecifier =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.name = name

proc extract*(t: typedesc[CsExplicitInterfaceSpecifier]; info: Info): CsExplicitInterfaceSpecifier = #TODO(extract:CsExplicitInterfaceSpecifier)
  let name = info.essentials[0]
  result = newCs(CsExplicitInterfaceSpecifier, name)

# proc add*(parent: var CsExplicitInterfaceSpecifier; item: Dummy, data:AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsExplicitInterfaceSpecifier; item: Dummy) = discard # TODO(add:CsExplicitInterfaceSpecifier)

# proc gen*(c: var CsExplicitInterfaceSpecifier): string = discard #TODO(gen:CsExplicitInterfaceSpecifier)


type CsInvocationExpression* = ref object of BodyExpr
  callName*: string


# A method body's line.
type CsExpressionStatement* = ref object of BodyExpr
  call*: CsInvocationExpression
  args*: CsArgumentList

proc newCs*(t: typedesc[CsExpressionStatement]): CsExpressionStatement =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.ttype = "CsExpressionStatement"
  result.typ = $typeof(t)
  result.id = genUUID().some

proc extract*(t: typedesc[CsExpressionStatement]; info: Info): CsExpressionStatement =
  result = newCs(CsExpressionStatement)

proc add*(parent: var CsExpressionStatement; item: CsArgumentList) =
  item.parentId = parent.id
  parent.args = item
# proc add*(parent: var CsExpressionStatement; item: CsArgumentList; data: AllNeededData) = parent.add(item) # TODO

proc add*(parent: var CsExpressionStatement; item: CsInvocationExpression) =
  item.parentId = parent.id
  parent.call = item
# proc add*(parent: var CsExpressionStatement; item: CsInvocationExpression; data: AllNeededData) = parent.add(item) # TODO


method gen*(c: CsExpressionStatement): string =
  result = c.call.gen() & "("
  if c.args.args.len > 0:
    result &= c.args.gen()
  result &= ")"


# ============= CsExternAliasDirective ========

type CsExternAliasDirective* = ref object of CsObject #TODO(type:CsExternAliasDirective)

proc newCs*(t: typedesc[CsExternAliasDirective]; name: string): CsExternAliasDirective =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsExternAliasDirective)

proc extract*(t: typedesc[CsExternAliasDirective]; info: Info): CsExternAliasDirective = discard #TODO(extract:CsExternAliasDirective)

proc add*(parent: var CsExternAliasDirective; item: Dummy) =
  discard # TODO(add:CsExternAliasDirective)
  # item.parentId = parent.id
# proc add*(parent: var CsExternAliasDirective; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsExternAliasDirective): string = discard #TODO(gen:CsExternAliasDirective)
# hmm, it's actually called a property.



# ============= CsFinallyClause ========

type CsFinallyClause* = ref object of CsObject #TODO(type:CsFinallyClause)

proc newCs*(t: typedesc[CsFinallyClause]; name: string): CsFinallyClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsFinallyClause)

proc extract*(t: typedesc[CsFinallyClause]; info: Info): CsFinallyClause = discard #TODO(extract:CsFinallyClause)

proc add*(parent: var CsFinallyClause; item: Dummy) =
  discard # TODO(add:CsFinallyClause)
  # item.parentId = parent.id
# proc add*(parent: var CsFinallyClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsFinallyClause): string = discard #TODO(gen:CsFinallyClause)

# ============= CsFixedStatement ========

type CsFixedStatement* = ref object of CsObject #TODO(type:CsFixedStatement)

proc newCs*(t: typedesc[CsFixedStatement]; name: string): CsFixedStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsFixedStatement)

proc extract*(t: typedesc[CsFixedStatement]; info: Info): CsFixedStatement = discard #TODO(extract:CsFixedStatement)

proc add*(parent: var CsFixedStatement; item: Dummy) =
  discard # TODO(add:CsFixedStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsFixedStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsFixedStatement): string = discard #TODO(gen:CsFixedStatement)

# ============= CsForEachStatement ========

type CsForEachStatement* = ref object of CsObject #TODO(type:CsForEachStatement)

proc newCs*(t: typedesc[CsForEachStatement]; name: string): CsForEachStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsForEachStatement)

proc extract*(t: typedesc[CsForEachStatement]; info: Info): CsForEachStatement = discard #TODO(extract:CsForEachStatement)

proc add*(parent: var CsForEachStatement; item: Dummy) =
  discard # TODO(add:CsForEachStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsForEachStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsForEachStatement): string = discard #TODO(gen:CsForEachStatement)

# ============= CsForEachVariableStatement ========

type CsForEachVariableStatement* = ref object of CsObject #TODO(type:CsForEachVariableStatement)

proc newCs*(t: typedesc[CsForEachVariableStatement]; name: string): CsForEachVariableStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsForEachVariableStatement)

proc extract*(t: typedesc[CsForEachVariableStatement]; info: Info): CsForEachVariableStatement = discard #TODO(extract:CsForEachVariableStatement)

proc add*(parent: var CsForEachVariableStatement; item: Dummy) =
  discard # TODO(add:CsForEachVariableStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsForEachVariableStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsForEachVariableStatement): string = discard #TODO(gen:CsForEachVariableStatement)

# ============= CsForStatement ========

type CsForStatement* = ref object of CsObject #TODO(type:CsForStatement)

proc newCs*(t: typedesc[CsForStatement]; name: string): CsForStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsForStatement)

proc extract*(t: typedesc[CsForStatement]; info: Info): CsForStatement = discard #TODO(extract:CsForStatement)

proc add*(parent: var CsForStatement; item: Dummy) =
  discard # TODO(add:CsForStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsForStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsForStatement): string = discard #TODO(gen:CsForStatement)

# ============= CsFromClause ========

type CsFromClause* = ref object of CsObject #TODO(type:CsFromClause)

proc newCs*(t: typedesc[CsFromClause]; name: string): CsFromClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsFromClause)

proc extract*(t: typedesc[CsFromClause]; info: Info): CsFromClause = discard #TODO(extract:CsFromClause)

proc add*(parent: var CsFromClause; item: Dummy) =
  discard # TODO(add:CsFromClause)
  # item.parentId = parent.id
# proc add*(parent: var CsFromClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsFromClause): string = discard #TODO(gen:CsFromClause)

# ============= CsGenericName ========

type CsGenericName* = ref object of CsObject #TODO(type:CsGenericName)

proc newCs*(t: typedesc[CsGenericName]; name: string): CsGenericName =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsGenericName)

proc extract*(t: typedesc[CsGenericName]; info: Info): CsGenericName = discard #TODO(extract:CsGenericName)

proc add*(parent: var CsGenericName; item: Dummy) =
  discard # TODO(add:CsGenericName)
  # item.parentId = parent.id
# proc add*(parent: var CsGenericName; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsGenericName): string = discard #TODO(gen:CsGenericName)

# ============= CsGlobalStatement ========

type CsGlobalStatement* = ref object of CsObject #TODO(type:CsGlobalStatement)

proc newCs*(t: typedesc[CsGlobalStatement]; name: string): CsGlobalStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsGlobalStatement)

proc extract*(t: typedesc[CsGlobalStatement]; info: Info): CsGlobalStatement = discard #TODO(extract:CsGlobalStatement)

proc add*(parent: var CsGlobalStatement; item: Dummy) =
  discard # TODO(add:CsGlobalStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsGlobalStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsGlobalStatement): string = discard #TODO(gen:CsGlobalStatement)

# ============= CsGotoStatement ========

type CsGotoStatement* = ref object of CsObject #TODO(type:CsGotoStatement)

proc newCs*(t: typedesc[CsGotoStatement]; name: string): CsGotoStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsGotoStatement)

proc extract*(t: typedesc[CsGotoStatement]; info: Info): CsGotoStatement = discard #TODO(extract:CsGotoStatement)

proc add*(parent: var CsGotoStatement; item: Dummy) =
  discard # TODO(add:CsGotoStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsGotoStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsGotoStatement): string = discard #TODO(gen:CsGotoStatement)

# ============= CsGroupClause ========

type CsGroupClause* = ref object of CsObject #TODO(type:CsGroupClause)

proc newCs*(t: typedesc[CsGroupClause]; name: string): CsGroupClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsGroupClause)

proc extract*(t: typedesc[CsGroupClause]; info: Info): CsGroupClause = discard #TODO(extract:CsGroupClause)

proc add*(parent: var CsGroupClause; item: Dummy) =
  discard # TODO(add:CsGroupClause)
  # item.parentId = parent.id
# proc add*(parent: var CsGroupClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsGroupClause): string = discard #TODO(gen:CsGroupClause)

# ============= CsIfStatement ========

type CsIfStatement* = ref object of CsObject #TODO(type:CsIfStatement)

proc newCs*(t: typedesc[CsIfStatement]; name: string): CsIfStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsIfStatement)

proc extract*(t: typedesc[CsIfStatement]; info: Info): CsIfStatement = discard #TODO(extract:CsIfStatement)

proc add*(parent: var CsIfStatement; item: Dummy) =
  discard # TODO(add:CsIfStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsIfStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsIfStatement): string = discard #TODO(gen:CsIfStatement)

# ============= CsImplicitArrayCreationExpression ========

type CsImplicitArrayCreationExpression* = ref object of CsObject #TODO(type:CsImplicitArrayCreationExpression)

proc newCs*(t: typedesc[CsImplicitArrayCreationExpression]; name: string): CsImplicitArrayCreationExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsImplicitArrayCreationExpression)

proc extract*(t: typedesc[CsImplicitArrayCreationExpression]; info: Info): CsImplicitArrayCreationExpression = discard #TODO(extract:CsImplicitArrayCreationExpression)

proc add*(parent: var CsImplicitArrayCreationExpression; item: Dummy) =
  discard # TODO(add:CsImplicitArrayCreationExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsImplicitArrayCreationExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsImplicitArrayCreationExpression): string = discard #TODO(gen:CsImplicitArrayCreationExpression)

# ============= CsImplicitElementAccess ========

type CsImplicitElementAccess* = ref object of CsObject #TODO(type:CsImplicitElementAccess)

proc newCs*(t: typedesc[CsImplicitElementAccess]; name: string): CsImplicitElementAccess =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsImplicitElementAccess)

proc extract*(t: typedesc[CsImplicitElementAccess]; info: Info): CsImplicitElementAccess = discard #TODO(extract:CsImplicitElementAccess)

proc add*(parent: var CsImplicitElementAccess; item: Dummy) =
  discard # TODO(add:CsImplicitElementAccess)
  # item.parentId = parent.id
# proc add*(parent: var CsImplicitElementAccess; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsImplicitElementAccess): string = discard #TODO(gen:CsImplicitElementAccess)

# ============= CsIncompleteMember ========

type CsIncompleteMember* = ref object of CsObject #TODO(type:CsIncompleteMember)

proc newCs*(t: typedesc[CsIncompleteMember]; name: string): CsIncompleteMember =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsIncompleteMember)

proc extract*(t: typedesc[CsIncompleteMember]; info: Info): CsIncompleteMember = discard #TODO(extract:CsIncompleteMember)

proc add*(parent: var CsIncompleteMember; item: Dummy) =
  discard # TODO(add:CsIncompleteMember)
  # item.parentId = parent.id
# proc add*(parent: var CsIncompleteMember; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsIncompleteMember): string = discard #TODO(gen:CsIncompleteMember)


# ============= CsIndexer ========

proc newCs*(t: typedesc[CsIndexer]): CsIndexer =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.hasGet = true
  result.hasSet = true

proc extract*(t: typedesc[CsIndexer]; info: Info): CsIndexer =
  result = newCs(CsIndexer)

proc add*(parent: var CsIndexer; item: CsParameter) =
  item.parentId = parent.id
  parent.varName = item.name
  parent.varType = item.ptype
# proc add*(parent: var CsIndexer; item: CsParameter; data: AllNeededData) = parent.add(item) # TODO
type CsPredefinedType* = ref object of CsObject

proc add*(parent: var CsIndexer; item: CsPredefinedType) =
  item.parentId = parent.id
  parent.retType = item.name
# proc add*(parent: var CsIndexer; item: CsPredefinedType; data: AllNeededData) = parent.add(item) # TODO

proc add*(parent: var CsIndexer; item: CsExplicitInterfaceSpecifier) =
  item.parentId = parent.id
  parent.firstVarType = item.name
# proc add*(parent: var CsIndexer; item: CsExplicitInterfaceSpecifier; data: AllNeededData) = parent.add(item) # TODO



# ============= CsInitializerExpression ========

type CsInitializerExpression* = ref object of CsObject #TODO(type:CsInitializerExpression)

proc newCs*(t: typedesc[CsInitializerExpression]; name: string): CsInitializerExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsInitializerExpression)

proc extract*(t: typedesc[CsInitializerExpression]; info: Info): CsInitializerExpression = discard #TODO(extract:CsInitializerExpression)

proc add*(parent: var CsInitializerExpression; item: Dummy) =
  discard # TODO(add:CsInitializerExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsInitializerExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsInitializerExpression): string = discard #TODO(gen:CsInitializerExpression)

# ============= CsInterface ========

type CsInterface* = ref object of CsObject #TODO(type:CsInterface)
proc newCs*(t: typedesc[CsInterface]; name: string): CsInterface =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsInterface)

proc extract*(t: typedesc[CsInterface]; info: Info): CsInterface = discard #TODO(extract:CsInterface)


proc add*(parent: var CsInterface; item: CsProperty) =
  discard # TODO(add:CsInterface)
  # item.parentId = parent.id
# proc add*(parent: var CsInterface; item: CsProperty; data: AllNeededData) = parent.add(item) # TODO



proc gen*(c: var CsInterface): string = discard #TODO(gen:CsInterface)

# ============= CsInterpolatedStringExpression ========

type CsInterpolatedStringExpression* = ref object of CsObject #TODO(type:CsInterpolatedStringExpression)

proc newCs*(t: typedesc[CsInterpolatedStringExpression]; name: string): CsInterpolatedStringExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsInterpolatedStringExpression)

proc extract*(t: typedesc[CsInterpolatedStringExpression]; info: Info): CsInterpolatedStringExpression = discard #TODO(extract:CsInterpolatedStringExpression)

proc add*(parent: var CsInterpolatedStringExpression; item: Dummy) =
  discard # TODO(add:CsInterpolatedStringExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsInterpolatedStringExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsInterpolatedStringExpression): string = discard #TODO(gen:CsInterpolatedStringExpression)

# ============= CsInterpolatedStringText ========

type CsInterpolatedStringText* = ref object of CsObject #TODO(type:CsInterpolatedStringText)

proc newCs*(t: typedesc[CsInterpolatedStringText]; name: string): CsInterpolatedStringText =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsInterpolatedStringText)

proc extract*(t: typedesc[CsInterpolatedStringText]; info: Info): CsInterpolatedStringText = discard #TODO(extract:CsInterpolatedStringText)

proc add*(parent: var CsInterpolatedStringText; item: Dummy) =
  discard # TODO(add:CsInterpolatedStringText)
  # item.parentId = parent.id
# proc add*(parent: var CsInterpolatedStringText; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsInterpolatedStringText): string = discard #TODO(gen:CsInterpolatedStringText)

# ============= CsInterpolationAlignmentClause ========

type CsInterpolationAlignmentClause* = ref object of CsObject #TODO(type:CsInterpolationAlignmentClause)

proc newCs*(t: typedesc[CsInterpolationAlignmentClause]; name: string): CsInterpolationAlignmentClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsInterpolationAlignmentClause)

proc extract*(t: typedesc[CsInterpolationAlignmentClause]; info: Info): CsInterpolationAlignmentClause = discard #TODO(extract:CsInterpolationAlignmentClause)

proc add*(parent: var CsInterpolationAlignmentClause; item: Dummy) =
  discard # TODO(add:CsInterpolationAlignmentClause)
  # item.parentId = parent.id
# proc add*(parent: var CsInterpolationAlignmentClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsInterpolationAlignmentClause): string = discard #TODO(gen:CsInterpolationAlignmentClause)

# ============= CsInterpolationFormatClause ========

type CsInterpolationFormatClause* = ref object of CsObject #TODO(type:CsInterpolationFormatClause)

proc newCs*(t: typedesc[CsInterpolationFormatClause]; name: string): CsInterpolationFormatClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsInterpolationFormatClause)

proc extract*(t: typedesc[CsInterpolationFormatClause]; info: Info): CsInterpolationFormatClause = discard #TODO(extract:CsInterpolationFormatClause)

proc add*(parent: var CsInterpolationFormatClause; item: Dummy) =
  discard # TODO(add:CsInterpolationFormatClause)
  # item.parentId = parent.id
# proc add*(parent: var CsInterpolationFormatClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsInterpolationFormatClause): string = discard #TODO(gen:CsInterpolationFormatClause)

# ============= CsInterpolation ========

type CsInterpolation* = ref object of CsObject #TODO(type:CsInterpolation)

proc newCs*(t: typedesc[CsInterpolation]; name: string): CsInterpolation =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsInterpolation)

proc extract*(t: typedesc[CsInterpolation]; info: Info): CsInterpolation = discard #TODO(extract:CsInterpolation)

proc add*(parent: var CsInterpolation; item: Dummy) =
  discard # TODO(add:CsInterpolation)
  # item.parentId = parent.id
# proc add*(parent: var CsInterpolation; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsInterpolation): string = discard #TODO(gen:CsInterpolation)

# ============= CsInvocationExpression ========

proc newCs*(t: typedesc[CsInvocationExpression]; name: string): CsInvocationExpression =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.callName = name

proc extract*(t: typedesc[CsInvocationExpression]; info: Info): CsInvocationExpression =
  let name = info.essentials[0]
  result = newCs(CsInvocationExpression, name)



func normalizeCallNameIfStatic(s: string): string =
  result = s.rsplit(".", 1)[^1] # last part is the function name that was called.
  if result.len == 1:
    result = result.toLowerAscii
  else:
    result = result[0].toLowerAscii & result[1..^1]

#
# XXX continue here after adding Ids to everyone, it'd help solve this problem and also avoid all the passing, since we can "quickfetch" the vars.
#
# proc isInStatic(c: var CsInvocationExpression): bool =
#   var root = cs_root.currentRoot
#   var expr: BodyExpr = root.fetch(c.parentId.get).expect(vkBodyExpr).BodyExpr
#   let m: CsMethod = root.fetch(expr.parentId.get).expect(vkMethod).CsMethod
#   if m.isStatic: return true
#   else:
#     let c: CsClass = root.fetch(m.parentId.get).expect(vkClass).CsClass
#     if c.isStatic: return true
#   result = false

# method gen*(c: var CsInvocationExpression): string =
#   result = if c.callName.contains(".") and c.isInStatic:
#     normalizeCallNameIfStatic(c.callName)
#   else: c.callName


  #[
  let exprStmt = root.exprsTable[c.parentId] # method or class... how do we do this? uuid to the rescue.
  let assumingMethod = root.allMethodsTable[exprStmt.parentId]
  if assumingMethod.isStatic or assumingMethod.parentClass().isStatic: discard
    # ......  so everyone gets a unique id, and that's how we call back to parent

  # refactor to proc isInStatic(for each type that needs it)

  # for handling c# static calls, we don't need the static class it was defined in.

    ]#

  # ============= CsIsPatternExpression ========

type CsIsPatternExpression* = ref object of CsObject #TODO(type:CsIsPatternExpression)

proc newCs*(t: typedesc[CsIsPatternExpression]; name: string): CsIsPatternExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsIsPatternExpression)

proc extract*(t: typedesc[CsIsPatternExpression]; info: Info): CsIsPatternExpression = discard #TODO(extract:CsIsPatternExpression)

proc add*(parent: var CsIsPatternExpression; item: Dummy) =
  discard # TODO(add:CsIsPatternExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsIsPatternExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsIsPatternExpression): string = discard #TODO(gen:CsIsPatternExpression)

# ============= CsJoinClause ========

type CsJoinClause* = ref object of CsObject #TODO(type:CsJoinClause)

proc newCs*(t: typedesc[CsJoinClause]; name: string): CsJoinClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsJoinClause)

proc extract*(t: typedesc[CsJoinClause]; info: Info): CsJoinClause = discard #TODO(extract:CsJoinClause)

proc add*(parent: var CsJoinClause; item: Dummy) =
  discard # TODO(add:CsJoinClause)
  # item.parentId = parent.id
# proc add*(parent: var CsJoinClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsJoinClause): string = discard #TODO(gen:CsJoinClause)

# ============= CsJoinIntoClause ========

type CsJoinIntoClause* = ref object of CsObject #TODO(type:CsJoinIntoClause)

proc newCs*(t: typedesc[CsJoinIntoClause]; name: string): CsJoinIntoClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsJoinIntoClause)

proc extract*(t: typedesc[CsJoinIntoClause]; info: Info): CsJoinIntoClause = discard #TODO(extract:CsJoinIntoClause)

proc add*(parent: var CsJoinIntoClause; item: Dummy) =
  discard # TODO(add:CsJoinIntoClause)
  # item.parentId = parent.id
# proc add*(parent: var CsJoinIntoClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsJoinIntoClause): string = discard #TODO(gen:CsJoinIntoClause)

# ============= CsLabeledStatement ========

type CsLabeledStatement* = ref object of CsObject #TODO(type:CsLabeledStatement)

proc newCs*(t: typedesc[CsLabeledStatement]; name: string): CsLabeledStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsLabeledStatement)

proc extract*(t: typedesc[CsLabeledStatement]; info: Info): CsLabeledStatement = discard #TODO(extract:CsLabeledStatement)

proc add*(parent: var CsLabeledStatement; item: Dummy) =
  discard # TODO(add:CsLabeledStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsLabeledStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsLabeledStatement): string = discard #TODO(gen:CsLabeledStatement)

# ============= CsLetClause ========

type CsLetClause* = ref object of CsObject #TODO(type:CsLetClause)

proc newCs*(t: typedesc[CsLetClause]; name: string): CsLetClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsLetClause)

proc extract*(t: typedesc[CsLetClause]; info: Info): CsLetClause = discard #TODO(extract:CsLetClause)

proc add*(parent: var CsLetClause; item: Dummy) =
  discard # TODO(add:CsLetClause)
  # item.parentId = parent.id
# proc add*(parent: var CsLetClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsLetClause): string = discard #TODO(gen:CsLetClause)

# ============= CsLiteralExpression ========

type CsLiteralExpression* = ref object of BodyExpr
  value*: string

proc newCs(t: typedesc[CsLiteralExpression]; val: string): CsLiteralExpression =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.ttype = "CsLiteralExpression"
  result.value = val

proc extract*(_: typedesc[CsLiteralExpression]; info: Info): CsLiteralExpression =
  let strVal = info.essentials[0]
  result = newCs(CsLiteralExpression, strVal)

method gen*(lit: CsLiteralExpression): string =
  lit.value

# ============= CsLocalDeclarationStatement ========

type CsLocalDeclarationStatement* = ref object of BodyExpr

proc newCs*(t: typedesc[CsLocalDeclarationStatement]; name: string): CsLocalDeclarationStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID().some

proc extract*(t: typedesc[CsLocalDeclarationStatement]; info: Info): CsLocalDeclarationStatement = discard #TODO(extract:CsLocalDeclarationStatement)

proc add*(parent: var CsLocalDeclarationStatement; item: Dummy) =
  discard # TODO(add:CsLocalDeclarationStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsLocalDeclarationStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsLocalDeclarationStatement): string = discard #TODO(gen:CsLocalDeclarationStatement)

# ============= CsLocalFunctionStatement ========

type CsLocalFunctionStatement* = ref object of CsObject #TODO(type:CsLocalFunctionStatement)

proc newCs*(t: typedesc[CsLocalFunctionStatement]; name: string): CsLocalFunctionStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsLocalFunctionStatement)

proc extract*(t: typedesc[CsLocalFunctionStatement]; info: Info): CsLocalFunctionStatement = discard #TODO(extract:CsLocalFunctionStatement)

proc add*(parent: var CsLocalFunctionStatement; item: Dummy) =
  discard # TODO(add:CsLocalFunctionStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsLocalFunctionStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsLocalFunctionStatement): string = discard #TODO(gen:CsLocalFunctionStatement)

# ============= CsLockStatement ========

type CsLockStatement* = ref object of CsObject #TODO(type:CsLockStatement)

proc newCs*(t: typedesc[CsLockStatement]; name: string): CsLockStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsLockStatement)

proc extract*(t: typedesc[CsLockStatement]; info: Info): CsLockStatement = discard #TODO(extract:CsLockStatement)

proc add*(parent: var CsLockStatement; item: Dummy) =
  discard # TODO(add:CsLockStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsLockStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsLockStatement): string = discard #TODO(gen:CsLockStatement)

# ============= CsMakeRefExpression ========

type CsMakeRefExpression* = ref object of CsObject #TODO(type:CsMakeRefExpression)

proc newCs*(t: typedesc[CsMakeRefExpression]; name: string): CsMakeRefExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsMakeRefExpression)

proc extract*(t: typedesc[CsMakeRefExpression]; info: Info): CsMakeRefExpression = discard #TODO(extract:CsMakeRefExpression)

proc add*(parent: var CsMakeRefExpression; item: Dummy) =
  discard # TODO(add:CsMakeRefExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsMakeRefExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsMakeRefExpression): string = discard #TODO(gen:CsMakeRefExpression)

# ============= CsMemberBindingExpression ========

type CsMemberBindingExpression* = ref object of CsObject #TODO(type:CsMemberBindingExpression)

proc newCs*(t: typedesc[CsMemberBindingExpression]; name: string): CsMemberBindingExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsMemberBindingExpression)

proc extract*(t: typedesc[CsMemberBindingExpression]; info: Info): CsMemberBindingExpression = discard #TODO(extract:CsMemberBindingExpression)

proc add*(parent: var CsMemberBindingExpression; item: Dummy) =
  discard # TODO(add:CsMemberBindingExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsMemberBindingExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsMemberBindingExpression): string = discard #TODO(gen:CsMemberBindingExpression)




proc newCs*(t: typedesc[CsMethod]; name: string): CsMethod =
  new result
  result.typ = $typeof(t)
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

type CsObjectCreationExpression* = ref object of BodyExpr
  # args*: CsParameterList
  args*: CsArgumentList

proc add*(parent: var CsMethod; item: CsObjectCreationExpression) =
  item.parentId = parent.id
  parent.body.add item
# proc add*(parent: var CsMethod; item: CsObjectCreationExpression; data: AllNeededData) = parent.add(item) # TODO


type CsReturnStatement* = ref object of BodyExpr # type:CsReturnStatement
  expr*: BodyExpr                                # can have one expr that can be nil

proc add*(parent: var CsMethod; item: CsReturnStatement) =
  item.parentId = parent.id
  parent.body.add item
# proc add*(parent: var CsMethod; item: CsReturnStatement; data: AllNeededData) = parent.add(item) # TODO



# ============= CsNameColon ========

type CsNameColon* = ref object of CsObject #TODO(type:CsNameColon)

proc newCs*(t: typedesc[CsNameColon]; name: string): CsNameColon =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsNameColon)

proc extract*(t: typedesc[CsNameColon]; info: Info): CsNameColon = discard #TODO(extract:CsNameColon)

proc add*(parent: var CsNameColon; item: Dummy) =
  discard # TODO(add:CsNameColon)
  # item.parentId = parent.id
# proc add*(parent: var CsNameColon; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsNameColon): string = discard #TODO(gen:CsNameColon)

# ============= CsNameEquals ========

type CsNameEquals* = ref object of CsObject #TODO(type:CsNameEquals)

proc newCs*(t: typedesc[CsNameEquals]; name: string): CsNameEquals =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsNameEquals)

proc extract*(t: typedesc[CsNameEquals]; info: Info): CsNameEquals = discard #TODO(extract:CsNameEquals)

proc add*(parent: var CsNameEquals; item: Dummy) =
  discard # TODO(add:CsNameEquals)
  # item.parentId = parent.id
# proc add*(parent: var CsNameEquals; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsNameEquals): string = discard #TODO(gen:CsNameEquals)



type NamespaceParts* {.pure.} = enum
  Interfaces, Enums, Classes

type Child = object
  name: string
  case kind: NamespaceParts
  of NamespaceParts.Classes:
    npCls: CsClass
  of NamespaceParts.Interfaces:
    npIface: CsInterface
  of NamespaceParts.Enums:
    npEnum: CsEnum
type CsUsingDirective* = ref object of CsObject


type CsNamespace* = ref object of CsObject
  parent*: string
  classes*: seq[CsClass]
  classTable*: TableRef[string, CsClass]
  enums*: seq[CsEnum]
  enumTable*: TableRef[string, CsEnum]
  interfaces*: seq[CsInterface]
  interfaceTable*: TableRef[string, CsInterface]
  lastAddedTo*: Option[NamespaceParts] # TODO: !!! we actually want here an object variant, so we can simply ask for the object.
  lastAdded: Child
  imports*: seq[CsUsingDirective]

import sequtils, strutils
proc `$`*(n: CsNamespace): string =
  result = "name:" & n.name
  result &= "\nparent" & n.parent
  result &= "\nclasses:" & n.classes.mapIt(it.name).join(" ")
  result &= "\nenums:" & n.enums.mapIt(it.name).join(" ")

proc newCs*(t: typedesc[CsNamespace]; name: string): CsNamespace =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.name = name
  result.classes = @[]
  result.classTable = newTable[string, CsClass]()
  result.enums = @[]
  result.enumTable = newTable[string, CsEnum]()
  result.interfaces = @[]
  result.interfaceTable = newTable[string, CsInterface]()
type AllNeededData* = object
  sourceCode: string
  constructDeclName: string
  currentNamespace: CsNamespace
  isNsEmpty: bool
  nsLastAdded: NamespaceParts
  lastEnum: CsEnum
  lastEnumMember: CsEnumMember
  classLastAdded: ClassParts
  lastClass: CsClass
  lastMethod: CsMethod
  lastProp: CsProperty
  lastCtor: CsConstructor
  inBlock: Block
  prevBlock: Block

proc extract*(t: typedesc[CsNamespace]; info: Info; data: AllNeededData): CsNamespace =
  extract(t, info)
proc extract*(t: typedesc[CsNamespace]; info: Info; ): CsNamespace =
  result = newCs(t, info.essentials[0])

proc add*(parent: var CsNamespace; item: CsEnum) =
  item.parentId = parent.id
  parent.enums.add item
  parent.enumTable[item.name] = item
  parent.lastAddedTo = some(NamespaceParts.Enums)
  parent.lastAdded = Child(kind: NamespaceParts.Enums, npEnum: item)
# proc add*(parent: var CsNamespace; item: CsEnum; data: AllNeededData) = parent.add(item) # TODO

proc add*(ns: var CsNamespace; class: CsClass) =
  ns.classes.add(class)
  ns.classTable[class.name] = class
  ns.lastAddedTo = some(NamespaceParts.Classes)

proc add*(ns: var CsNamespace; use: CsUsingDirective) =
  ns.imports.add use

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
  result.id = uuids.genUUID #TODO(create:CsNullableType)

proc extract*(t: typedesc[CsNullableType]; info: Info): CsNullableType = discard #TODO(extract:CsNullableType)

proc add*(parent: var CsNullableType; item: Dummy) =
  discard # TODO(add:CsNullableType)
  # item.parentId = parent.id
# proc add*(parent: var CsNullableType; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsNullableType): string = discard #TODO(gen:CsNullableType)

# ============= CsObjectCreationExpression ========

proc newCs*(t: typedesc[CsObjectCreationExpression]; name: string): CsObjectCreationExpression =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.name = name
  result.ttype = "CsObjectCreationExpression"

proc extract*(t: typedesc[CsObjectCreationExpression]; info: Info): CsObjectCreationExpression =
  let newClassName = info.essentials[0]
  result = newCs(CsObjectCreationExpression, newClassName)


proc add*(parent: var CsObjectCreationExpression; item: CsArgumentList) =
  item.parentId = parent.id
  parent.args = item

# proc add*(parent: var CsObjectCreationExpression; item: CsArgumentList; data: AllNeededData) = parent.add(item) # TODO
# proc add*(parent: var CsObjectCreationExpression; item: CsParameterList, data:AllNeededData) = parent.add(item) # TODO

# proc add*(parent: var CsObjectCreationExpression; item: CsParameterList) = discard

method gen*(c: var CsObjectCreationExpression): string = discard #TODO(gen:CsObjectCreationExpression)

# ============= CsOmittedArraySizeExpression ========

type CsOmittedArraySizeExpression* = ref object of CsObject #TODO(type:CsOmittedArraySizeExpression)

proc newCs*(t: typedesc[CsOmittedArraySizeExpression]; name: string): CsOmittedArraySizeExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsOmittedArraySizeExpression)

proc extract*(t: typedesc[CsOmittedArraySizeExpression]; info: Info): CsOmittedArraySizeExpression = discard #TODO(extract:CsOmittedArraySizeExpression)

proc add*(parent: var CsOmittedArraySizeExpression; item: Dummy) =
  discard # TODO(add:CsOmittedArraySizeExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsOmittedArraySizeExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsOmittedArraySizeExpression): string = discard #TODO(gen:CsOmittedArraySizeExpression)

# ============= CsOmittedTypeArgument ========

type CsOmittedTypeArgument* = ref object of CsObject #TODO(type:CsOmittedTypeArgument)

proc newCs*(t: typedesc[CsOmittedTypeArgument]; name: string): CsOmittedTypeArgument =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsOmittedTypeArgument)

proc extract*(t: typedesc[CsOmittedTypeArgument]; info: Info): CsOmittedTypeArgument = discard #TODO(extract:CsOmittedTypeArgument)

proc add*(parent: var CsOmittedTypeArgument; item: Dummy) =
  discard # TODO(add:CsOmittedTypeArgument)
  # item.parentId = parent.id
# proc add*(parent: var CsOmittedTypeArgument; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsOmittedTypeArgument): string = discard #TODO(gen:CsOmittedTypeArgument)

# ============= CsOperator ========

type CsOperator* = ref object of CsObject #TODO(type:CsOperator)

proc newCs*(t: typedesc[CsOperator]; name: string): CsOperator =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsOperator)

proc extract*(t: typedesc[CsOperator]; info: Info): CsOperator = discard #TODO(extract:CsOperator)

proc add*(parent: var CsOperator; item: Dummy) =
  discard # TODO(add:CsOperator)
  # item.parentId = parent.id
# proc add*(parent: var CsOperator; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsOperator): string = discard #TODO(gen:CsOperator)

# ============= CsOrderByClause ========

type CsOrderByClause* = ref object of CsObject #TODO(type:CsOrderByClause)

proc newCs*(t: typedesc[CsOrderByClause]; name: string): CsOrderByClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsOrderByClause)

proc extract*(t: typedesc[CsOrderByClause]; info: Info): CsOrderByClause = discard #TODO(extract:CsOrderByClause)

proc add*(parent: var CsOrderByClause; item: Dummy) =
  discard # TODO(add:CsOrderByClause)
  # item.parentId = parent.id
# proc add*(parent: var CsOrderByClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsOrderByClause): string = discard #TODO(gen:CsOrderByClause)

# ============= CsOrdering ========

type CsOrdering* = ref object of CsObject #TODO(type:CsOrdering)

proc newCs*(t: typedesc[CsOrdering]; name: string): CsOrdering =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsOrdering)

proc extract*(t: typedesc[CsOrdering]; info: Info): CsOrdering = discard #TODO(extract:CsOrdering)

proc add*(parent: var CsOrdering; item: Dummy) =
  discard # TODO(add:CsOrdering)
  # item.parentId = parent.id
# proc add*(parent: var CsOrdering; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsOrdering): string = discard #TODO(gen:CsOrdering)

# ============ CsParameterList =================

proc newCs*(t: typedesc[CsParameterList]): CsParameterList =
  new result # start empty.
  result.typ = $typeof(t)
  result.id = uuids.genUUID().some

proc extract*(t: typedesc[CsParameterList]; info: Info): CsParameterList =
  result = newCs(CsParameterList)

proc add*(parent: var CsParameterList; item: CsParameter) =
  item.parentId = parent.id
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
  result.id = uuids.genUUID #TODO(create:CsParenthesizedExpression)

proc extract*(t: typedesc[CsParenthesizedExpression]; info: Info): CsParenthesizedExpression = discard #TODO(extract:CsParenthesizedExpression)

proc add*(parent: var CsParenthesizedExpression; item: Dummy) =
  discard # TODO(add:CsParenthesizedExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsParenthesizedExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsParenthesizedExpression): string = discard #TODO(gen:CsParenthesizedExpression)

# ============= CsParenthesizedLambdaExpression ========

type CsParenthesizedLambdaExpression* = ref object of CsObject #TODO(type:CsParenthesizedLambdaExpression)

proc newCs*(t: typedesc[CsParenthesizedLambdaExpression]; name: string): CsParenthesizedLambdaExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsParenthesizedLambdaExpression)

proc extract*(t: typedesc[CsParenthesizedLambdaExpression]; info: Info): CsParenthesizedLambdaExpression = discard #TODO(extract:CsParenthesizedLambdaExpression)

proc add*(parent: var CsParenthesizedLambdaExpression; item: Dummy) =
  discard # TODO(add:CsParenthesizedLambdaExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsParenthesizedLambdaExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsParenthesizedLambdaExpression): string = discard #TODO(gen:CsParenthesizedLambdaExpression)

# ============= CsParenthesizedVariableDesignation ========

type CsParenthesizedVariableDesignation* = ref object of CsObject #TODO(type:CsParenthesizedVariableDesignation)

proc newCs*(t: typedesc[CsParenthesizedVariableDesignation]; name: string): CsParenthesizedVariableDesignation =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsParenthesizedVariableDesignation)

proc extract*(t: typedesc[CsParenthesizedVariableDesignation]; info: Info): CsParenthesizedVariableDesignation = discard #TODO(extract:CsParenthesizedVariableDesignation)

proc add*(parent: var CsParenthesizedVariableDesignation; item: Dummy) =
  discard # TODO(add:CsParenthesizedVariableDesignation)
  # item.parentId = parent.id
# proc add*(parent: var CsParenthesizedVariableDesignation; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsParenthesizedVariableDesignation): string = discard #TODO(gen:CsParenthesizedVariableDesignation)

# ============= CsPointerType ========

type CsPointerType* = ref object of CsObject #TODO(type:CsPointerType)

proc newCs*(t: typedesc[CsPointerType]; name: string): CsPointerType =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsPointerType)

proc extract*(t: typedesc[CsPointerType]; info: Info): CsPointerType = discard #TODO(extract:CsPointerType)

proc add*(parent: var CsPointerType; item: Dummy) =
  discard # TODO(add:CsPointerType)
  # item.parentId = parent.id
# proc add*(parent: var CsPointerType; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsPointerType): string = discard #TODO(gen:CsPointerType)

# ============= CsPostfixUnaryExpression ========

type CsPostfixUnaryExpression* = ref object of CsObject #TODO(type:CsPostfixUnaryExpression)

proc newCs*(t: typedesc[CsPostfixUnaryExpression]; name: string): CsPostfixUnaryExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsPostfixUnaryExpression)

proc extract*(t: typedesc[CsPostfixUnaryExpression]; info: Info): CsPostfixUnaryExpression = discard #TODO(extract:CsPostfixUnaryExpression)

proc add*(parent: var CsPostfixUnaryExpression; item: Dummy) =
  discard # TODO(add:CsPostfixUnaryExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsPostfixUnaryExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsPostfixUnaryExpression): string = discard #TODO(gen:CsPostfixUnaryExpression)

# ============= CsPredefinedType ========


proc newCs*(t: typedesc[CsPredefinedType]; name: string): CsPredefinedType =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.name = name

proc extract*(t: typedesc[CsPredefinedType]; info: Info): CsPredefinedType =
  var name: string
  if info.essentials.len > 0:
    name = info.essentials[0]
  else: name = ""
  result = newCs(CsPredefinedType, name)

proc gen*(c: var CsPredefinedType): string = discard #TODO(gen:CsPredefinedType)

# ============= CsPrefixUnaryExpression ========

type CsPrefixUnaryExpression* = ref object of CsObject #TODO(type:CsPrefixUnaryExpression)

proc newCs*(t: typedesc[CsPrefixUnaryExpression]; name: string): CsPrefixUnaryExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsPrefixUnaryExpression)

proc extract*(t: typedesc[CsPrefixUnaryExpression]; info: Info): CsPrefixUnaryExpression = discard #TODO(extract:CsPrefixUnaryExpression)

proc add*(parent: var CsPrefixUnaryExpression; item: Dummy) =
  discard # TODO(add:CsPrefixUnaryExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsPrefixUnaryExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsPrefixUnaryExpression): string = discard #TODO(gen:CsPrefixUnaryExpression)

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

# ============= CsQueryBody ========

type CsQueryBody* = ref object of CsObject #TODO(type:CsQueryBody)

proc newCs*(t: typedesc[CsQueryBody]; name: string): CsQueryBody =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsQueryBody)

proc extract*(t: typedesc[CsQueryBody]; info: Info): CsQueryBody = discard #TODO(extract:CsQueryBody)

proc add*(parent: var CsQueryBody; item: Dummy) =
  discard # TODO(add:CsQueryBody)
  # item.parentId = parent.id
# proc add*(parent: var CsQueryBody; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsQueryBody): string = discard #TODO(gen:CsQueryBody)

# ============= CsQueryContinuation ========

type CsQueryContinuation* = ref object of CsObject #TODO(type:CsQueryContinuation)

proc newCs*(t: typedesc[CsQueryContinuation]; name: string): CsQueryContinuation =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsQueryContinuation)

proc extract*(t: typedesc[CsQueryContinuation]; info: Info): CsQueryContinuation = discard #TODO(extract:CsQueryContinuation)

proc add*(parent: var CsQueryContinuation; item: Dummy) =
  discard # TODO(add:CsQueryContinuation)
  # item.parentId = parent.id
# proc add*(parent: var CsQueryContinuation; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsQueryContinuation): string = discard #TODO(gen:CsQueryContinuation)

# ============= CsQueryExpression ========

type CsQueryExpression* = ref object of CsObject #TODO(type:CsQueryExpression)

proc newCs*(t: typedesc[CsQueryExpression]; name: string): CsQueryExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsQueryExpression)

proc extract*(t: typedesc[CsQueryExpression]; info: Info): CsQueryExpression = discard #TODO(extract:CsQueryExpression)

proc add*(parent: var CsQueryExpression; item: Dummy) =
  discard # TODO(add:CsQueryExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsQueryExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsQueryExpression): string = discard #TODO(gen:CsQueryExpression)

# ============= CsRefExpression ========

type CsRefExpression* = ref object of CsObject #TODO(type:CsRefExpression)

proc newCs*(t: typedesc[CsRefExpression]; name: string): CsRefExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsRefExpression)

proc extract*(t: typedesc[CsRefExpression]; info: Info): CsRefExpression = discard #TODO(extract:CsRefExpression)

proc add*(parent: var CsRefExpression; item: Dummy) =
  discard # TODO(add:CsRefExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsRefExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsRefExpression): string = discard #TODO(gen:CsRefExpression)

# ============= CsRefTypeExpression ========

type CsRefTypeExpression* = ref object of CsObject #TODO(type:CsRefTypeExpression)

proc newCs*(t: typedesc[CsRefTypeExpression]; name: string): CsRefTypeExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsRefTypeExpression)

proc extract*(t: typedesc[CsRefTypeExpression]; info: Info): CsRefTypeExpression = discard #TODO(extract:CsRefTypeExpression)

proc add*(parent: var CsRefTypeExpression; item: Dummy) =
  discard # TODO(add:CsRefTypeExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsRefTypeExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsRefTypeExpression): string = discard #TODO(gen:CsRefTypeExpression)

# ============= CsRefType ========

type CsRefType* = ref object of CsObject #TODO(type:CsRefType)

proc newCs*(t: typedesc[CsRefType]; name: string): CsRefType =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsRefType)

proc extract*(t: typedesc[CsRefType]; info: Info): CsRefType = discard #TODO(extract:CsRefType)

proc add*(parent: var CsRefType; item: Dummy) =
  discard # TODO(add:CsRefType)
  # item.parentId = parent.id
# proc add*(parent: var CsRefType; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsRefType): string = discard #TODO(gen:CsRefType)

# ============= CsRefValueExpression ========

type CsRefValueExpression* = ref object of CsObject #TODO(type:CsRefValueExpression)

proc newCs*(t: typedesc[CsRefValueExpression]; name: string): CsRefValueExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsRefValueExpression)

proc extract*(t: typedesc[CsRefValueExpression]; info: Info): CsRefValueExpression = discard #TODO(extract:CsRefValueExpression)

proc add*(parent: var CsRefValueExpression; item: Dummy) =
  discard # TODO(add:CsRefValueExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsRefValueExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsRefValueExpression): string = discard #TODO(gen:CsRefValueExpression)

# ============= CsReturnStatement ========

proc newCs*(t: typedesc[CsReturnStatement]): CsReturnStatement =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.ttype = "CsReturnStatement"

proc extract*(t: typedesc[CsReturnStatement]; info: Info): CsReturnStatement =
  result = newCs(CsReturnStatement)
  let expectedFollowupAsString = if info.essentials.len > 0: info.essentials[0] else: ""
  echo "From C# side -- expected to follow after return: " & expectedFollowupAsString


proc add*(parent: var CsReturnStatement; item: BodyExpr) = discard # (add:CsReturnStatement)
# proc add*(parent: var CsReturnStatement; item: BodyExpr; data: AllNeededData) = parent.add(item) # TODO

method gen*(c: CsReturnStatement): string =
  result = if c.expr.isNil: "return"
  else: "return " & c.expr.gen()


# ============= CsSelectClause ========

type CsSelectClause* = ref object of CsObject #TODO(type:CsSelectClause)

proc newCs*(t: typedesc[CsSelectClause]; name: string): CsSelectClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsSelectClause)

proc extract*(t: typedesc[CsSelectClause]; info: Info): CsSelectClause = discard #TODO(extract:CsSelectClause)

proc add*(parent: var CsSelectClause; item: Dummy) =
  discard # TODO(add:CsSelectClause)
  # item.parentId = parent.id
# proc add*(parent: var CsSelectClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsSelectClause): string = discard #TODO(gen:CsSelectClause)

type CsSimpleBaseType* = ref object of CsObject #TODO(type:CsSimpleBaseType)

proc newCs*(t: typedesc[CsSimpleBaseType]; name: string): CsSimpleBaseType =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsSimpleBaseType)

proc extract*(t: typedesc[CsSimpleBaseType]; info: Info): CsSimpleBaseType = discard #TODO(extract:CsSimpleBaseType)

proc add*(parent: var CsSimpleBaseType; item: Dummy) =
  discard # TODO(add:CsSimpleBaseType)
  # item.parentId = parent.id
# proc add*(parent: var CsSimpleBaseType; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsSimpleBaseType): string = discard #TODO(gen:CsSimpleBaseType)

# ============= CsSimpleLambdaExpression ========

type CsSimpleLambdaExpression* = ref object of CsObject #TODO(type:CsSimpleLambdaExpression)

proc newCs*(t: typedesc[CsSimpleLambdaExpression]; name: string): CsSimpleLambdaExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsSimpleLambdaExpression)

proc extract*(t: typedesc[CsSimpleLambdaExpression]; info: Info): CsSimpleLambdaExpression = discard #TODO(extract:CsSimpleLambdaExpression)

proc add*(parent: var CsSimpleLambdaExpression; item: Dummy) =
  discard # TODO(add:CsSimpleLambdaExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsSimpleLambdaExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsSimpleLambdaExpression): string = discard #TODO(gen:CsSimpleLambdaExpression)

# ============= CsSingleVariableDesignation ========

type CsSingleVariableDesignation* = ref object of CsObject #TODO(type:CsSingleVariableDesignation)

proc newCs*(t: typedesc[CsSingleVariableDesignation]; name: string): CsSingleVariableDesignation =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsSingleVariableDesignation)

proc extract*(t: typedesc[CsSingleVariableDesignation]; info: Info): CsSingleVariableDesignation = discard #TODO(extract:CsSingleVariableDesignation)

proc add*(parent: var CsSingleVariableDesignation; item: Dummy) =
  discard # TODO(add:CsSingleVariableDesignation)
  # item.parentId = parent.id
# proc add*(parent: var CsSingleVariableDesignation; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsSingleVariableDesignation): string = discard #TODO(gen:CsSingleVariableDesignation)

# ============= CsSizeOfExpression ========

type CsSizeOfExpression* = ref object of CsObject #TODO(type:CsSizeOfExpression)

proc newCs*(t: typedesc[CsSizeOfExpression]; name: string): CsSizeOfExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsSizeOfExpression)

proc extract*(t: typedesc[CsSizeOfExpression]; info: Info): CsSizeOfExpression = discard #TODO(extract:CsSizeOfExpression)

proc add*(parent: var CsSizeOfExpression; item: Dummy) =
  discard # TODO(add:CsSizeOfExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsSizeOfExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsSizeOfExpression): string = discard #TODO(gen:CsSizeOfExpression)

# ============= CsStackAllocArrayCreationExpression ========

type CsStackAllocArrayCreationExpression* = ref object of CsObject #TODO(type:CsStackAllocArrayCreationExpression)

proc newCs*(t: typedesc[CsStackAllocArrayCreationExpression]; name: string): CsStackAllocArrayCreationExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsStackAllocArrayCreationExpression)

proc extract*(t: typedesc[CsStackAllocArrayCreationExpression]; info: Info): CsStackAllocArrayCreationExpression = discard #TODO(extract:CsStackAllocArrayCreationExpression)

proc add*(parent: var CsStackAllocArrayCreationExpression; item: Dummy) =
  discard # TODO(add:CsStackAllocArrayCreationExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsStackAllocArrayCreationExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsStackAllocArrayCreationExpression): string = discard #TODO(gen:CsStackAllocArrayCreationExpression)

# ============= CsStruct ========

type CsStruct* = ref object of CsObject #TODO(type:CsStruct)

proc newCs*(t: typedesc[CsStruct]; name: string): CsStruct =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsStruct)

proc extract*(t: typedesc[CsStruct]; info: Info): CsStruct = discard #TODO(extract:CsStruct)

proc add*(parent: var CsStruct; item: Dummy) =
  discard # TODO(add:CsStruct)
  # item.parentId = parent.id
# proc add*(parent: var CsStruct; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsStruct): string = discard #TODO(gen:CsStruct)

# ============= CsSwitchSection ========

type CsSwitchSection* = ref object of CsObject #TODO(type:CsSwitchSection)

proc newCs*(t: typedesc[CsSwitchSection]; name: string): CsSwitchSection =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsSwitchSection)

proc extract*(t: typedesc[CsSwitchSection]; info: Info): CsSwitchSection = discard #TODO(extract:CsSwitchSection)

proc add*(parent: var CsSwitchSection; item: Dummy) =
  discard # TODO(add:CsSwitchSection)
  # item.parentId = parent.id
# proc add*(parent: var CsSwitchSection; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsSwitchSection): string = discard #TODO(gen:CsSwitchSection)

# ============= CsSwitchStatement ========

type CsSwitchStatement* = ref object of CsObject #TODO(type:CsSwitchStatement)

proc newCs*(t: typedesc[CsSwitchStatement]; name: string): CsSwitchStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsSwitchStatement)

proc extract*(t: typedesc[CsSwitchStatement]; info: Info): CsSwitchStatement = discard #TODO(extract:CsSwitchStatement)

proc add*(parent: var CsSwitchStatement; item: Dummy) =
  discard # TODO(add:CsSwitchStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsSwitchStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsSwitchStatement): string = discard #TODO(gen:CsSwitchStatement)

type CsThisExpression* = ref object of CsObject #TODO(type:CsThisExpression)

proc newCs*(t: typedesc[CsThisExpression]; name: string): CsThisExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsThisExpression)

proc extract*(t: typedesc[CsThisExpression]; info: Info): CsThisExpression = discard #TODO(extract:CsThisExpression)

proc add*(parent: var CsThisExpression; item: Dummy) =
  discard # TODO(add:CsThisExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsThisExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsThisExpression): string = discard #TODO(gen:CsThisExpression)

# ============= CsThrowExpression ========

type CsThrowExpression* = ref object of CsObject #TODO(type:CsThrowExpression)

proc newCs*(t: typedesc[CsThrowExpression]; name: string): CsThrowExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsThrowExpression)

proc extract*(t: typedesc[CsThrowExpression]; info: Info): CsThrowExpression = discard #TODO(extract:CsThrowExpression)

proc add*(parent: var CsThrowExpression; item: Dummy) =
  discard # TODO(add:CsThrowExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsThrowExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsThrowExpression): string = discard #TODO(gen:CsThrowExpression)

# ============= CsThrowStatement ========

type CsThrowStatement* = ref object of CsObject #TODO(type:CsThrowStatement)

proc newCs*(t: typedesc[CsThrowStatement]; name: string): CsThrowStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsThrowStatement)

proc extract*(t: typedesc[CsThrowStatement]; info: Info): CsThrowStatement = discard #TODO(extract:CsThrowStatement)

proc add*(parent: var CsThrowStatement; item: Dummy) =
  discard # TODO(add:CsThrowStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsThrowStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsThrowStatement): string = discard #TODO(gen:CsThrowStatement)

# ============= CsTryStatement ========

type CsTryStatement* = ref object of CsObject #TODO(type:CsTryStatement)

proc newCs*(t: typedesc[CsTryStatement]; name: string): CsTryStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsTryStatement)

proc extract*(t: typedesc[CsTryStatement]; info: Info): CsTryStatement = discard #TODO(extract:CsTryStatement)

proc add*(parent: var CsTryStatement; item: Dummy) =
  discard # TODO(add:CsTryStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsTryStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTryStatement): string = discard #TODO(gen:CsTryStatement)

# ============= CsTupleElement ========

type CsTupleElement* = ref object of CsObject #TODO(type:CsTupleElement)

proc newCs*(t: typedesc[CsTupleElement]; name: string): CsTupleElement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsTupleElement)

proc extract*(t: typedesc[CsTupleElement]; info: Info): CsTupleElement = discard #TODO(extract:CsTupleElement)

proc add*(parent: var CsTupleElement; item: Dummy) =
  discard # TODO(add:CsTupleElement)
  # item.parentId = parent.id
# proc add*(parent: var CsTupleElement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTupleElement): string = discard #TODO(gen:CsTupleElement)

# ============= CsTupleExpression ========

type CsTupleExpression* = ref object of CsObject #TODO(type:CsTupleExpression)

proc newCs*(t: typedesc[CsTupleExpression]; name: string): CsTupleExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsTupleExpression)

proc extract*(t: typedesc[CsTupleExpression]; info: Info): CsTupleExpression = discard #TODO(extract:CsTupleExpression)

proc add*(parent: var CsTupleExpression; item: Dummy) =
  discard # TODO(add:CsTupleExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsTupleExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTupleExpression): string = discard #TODO(gen:CsTupleExpression)

# ============= CsTupleType ========

type CsTupleType* = ref object of CsObject #TODO(type:CsTupleType)

proc newCs*(t: typedesc[CsTupleType]; name: string): CsTupleType =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsTupleType)

proc extract*(t: typedesc[CsTupleType]; info: Info): CsTupleType = discard #TODO(extract:CsTupleType)

proc add*(parent: var CsTupleType; item: Dummy) =
  discard # TODO(add:CsTupleType)
  # item.parentId = parent.id
# proc add*(parent: var CsTupleType; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTupleType): string = discard #TODO(gen:CsTupleType)

# ============= CsTypeArgumentList ========

type CsTypeArgumentList* = ref object of CsObject #TODO(type:CsTypeArgumentList)

proc newCs*(t: typedesc[CsTypeArgumentList]; name: string): CsTypeArgumentList =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsTypeArgumentList)

proc extract*(t: typedesc[CsTypeArgumentList]; info: Info): CsTypeArgumentList = discard #TODO(extract:CsTypeArgumentList)

proc add*(parent: var CsTypeArgumentList; item: Dummy) =
  discard # TODO(add:CsTypeArgumentList)
  # item.parentId = parent.id
# proc add*(parent: var CsTypeArgumentList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTypeArgumentList): string = discard #TODO(gen:CsTypeArgumentList)

# ============= CsTypeConstraint ========

type CsTypeConstraint* = ref object of CsObject #TODO(type:CsTypeConstraint)

proc newCs*(t: typedesc[CsTypeConstraint]; name: string): CsTypeConstraint =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsTypeConstraint)

proc extract*(t: typedesc[CsTypeConstraint]; info: Info): CsTypeConstraint = discard #TODO(extract:CsTypeConstraint)

proc add*(parent: var CsTypeConstraint; item: Dummy) =
  discard # TODO(add:CsTypeConstraint)
  # item.parentId = parent.id
# proc add*(parent: var CsTypeConstraint; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTypeConstraint): string = discard #TODO(gen:CsTypeConstraint)

type CsTypeOfExpression* = ref object of CsObject #TODO(type:CsTypeOfExpression)

proc newCs*(t: typedesc[CsTypeOfExpression]; name: string): CsTypeOfExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsTypeOfExpression)

proc extract*(t: typedesc[CsTypeOfExpression]; info: Info): CsTypeOfExpression = discard #TODO(extract:CsTypeOfExpression)

proc add*(parent: var CsTypeOfExpression; item: Dummy) =
  discard # TODO(add:CsTypeOfExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsTypeOfExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTypeOfExpression): string = discard #TODO(gen:CsTypeOfExpression)

# ============= CsTypeParameterConstraintClause ========

type CsTypeParameterConstraintClause* = ref object of CsObject #TODO(type:CsTypeParameterConstraintClause)

proc newCs*(t: typedesc[CsTypeParameterConstraintClause]; name: string): CsTypeParameterConstraintClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsTypeParameterConstraintClause)

proc extract*(t: typedesc[CsTypeParameterConstraintClause]; info: Info): CsTypeParameterConstraintClause = discard #TODO(extract:CsTypeParameterConstraintClause)

proc add*(parent: var CsTypeParameterConstraintClause; item: Dummy) =
  discard # TODO(add:CsTypeParameterConstraintClause)
  # item.parentId = parent.id
# proc add*(parent: var CsTypeParameterConstraintClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTypeParameterConstraintClause): string = discard #TODO(gen:CsTypeParameterConstraintClause)

# ============= CsTypeParameterList ========

type CsTypeParameterList* = ref object of CsObject #TODO(type:CsTypeParameterList)

proc newCs*(t: typedesc[CsTypeParameterList]; name: string): CsTypeParameterList =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsTypeParameterList)

proc extract*(t: typedesc[CsTypeParameterList]; info: Info): CsTypeParameterList = discard #TODO(extract:CsTypeParameterList)

proc add*(parent: var CsTypeParameterList; item: Dummy) =
  discard # TODO(add:CsTypeParameterList)
  # item.parentId = parent.id
# proc add*(parent: var CsTypeParameterList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTypeParameterList): string = discard #TODO(gen:CsTypeParameterList)

# ============= CsTypeParameter ========

type CsTypeParameter* = ref object of CsObject #TODO(type:CsTypeParameter)

proc newCs*(t: typedesc[CsTypeParameter]; name: string): CsTypeParameter =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsTypeParameter)

proc extract*(t: typedesc[CsTypeParameter]; info: Info): CsTypeParameter = discard #TODO(extract:CsTypeParameter)

proc add*(parent: var CsTypeParameter; item: Dummy) =
  discard # TODO(add:CsTypeParameter)
  # item.parentId = parent.id
# proc add*(parent: var CsTypeParameter; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTypeParameter): string = discard #TODO(gen:CsTypeParameter)

# ============= CsUnsafeStatement ========

type CsUnsafeStatement* = ref object of CsObject #TODO(type:CsUnsafeStatement)

proc newCs*(t: typedesc[CsUnsafeStatement]; name: string): CsUnsafeStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsUnsafeStatement)

proc extract*(t: typedesc[CsUnsafeStatement]; info: Info): CsUnsafeStatement = discard #TODO(extract:CsUnsafeStatement)

proc add*(parent: var CsUnsafeStatement; item: Dummy) =
  discard # TODO(add:CsUnsafeStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsUnsafeStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsUnsafeStatement): string = discard #TODO(gen:CsUnsafeStatement)

# ============= CsUsingDirective ========


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

# ============= CsUsingStatement ========

type CsUsingStatement* = ref object of CsObject #TODO(type:CsUsingStatement)

proc newCs*(t: typedesc[CsUsingStatement]; name: string): CsUsingStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsUsingStatement)

proc extract*(t: typedesc[CsUsingStatement]; info: Info): CsUsingStatement = discard #TODO(extract:CsUsingStatement)

proc add*(parent: var CsUsingStatement; item: Dummy) =
  discard # TODO(add:CsUsingStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsUsingStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsUsingStatement): string = discard #TODO(gen:CsUsingStatement)

# ============= CsWhenClause ========

type CsWhenClause* = ref object of CsObject #TODO(type:CsWhenClause)

proc newCs*(t: typedesc[CsWhenClause]; name: string): CsWhenClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsWhenClause)

proc extract*(t: typedesc[CsWhenClause]; info: Info): CsWhenClause = discard #TODO(extract:CsWhenClause)

proc add*(parent: var CsWhenClause; item: Dummy) =
  discard # TODO(add:CsWhenClause)
  # item.parentId = parent.id
# proc add*(parent: var CsWhenClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsWhenClause): string = discard #TODO(gen:CsWhenClause)

# ============= CsWhereClause ========

type CsWhereClause* = ref object of CsObject #TODO(type:CsWhereClause)

proc newCs*(t: typedesc[CsWhereClause]; name: string): CsWhereClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsWhereClause)

proc extract*(t: typedesc[CsWhereClause]; info: Info): CsWhereClause = discard #TODO(extract:CsWhereClause)

proc add*(parent: var CsWhereClause; item: Dummy) =
  discard # TODO(add:CsWhereClause)
  # item.parentId = parent.id
# proc add*(parent: var CsWhereClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsWhereClause): string = discard #TODO(gen:CsWhereClause)

# ============= CsWhileStatement ========

type CsWhileStatement* = ref object of CsObject #TODO(type:CsWhileStatement)

proc newCs*(t: typedesc[CsWhileStatement]; name: string): CsWhileStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsWhileStatement)

proc extract*(t: typedesc[CsWhileStatement]; info: Info): CsWhileStatement = discard #TODO(extract:CsWhileStatement)

proc add*(parent: var CsWhileStatement; item: Dummy) =
  discard # TODO(add:CsWhileStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsWhileStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsWhileStatement): string = discard #TODO(gen:CsWhileStatement)

# ============= CsYieldStatement ========

type CsYieldStatement* = ref object of CsObject #TODO(type:CsYieldStatement)

proc newCs*(t: typedesc[CsYieldStatement]; name: string): CsYieldStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsYieldStatement)

proc extract*(t: typedesc[CsYieldStatement]; info: Info): CsYieldStatement = discard #TODO(extract:CsYieldStatement)

proc add*(parent: var CsYieldStatement; item: Dummy) =
  discard # TODO(add:CsYieldStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsYieldStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsYieldStatement): string = discard #TODO(gen:CsYieldStatement)

# ======================================================
