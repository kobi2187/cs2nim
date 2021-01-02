import ../state_utils
import nre, sequtils, strutils, sets, re, uuids, options, tables, hashes
# {.experimental: "codeReordering".}
import ../types
import justtypes

const stopEarly = false
# NOTE: for some reason I get the following warning:
#   use {.base.} for base methods; baseless methods are deprecated [UseBase]
# the other add methods don't recognize that this is their base method. (even though both parameters inherit correctly from CsObject.

# method add*(a: var ref CsObject, b: ref CsObject) {.base.} =
method add*(a: var ref CsObject, b: CsObject) {.base.} =
  raise newException(Exception, "missing implementation for " & a.typ & ", " & b.typ)

# ============= CsAccessorList ========

proc newCs*(t: typedesc[CsAccessorList]): CsAccessorList =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsAccessorList]; info: Info): CsAccessorList =
  let val =  info.essentials[0]
  result = newCs(CsAccessorList)
  if val.contains("get;"):
    result.hasDefaultGet = true
    # result.hasGetBody = false
  if val.contains("set;"):
    result.hasDefaultSet = true
    # result.hasSetBody = false
  if val.contains(nre.re"get\s*{"): echo val; result.hasGetBody = true # TODO: check against real code.
  if val.contains(nre.re"set\s*{"): echo val; result.hasSetBody = true

method add*(parent: var CsAccessorList; item: CsAccessor) =
  assert item.kind in [ "get","set"]
  if item.kind == "get":
    parent.getPart = item

  else:
    parent.setPart = item

# proc add*(parent: var CsAccessorList; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsAccessorList): string =
  assert false
  echo "--> in  gen*(c: var CsAccessorList)"

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

method add*(parent: var CsAccessor; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsAccessor; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsAccessor; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsAccessor): string =
  assert false
  echo "--> in  gen*(c: var CsAccessor)"

# ============= CsAliasQualifiedName ========

proc newCs*(t: typedesc[CsAliasQualifiedName]; name: string): CsAliasQualifiedName =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAliasQualifiedName)

proc extract*(t: typedesc[CsAliasQualifiedName]; info: Info): CsAliasQualifiedName = assert false

method add*(parent: var CsAliasQualifiedName; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsAliasQualifiedName; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsAliasQualifiedName; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsAliasQualifiedName): string =
  assert false
  echo "--> in  gen*(c: var CsAliasQualifiedName)"

# ============= CsField ========

proc newCs*(t: typedesc[CsField]): CsField =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsField]; info: Info): CsField =
  result = newCs(CsField)
  result.name = info.essentials[2]
  result.ttype = info.essentials[1]
  result.isStatic = info.essentials[0].contains("static")
  result.isPublic = info.essentials[0].contains("public") # TODO check what CsDisplay actually provides.

method add*(parent: var CsField; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsField; item: Dummy) "
  if stopEarly: assert false
# proc add*(parent: var CsField; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(f: CsField): string =

  echo "--> in  gen*(f: CsField)"
  result = f.name
  if f.ispublic: result &= "*"
  result &= ": " & f.thetype

# ============= CsAnonymousMethodExpression ========

proc newCs*(t: typedesc[CsAnonymousMethodExpression]; name: string): CsAnonymousMethodExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAnonymousMethodExpression)

proc extract*(t: typedesc[CsAnonymousMethodExpression]; info: Info): CsAnonymousMethodExpression = assert false

method add*(parent: var CsAnonymousMethodExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsAnonymousMethodExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsAnonymousMethodExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsAnonymousMethodExpression): string =
  assert false
  echo "--> in  gen*(c: var CsAnonymousMethodExpression)"

# ============= CsAnonymousObjectCreationExpression ========

proc newCs*(t: typedesc[CsAnonymousObjectCreationExpression]; name: string): CsAnonymousObjectCreationExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAnonymousObjectCreationExpression)

proc extract*(t: typedesc[CsAnonymousObjectCreationExpression]; info: Info): CsAnonymousObjectCreationExpression = assert false

method add*(parent: var CsAnonymousObjectCreationExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsAnonymousObjectCreationExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsAnonymousObjectCreationExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsAnonymousObjectCreationExpression): string =
  assert false
  echo "--> in  gen*(c: var CsAnonymousObjectCreationExpression)"

# ============= CsAnonymousObjectMemberDeclarator ========

proc newCs*(t: typedesc[CsAnonymousObjectMemberDeclarator]; name: string): CsAnonymousObjectMemberDeclarator =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsAnonymousObjectMemberDeclarator]; info: Info): CsAnonymousObjectMemberDeclarator = assert false

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsAnonymousObjectMemberDeclarator; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsAnonymousObjectMemberDeclarator; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsAnonymousObjectMemberDeclarator): string =
  assert false
  echo "--> in  gen*(c: var CsAnonymousObjectMemberDeclarator)"

# ============= CsArgumentList ========

proc newCs*(t: typedesc[CsArgumentList]; args: seq[string]): CsArgumentList =
  new result
  result.typ = $typeof(t)
  # result.args = args.mapIt(it.strip) # now handled from CsArgument

proc extract*(t: typedesc[CsArgumentList]; info: Info): CsArgumentList =
  result = newCs(CsArgumentList, info.essentials[0].split(","))

proc replacementGenericTypes (s:string): string =
  if s.contains("<") and s.contains(">"):
    result = s.replace("<","[").replace(">","]")
  else: result = s

proc gen*(c: var CsArgumentList): string =

  echo "--> in  gen*(c: var CsArgumentList)"
  if not c.isNil:
    result = c.args.join(", ").replacementGenericTypes()

# ============= CsArgument ========

proc newCs*(t: typedesc[CsArgument]): CsArgument =
  new result
  result.typ = $typeof(t)
#TODO(create:CsArgument)

proc extract*(t: typedesc[CsArgument]; info: Info): CsArgument =
  result = newCs(CsArgument)
  result.value = info.essentials[0]

# proc add*(parent: var CsArgument; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsArgument): string =
  assert false
  echo "--> in  gen*(c: var CsArgument)"

# ============= CsArrayCreationExpression ========

proc newCs*(t: typedesc[CsArrayCreationExpression]; name: string): CsArrayCreationExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsArrayCreationExpression)

proc extract*(t: typedesc[CsArrayCreationExpression]; info: Info): CsArrayCreationExpression = assert false

method add*(parent: var CsArrayCreationExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsArrayCreationExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsArrayCreationExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsArrayCreationExpression): string =
  assert false
  echo "--> in  gen*(c: var CsArrayCreationExpression)"

# ============= CsArrayRankSpecifier ========

proc newCs*(t: typedesc[CsArrayRankSpecifier]; name: string): CsArrayRankSpecifier =
  new result
  result.typ = $typeof(t)
#TODO(create:CsArrayRankSpecifier)

proc extract*(t: typedesc[CsArrayRankSpecifier]; info: Info): CsArrayRankSpecifier = assert false

method add*(parent: var CsArrayRankSpecifier; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsArrayRankSpecifier; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsArrayRankSpecifier; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsArrayRankSpecifier): string =
  assert false
  echo "--> in  gen*(c: var CsArrayRankSpecifier)"

# ============= CsArrayType ========

proc newCs*(t: typedesc[CsArrayType]; name: string): CsArrayType =
  new result
  result.typ = $typeof(t)
#TODO(create:CsArrayType)

proc extract*(t: typedesc[CsArrayType]; info: Info): CsArrayType = assert false

method add*(parent: var CsArrayType; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsArrayType; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsArrayType; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsArrayType): string =
  assert false
  echo "--> in  gen*(c: var CsArrayType)"

# ============= CsArrowExpressionClause ========

proc newCs*(t: typedesc[CsArrowExpressionClause]; name: string): CsArrowExpressionClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsArrowExpressionClause)

proc extract*(t: typedesc[CsArrowExpressionClause]; info: Info): CsArrowExpressionClause = assert false

method add*(parent: var CsArrowExpressionClause; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsArrowExpressionClause; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsArrowExpressionClause; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsArrowExpressionClause): string =
  assert false
  echo "--> in  gen*(c: var CsArrowExpressionClause)"

# ============= CsAssignmentExpression ========

# TODO MAJOR TODO: instead of everyone matching bodyexpr and stored as a seq in various body fields, figure out which ones really do, maybe 3 types, then put these expressions in them accordingly.
# then these are just lines, where line is a statement terminating with ';'
# that is, create a more proper inheritence hierarchy. on paper, and code based on short unit tests.

method gen*(c: CsAssignmentExpression): string =
  assert false #TODO(gen:CsAssignmentExpression)
  echo "--> in  gen*(c: CsAssignmentExpression)"

# ============= CsAttributeArgumentList ========

proc newCs*(t: typedesc[CsAttributeArgumentList]; name: string): CsAttributeArgumentList =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAttributeArgumentList)

proc extract*(t: typedesc[CsAttributeArgumentList]; info: Info): CsAttributeArgumentList = assert false

method add*(parent: var CsAttributeArgumentList; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsAttributeArgumentList; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsAttributeArgumentList; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsAttributeArgumentList): string =
  assert false
  echo "--> in  gen*(c: var CsAttributeArgumentList)"

# ============= CsAttributeArgument ========

proc newCs*(t: typedesc[CsAttributeArgument]; name: string): CsAttributeArgument =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAttributeArgument)

proc extract*(t: typedesc[CsAttributeArgument]; info: Info): CsAttributeArgument = assert false

method add*(parent: var CsAttributeArgument; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsAttributeArgument; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsAttributeArgument; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsAttributeArgument): string =
  assert false
  echo "--> in  gen*(c: var CsAttributeArgument)"

proc newCs*(t: typedesc[CsAttributeList]; name: string): CsAttributeList =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAttributeList)

proc extract*(t: typedesc[CsAttributeList]; info: Info): CsAttributeList = assert false

method add*(parent: var CsAttributeList; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsAttributeList; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsAttributeList; item: Dummy; data: AllNeededData) = parent.add(item)
proc gen*(c: var CsAttributeList): string =
  assert false
  echo "--> in  gen*(c: var CsAttributeList)"

# ============= CsAttribute ========

proc newCs*(t: typedesc[CsAttribute]; name: string): CsAttribute =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAttribute)

proc extract*(t: typedesc[CsAttribute]; info: Info): CsAttribute = assert false

method add*(parent: var CsAttribute; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsAttribute; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsAttribute; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsAttribute): string =
  assert false
  echo "--> in  gen*(c: var CsAttribute)"

# ============= CsAttributeTargetSpecifier ========

proc newCs*(t: typedesc[CsAttributeTargetSpecifier]; name: string): CsAttributeTargetSpecifier =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAttributeTargetSpecifier)

proc extract*(t: typedesc[CsAttributeTargetSpecifier]; info: Info): CsAttributeTargetSpecifier = assert false

method add*(parent: var CsAttributeTargetSpecifier; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsAttributeTargetSpecifier; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsAttributeTargetSpecifier; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsAttributeTargetSpecifier): string =
  assert false
  echo "--> in  gen*(c: var CsAttributeTargetSpecifier)"

# ============= CsAwaitExpression ========

proc newCs*(t: typedesc[CsAwaitExpression]; name: string): CsAwaitExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAwaitExpression)

proc extract*(t: typedesc[CsAwaitExpression]; info: Info): CsAwaitExpression = assert false

method add*(parent: var CsAwaitExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsAwaitExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsAwaitExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsAwaitExpression): string =
  assert false
  echo "--> in  gen*(c: var CsAwaitExpression)"

# ============= CsBaseExpression ========

proc newCs*(t: typedesc[CsBaseExpression]; name: string): CsBaseExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsBaseExpression)

proc extract*(t: typedesc[CsBaseExpression]; info: Info): CsBaseExpression = assert false

method add*(parent: var CsBaseExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsBaseExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsBaseExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsBaseExpression): string =
  assert false
  echo "--> in  gen*(c: var CsBaseExpression)"

# ============= CsBaseList ========

proc newCs*(t: typedesc[CsBaseList]): CsBaseList =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsBaseList]; info: Info): CsBaseList =
  result = newCs(CsBaseList)
  if info.essentials.len > 0:
    result.baseList = info.essentials[0].split(", ").mapIt(it.strip)

method add*(parent: var CsBaseList; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsBaseList; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsBaseList; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsBaseList): string =
  assert false
  echo "--> in  gen*(c: var CsBaseList)"

# ============= CsBinaryExpression ========

method gen*(c:CsBinaryExpression):string=
  result = c.left & " " & c.op & " " & c.right

proc newCs*(t: typedesc[CsBinaryExpression]): CsBinaryExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsBinaryExpression)

proc extract*(t: typedesc[CsBinaryExpression]; info: Info): CsBinaryExpression =
  result = newCs(t)
  result.left = info.essentials[0]
  result.op = info.essentials[1]
  result.right = info.essentials[2]

method add*(parent: var CsBinaryExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsBinaryExpression; item: Dummy) "
  if stopEarly: assert false
# proc add*(parent: var CsBinaryExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsBinaryExpression): string =
  assert false
  echo "--> in  gen*(c: var CsBinaryExpression)"

# ============= CsBracketedArgumentList ========

proc newCs*(t: typedesc[CsBracketedArgumentList]; name: string): CsBracketedArgumentList =
  new result
  result.typ = $typeof(t)
#TODO(create:CsBracketedArgumentList)

proc extract*(t: typedesc[CsBracketedArgumentList]; info: Info): CsBracketedArgumentList = assert false

method add*(parent: var CsBracketedArgumentList; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsBracketedArgumentList; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsBracketedArgumentList; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsBracketedArgumentList): string =
  assert false
  echo "--> in  gen*(c: var CsBracketedArgumentList)"

# ============= CsBracketedParameterList ========

proc newCs*(t: typedesc[CsBracketedParameterList]): CsBracketedParameterList =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsBracketedParameterList]; info: Info): CsBracketedParameterList =
  result = newCs(CsBracketedParameterList) # for indexer, and what else?
  result.plist = info.essentials[0]
  # I suspect parameters will come next. most likely unneeded, i can easily parse that text.

method add*(parent: var CsBracketedParameterList; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsBracketedParameterList; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsBracketedParameterList; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsBracketedParameterList): string =
  assert false
  echo "--> in  gen*(c: var CsBracketedParameterList)"

# ============= CsBreakStatement ========

proc newCs*(t: typedesc[CsBreakStatement]; name: string): CsBreakStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsBreakStatement)

proc extract*(t: typedesc[CsBreakStatement]; info: Info): CsBreakStatement = assert false

method add*(parent: var CsBreakStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsBreakStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsBreakStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsBreakStatement): string =
  assert false
  echo "--> in  gen*(c: var CsBreakStatement)"

# ============= CsCasePatternSwitchLabel ========

proc newCs*(t: typedesc[CsCasePatternSwitchLabel]; name: string): CsCasePatternSwitchLabel =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCasePatternSwitchLabel)

proc extract*(t: typedesc[CsCasePatternSwitchLabel]; info: Info): CsCasePatternSwitchLabel = assert false

method add*(parent: var CsCasePatternSwitchLabel; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsCasePatternSwitchLabel; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsCasePatternSwitchLabel; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsCasePatternSwitchLabel): string =
  assert false
  echo "--> in  gen*(c: var CsCasePatternSwitchLabel)"

# ============= CsCaseSwitchLabel ========

proc newCs*(t: typedesc[CsCaseSwitchLabel]; name: string): CsCaseSwitchLabel =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCaseSwitchLabel)

proc extract*(t: typedesc[CsCaseSwitchLabel]; info: Info): CsCaseSwitchLabel = assert false

method add*(parent: var CsCaseSwitchLabel; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsCaseSwitchLabel; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsCaseSwitchLabel; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsCaseSwitchLabel): string =
  assert false
  echo "--> in  gen*(c: var CsCaseSwitchLabel)"

# ============= CsCastExpression ========

proc newCs*(t: typedesc[CsCastExpression]; name: string): CsCastExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCastExpression)

proc extract*(t: typedesc[CsCastExpression]; info: Info): CsCastExpression = assert false

method add*(parent: var CsCastExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsCastExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsCastExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsCastExpression): string =
  assert false
  echo "--> in  gen*(c: var CsCastExpression)"

# ============= CsCatchClause ========

proc newCs*(t: typedesc[CsCatchClause]; name: string): CsCatchClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCatchClause)

proc extract*(t: typedesc[CsCatchClause]; info: Info): CsCatchClause = assert false

method add*(parent: var CsCatchClause; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsCatchClause; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsCatchClause; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsCatchClause): string =
  assert false
  echo "--> in  gen*(c: var CsCatchClause)"

# ============= CsCatchFilterClause ========

proc newCs*(t: typedesc[CsCatchFilterClause]; name: string): CsCatchFilterClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCatchFilterClause)

proc extract*(t: typedesc[CsCatchFilterClause]; info: Info): CsCatchFilterClause = assert false

method add*(parent: var CsCatchFilterClause; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsCatchFilterClause; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsCatchFilterClause; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsCatchFilterClause): string =
  assert false
  echo "--> in  gen*(c: var CsCatchFilterClause)"

# ============= CsCatch ========

proc newCs*(t: typedesc[CsCatch]; name: string): CsCatch =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCatch)

proc extract*(t: typedesc[CsCatch]; info: Info): CsCatch = assert false

method add*(parent: var CsCatch; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsCatch; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsCatch; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsCatch): string =
  assert false
  echo "--> in  gen*(c: var CsCatch)"

# ============= CsCheckedExpression ========

proc newCs*(t: typedesc[CsCheckedExpression]; name: string): CsCheckedExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCheckedExpression)

proc extract*(t: typedesc[CsCheckedExpression]; info: Info): CsCheckedExpression = assert false

method add*(parent: var CsCheckedExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsCheckedExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsCheckedExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsCheckedExpression): string =
  assert false
  echo "--> in  gen*(c: var CsCheckedExpression)"

# ============= CsCheckedStatement ========

proc newCs*(t: typedesc[CsCheckedStatement]; name: string): CsCheckedStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCheckedStatement)

proc extract*(t: typedesc[CsCheckedStatement]; info: Info): CsCheckedStatement = assert false

method add*(parent: var CsCheckedStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsCheckedStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsCheckedStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsCheckedStatement): string =
  assert false
  echo "--> in  gen*(c: var CsCheckedStatement)"

method add*(parent:var CsProperty, item:CsAccessorList) =
  parent.acclist = item

method add*(parent:var CsMethod, item: CsAssignmentExpression)=
  parent.body.add item


method add*(c:var CsIndexer, item: CsAccessorList) =
  c.aclist=item
# ============= CsClass ========

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

  echo "--> in  gen*(p: CsParameter)"
  result = p.name & ": "
  if p.isRef:
    result &= "var "
  result &= p.ptype.strip

proc gen*(p: CsParameterList): string =

  echo "--> in  gen*(p: CsParameterList)"
  result = p.parameters.mapIt(it.gen()).join("; ")

proc lowerFirst(s:string) : string =
  if s.len == 0: return ""
  if s.len == 1:
    result = "" & s[0].toLowerAscii
  if s.len > 1 :
    result = s.lowerFirst()

proc gen*(m: var CsMethod): string =

  echo "--> in  gen*(m: var CsMethod)"
  echo "generating method (wip): " & m.name
  if not m.isStatic: result = "method " else: result = "proc "
  if not m.isStatic:
    m.addSelfParam()

  let parameterList = m.parameterList.gen()
  let returnType = if m.returnType != "void": m.returnType.replacementGenericTypes() else: ""
  let body =
    if m.body.len == 0: "discard"
    else:
      var lines : seq[string]
      for ln in m.body:
        echo ln.typ , " " , ln.ttype
        lines.add ln.gen()

      lines.join("\r\n  ")

  result &= m.name.lowerFirst & "(" & parameterList.replacementGenericTypes() & ")"
  if returnType != "": result &= ": " & returnType.replacementGenericTypes()
  result &= " ="
  result &= "\r\n  "

  result &= body

method gen*(c: var CsConstructor): string =

  echo "--> in  gen*(c: var CsConstructor)"
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

  echo "--> in  gen*(c: var CsIndexer)"
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
  echo "--> in  gen*(c: CsProperty)"
  result = ""
  if c.hasGet:
    result &= # this is a getter
      "method " & c.name.lowerFirst() &
      "*(this: " & c.parentClass & "): " & c.retType & " = " &
      "this.u_" & c.name
  if c.hasSet:
    result &=
      "method " & c.name.lowerFirst &
      "*(this: " & c.parentClass & ", value: " & c.retType & "): " & c.retType & " = " &
      "this.u_" & c.name & " = value"

# import ../type_utils

proc hasIndexer*(c: CsClass): bool =
  result = not c.indexer.isNil

proc gen*(c: CsClass): string =
  echo "--> in  gen*(c: CsClass)"
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


proc addField(parent:CsClass; name, typ:string) =
  var f = newCs(CsField)
  f.name = name
  f.thetype = typ
  parent.fields.add f

proc addFieldForProperty(parent:CsClass,item:CsProperty) =
  let fieldName = "u_" & item.name
  let fieldType = item.retType
  parent.addField(fieldName, fieldType)


method add*(parent: var CsClass; item: CsProperty) =
  parent.properties.add item
  parent.lastAddedTo = some(Properties)
  item.parentClass = parent.name
  if (item.hasGet or item.hasSet) and
    item.bodyGet.len == 0 and item.bodySet.len == 0:
      parent.addFieldForProperty(item)
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

proc newCs*(t: typedesc[CsClassOrStructConstraint]; name: string): CsClassOrStructConstraint =
  new result
  result.typ = $typeof(t)
#TODO(create:CsClassOrStructConstraint)

proc extract*(t: typedesc[CsClassOrStructConstraint]; info: Info): CsClassOrStructConstraint = assert false

method add*(parent: var CsClassOrStructConstraint; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsClassOrStructConstraint; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsClassOrStructConstraint; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsClassOrStructConstraint): string =
  assert false
  echo "--> in  gen*(c: var CsClassOrStructConstraint)"

# ============= CsConditionalAccessExpression ========

proc newCs*(t: typedesc[CsConditionalAccessExpression]; name: string): CsConditionalAccessExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsConditionalAccessExpression)

proc extract*(t: typedesc[CsConditionalAccessExpression]; info: Info): CsConditionalAccessExpression = assert false

method add*(parent: var CsConditionalAccessExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsConditionalAccessExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsConditionalAccessExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsConditionalAccessExpression): string =
  assert false
  echo "--> in  gen*(c: var CsConditionalAccessExpression)"

# ============= CsConditionalExpression ========

proc newCs*(t: typedesc[CsConditionalExpression]; name: string): CsConditionalExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsConditionalExpression)

proc extract*(t: typedesc[CsConditionalExpression]; info: Info): CsConditionalExpression = assert false

method add*(parent: var CsConditionalExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsConditionalExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsConditionalExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsConditionalExpression): string =
  assert false
  echo "--> in  gen*(c: var CsConditionalExpression)"

# ============= CsConstantPattern ========

proc newCs*(t: typedesc[CsConstantPattern]; name: string): CsConstantPattern =
  new result
  result.typ = $typeof(t)
#TODO(create:CsConstantPattern)

proc extract*(t: typedesc[CsConstantPattern]; info: Info): CsConstantPattern = assert false

method add*(parent: var CsConstantPattern; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsConstantPattern; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsConstantPattern; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsConstantPattern): string =
  assert false
  echo "--> in  gen*(c: var CsConstantPattern)"

# ============= CsConstructorConstraint ========

proc newCs*(t: typedesc[CsConstructorConstraint]; name: string): CsConstructorConstraint =
  new result
  result.typ = $typeof(t)
#TODO(create:CsConstructorConstraint)

proc extract*(t: typedesc[CsConstructorConstraint]; info: Info): CsConstructorConstraint = assert false

method add*(parent: var CsConstructorConstraint; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsConstructorConstraint; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsConstructorConstraint; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsConstructorConstraint): string =
  assert false
  echo "--> in  gen*(c: var CsConstructorConstraint)"

# ============= CsConstructorInitializer ========

proc newCs*(t: typedesc[CsConstructorInitializer]): CsConstructorInitializer =
  new result
  result.typ = $typeof(t)


proc extract*(t: typedesc[CsConstructorInitializer]; info: Info): CsConstructorInitializer =
  echo info
  result = newCs(CsConstructorInitializer)

# proc add*(parent: var CsConstructorInitializer; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsConstructorInitializer): string =
  assert false
  echo "--> in  gen*(c: var CsConstructorInitializer)"

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

proc newCs*(t: typedesc[CsContinueStatement]; name: string): CsContinueStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsContinueStatement)

proc extract*(t: typedesc[CsContinueStatement]; info: Info): CsContinueStatement = assert false

method add*(parent: var CsContinueStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsContinueStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsContinueStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsContinueStatement): string =
  assert false
  echo "--> in  gen*(c: var CsContinueStatement)"

# ============= CsConversionOperator ========

proc newCs*(t: typedesc[CsConversionOperator]; name: string): CsConversionOperator =
  new result
  result.typ = $typeof(t)
#TODO(create:CsConversionOperator)

proc extract*(t: typedesc[CsConversionOperator]; info: Info): CsConversionOperator = assert false

method add*(parent: var CsConversionOperator; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsConversionOperator; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsConversionOperator; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsConversionOperator): string =
  assert false
  echo "--> in  gen*(c: var CsConversionOperator)"

# ============= CsDeclarationExpression ========

proc newCs*(t: typedesc[CsDeclarationExpression]; name: string): CsDeclarationExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDeclarationExpression)

proc extract*(t: typedesc[CsDeclarationExpression]; info: Info): CsDeclarationExpression = assert false

method add*(parent: var CsDeclarationExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsDeclarationExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsDeclarationExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsDeclarationExpression): string =
  assert false
  echo "--> in  gen*(c: var CsDeclarationExpression)"

# ============= CsDeclarationPattern ========

proc newCs*(t: typedesc[CsDeclarationPattern]; name: string): CsDeclarationPattern =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDeclarationPattern)

proc extract*(t: typedesc[CsDeclarationPattern]; info: Info): CsDeclarationPattern = assert false

method add*(parent: var CsDeclarationPattern; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsDeclarationPattern; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsDeclarationPattern; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsDeclarationPattern): string =
  assert false
  echo "--> in  gen*(c: var CsDeclarationPattern)"

# ============= CsDefaultExpression ========

proc newCs*(t: typedesc[CsDefaultExpression]; name: string): CsDefaultExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDefaultExpression)

proc extract*(t: typedesc[CsDefaultExpression]; info: Info): CsDefaultExpression = assert false

method add*(parent: var CsDefaultExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsDefaultExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsDefaultExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsDefaultExpression): string =
  assert false
  echo "--> in  gen*(c: var CsDefaultExpression)"

# ============= CsDefaultSwitchLabel ========

proc newCs*(t: typedesc[CsDefaultSwitchLabel]; name: string): CsDefaultSwitchLabel =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDefaultSwitchLabel)

proc extract*(t: typedesc[CsDefaultSwitchLabel]; info: Info): CsDefaultSwitchLabel = assert false

method add*(parent: var CsDefaultSwitchLabel; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsDefaultSwitchLabel; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsDefaultSwitchLabel; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsDefaultSwitchLabel): string =
  assert false
  echo "--> in  gen*(c: var CsDefaultSwitchLabel)"

# ============= CsDelegate ========

proc newCs*(t: typedesc[CsDelegate]; name: string): CsDelegate =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDelegate)

proc extract*(t: typedesc[CsDelegate]; info: Info): CsDelegate = assert false

method add*(parent: var CsDelegate; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsDelegate; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsDelegate; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsDelegate): string =
  assert false
  echo "--> in  gen*(c: var CsDelegate)"

# ============= CsDestructor ========

proc newCs*(t: typedesc[CsDestructor]; name: string): CsDestructor =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDestructor)

proc extract*(t: typedesc[CsDestructor]; info: Info): CsDestructor = assert false

method add*(parent: var CsDestructor; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsDestructor; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsDestructor; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsDestructor): string =
  assert false
  echo "--> in  gen*(c: var CsDestructor)"

# ============= CsDiscardDesignation ========

proc newCs*(t: typedesc[CsDiscardDesignation]; name: string): CsDiscardDesignation =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDiscardDesignation)

proc extract*(t: typedesc[CsDiscardDesignation]; info: Info): CsDiscardDesignation = assert false

method add*(parent: var CsDiscardDesignation; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsDiscardDesignation; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsDiscardDesignation; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsDiscardDesignation): string =
  assert false
  echo "--> in  gen*(c: var CsDiscardDesignation)"

# ============= CsDoStatement ========

proc newCs*(t: typedesc[CsDoStatement]; name: string): CsDoStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDoStatement)

proc extract*(t: typedesc[CsDoStatement]; info: Info): CsDoStatement = assert false

method add*(parent: var CsDoStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsDoStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsDoStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsDoStatement): string =
  assert false
  echo "--> in  gen*(c: var CsDoStatement)"

# ============= CsElementAccessExpression ========

proc newCs*(t: typedesc[CsElementAccessExpression]; name: string): CsElementAccessExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsElementAccessExpression)

proc extract*(t: typedesc[CsElementAccessExpression]; info: Info): CsElementAccessExpression = assert false

method add*(parent: var CsElementAccessExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsElementAccessExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsElementAccessExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsElementAccessExpression): string =
  assert false
  echo "--> in  gen*(c: var CsElementAccessExpression)"

# ============= CsElementBindingExpression ========

proc newCs*(t: typedesc[CsElementBindingExpression]; name: string): CsElementBindingExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsElementBindingExpression)

proc extract*(t: typedesc[CsElementBindingExpression]; info: Info): CsElementBindingExpression = assert false

method add*(parent: var CsElementBindingExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsElementBindingExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsElementBindingExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsElementBindingExpression): string =
  assert false
  echo "--> in  gen*(c: var CsElementBindingExpression)"

# ============= CsElseClause ========

proc newCs*(t: typedesc[CsElseClause]; name: string): CsElseClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsElseClause)

proc extract*(t: typedesc[CsElseClause]; info: Info): CsElseClause = assert false

method add*(parent: var CsElseClause; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsElseClause; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsElseClause; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsElseClause): string =
  assert false
  echo "--> in  gen*(c: var CsElseClause)"

# ============= CsEmptyStatement ========

proc newCs*(t: typedesc[CsEmptyStatement]; name: string): CsEmptyStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsEmptyStatement)

proc extract*(t: typedesc[CsEmptyStatement]; info: Info): CsEmptyStatement = assert false

method add*(parent: var CsEmptyStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsEmptyStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsEmptyStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsEmptyStatement): string =
  assert false
  echo "--> in  gen*(c: var CsEmptyStatement)"

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

  echo "--> in  gen*(e: CsEnumMember)"
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

  echo "--> in  gen*(e: CsEnum)"
  echo "members count:" & $e.items.len

  result = "type " & e.name & "* = enum"
  if e.items.len > 0:
    result &= "\n  "
    let strs = e.items.mapIt(it.gen())
    result &= strs.join(", ")
  # echo result

# ============= CsEqualsValueClause ========

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

method add*(parent: var CsEqualsValueClause; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsEqualsValueClause; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsEqualsValueClause; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsEqualsValueClause): string =
  assert false
  echo "--> in  gen*(c: var CsEqualsValueClause)"

# ============= CsEventField ========

proc newCs*(t: typedesc[CsEventField]; name: string): CsEventField =
  new result
  result.typ = $typeof(t)
#TODO(create:CsEventField)

proc extract*(t: typedesc[CsEventField]; info: Info): CsEventField = assert false

method add*(parent: var CsEventField; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsEventField; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsEventField; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsEventField): string =
  assert false
  echo "--> in  gen*(c: var CsEventField)"

# ============= CsEvent ========

proc newCs*(t: typedesc[CsEvent]; name: string): CsEvent =
  new result
  result.typ = $typeof(t)
#TODO(create:CsEvent)

proc extract*(t: typedesc[CsEvent]; info: Info): CsEvent = assert false

method add*(parent: var CsEvent; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsEvent; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsEvent; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsEvent): string =
  assert false
  echo "--> in  gen*(c: var CsEvent)"

# ============= CsExplicitInterfaceSpecifier ========

proc newCs*(t: typedesc[CsExplicitInterfaceSpecifier]; name: string): CsExplicitInterfaceSpecifier =
  new result
  result.typ = $typeof(t)

  result.name = name

proc extract*(t: typedesc[CsExplicitInterfaceSpecifier]; info: Info): CsExplicitInterfaceSpecifier = #TODO(extract:CsExplicitInterfaceSpecifier)
  let name = info.essentials[0]
  result = newCs(CsExplicitInterfaceSpecifier, name)

# proc add*(parent: var CsExplicitInterfaceSpecifier; item: Dummy, data:AllNeededData) = parent.add(item) # TODO
method add*(parent: var CsExplicitInterfaceSpecifier; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsExplicitInterfaceSpecifier; item: Dummy) "
  #   assert false # TODO(add:CsExplicitInterfaceSpecifier)

# proc gen*(c: var CsExplicitInterfaceSpecifier): string = assert false #TODO(gen:CsExplicitInterfaceSpecifier)

# A method body's line.

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

method gen*(c: CsExpressionStatement): string =

  echo "--> in  gen*(c: CsExpressionStatement)"
  echo "generating for expression statement"
  echo "source is: " & c.src.strip()
  assert not c.call.isNil
  result = c.call.gen() & "("
  if c.args.args.len > 0:
    result &= c.args.gen()
  result &= ")"
  if c.call.callName.contains(".") and c.call.callName.startsWith(re.re"[A-Z]"):
    result &= " # " & c.call.callName.rsplit(".",1)[0]
  echo "expression statement generated result: " & result

# ============= CsExternAliasDirective ========

proc newCs*(t: typedesc[CsExternAliasDirective]; name: string): CsExternAliasDirective =
  new result
  result.typ = $typeof(t)
#TODO(create:CsExternAliasDirective)

proc extract*(t: typedesc[CsExternAliasDirective]; info: Info): CsExternAliasDirective =
  echo info
  let name = "" # info.essentials[0] # TODO!! cs environ got messed up after last extension update. after fixing, add name to info
  result = newCs(t,name) # rare, it's a name for the dll when ns+class ambiguity occurs, should be in Namespace i think.

method add*(parent: var CsExternAliasDirective; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsExternAliasDirective; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsExternAliasDirective; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsExternAliasDirective): string =
  assert false
  echo "--> in  gen*(c: var CsExternAliasDirective)"
# hmm, it's actually called a property.

# ============= CsFinallyClause ========

proc newCs*(t: typedesc[CsFinallyClause]; name: string): CsFinallyClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsFinallyClause)

proc extract*(t: typedesc[CsFinallyClause]; info: Info): CsFinallyClause = assert false

method add*(parent: var CsFinallyClause; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsFinallyClause; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsFinallyClause; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsFinallyClause): string =
  assert false
  echo "--> in  gen*(c: var CsFinallyClause)"

# ============= CsFixedStatement ========

proc newCs*(t: typedesc[CsFixedStatement]; name: string): CsFixedStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsFixedStatement)

proc extract*(t: typedesc[CsFixedStatement]; info: Info): CsFixedStatement = assert false

method add*(parent: var CsFixedStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsFixedStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsFixedStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsFixedStatement): string =
  assert false
  echo "--> in  gen*(c: var CsFixedStatement)"

# ============= CsForEachStatement ========

proc newCs*(t: typedesc[CsForEachStatement]; name: string): CsForEachStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsForEachStatement)

proc extract*(t: typedesc[CsForEachStatement]; info: Info): CsForEachStatement = assert false

method add*(parent: var CsForEachStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsForEachStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsForEachStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsForEachStatement): string =
  assert false
  echo "--> in  gen*(c: var CsForEachStatement)"

# ============= CsForEachVariableStatement ========

proc newCs*(t: typedesc[CsForEachVariableStatement]; name: string): CsForEachVariableStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsForEachVariableStatement)

proc extract*(t: typedesc[CsForEachVariableStatement]; info: Info): CsForEachVariableStatement = assert false

method add*(parent: var CsForEachVariableStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsForEachVariableStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsForEachVariableStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsForEachVariableStatement): string =
  assert false
  echo "--> in  gen*(c: var CsForEachVariableStatement)"

# ============= CsForStatement ========

proc newCs*(t: typedesc[CsForStatement]; name: string): CsForStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsForStatement)

proc extract*(t: typedesc[CsForStatement]; info: Info): CsForStatement = assert false

method add*(parent: var CsForStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsForStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsForStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsForStatement): string =
  assert false
  echo "--> in  gen*(c: var CsForStatement)"

# ============= CsFromClause ========

proc newCs*(t: typedesc[CsFromClause]; name: string): CsFromClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsFromClause)

proc extract*(t: typedesc[CsFromClause]; info: Info): CsFromClause = assert false

method add*(parent: var CsFromClause; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsFromClause; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsFromClause; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsFromClause): string =
  assert false
  echo "--> in  gen*(c: var CsFromClause)"

proc newCs*(t: typedesc[CsGenericName]): CsGenericName =
  new result
  result.typ = $typeof(t)
#TODO(create:CsGenericName)

proc extract*(t: typedesc[CsGenericName]; info: Info): CsGenericName =
  result = newCs(t)
  # assert false #TODO(extract:CsGenericName)

method add*(parent: var CsGenericName; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsGenericName; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsGenericName; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsGenericName): string =
  assert false
  echo "--> in  gen*(c: var CsGenericName)"

# ============= CsGlobalStatement ========

proc newCs*(t: typedesc[CsGlobalStatement]; name: string): CsGlobalStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsGlobalStatement)

proc extract*(t: typedesc[CsGlobalStatement]; info: Info): CsGlobalStatement = assert false

method add*(parent: var CsGlobalStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsGlobalStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsGlobalStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsGlobalStatement): string =
  assert false
  echo "--> in  gen*(c: var CsGlobalStatement)"

# ============= CsGotoStatement ========

proc newCs*(t: typedesc[CsGotoStatement]; name: string): CsGotoStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsGotoStatement)

proc extract*(t: typedesc[CsGotoStatement]; info: Info): CsGotoStatement = assert false

method add*(parent: var CsGotoStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsGotoStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsGotoStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsGotoStatement): string =
  assert false
  echo "--> in  gen*(c: var CsGotoStatement)"

# ============= CsGroupClause ========

proc newCs*(t: typedesc[CsGroupClause]; name: string): CsGroupClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsGroupClause)

proc extract*(t: typedesc[CsGroupClause]; info: Info): CsGroupClause = assert false

method add*(parent: var CsGroupClause; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsGroupClause; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsGroupClause; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsGroupClause): string =
  assert false
  echo "--> in  gen*(c: var CsGroupClause)"

# ============= CsIfStatement ========

proc newCs*(t: typedesc[CsIfStatement]; name: string): CsIfStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsIfStatement)

proc extract*(t: typedesc[CsIfStatement]; info: Info): CsIfStatement = assert false

method add*(parent: var CsIfStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsIfStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsIfStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsIfStatement): string =
  assert false
  echo "--> in  gen*(c: var CsIfStatement)"

# ============= CsImplicitArrayCreationExpression ========

proc newCs*(t: typedesc[CsImplicitArrayCreationExpression]; name: string): CsImplicitArrayCreationExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsImplicitArrayCreationExpression)

proc extract*(t: typedesc[CsImplicitArrayCreationExpression]; info: Info): CsImplicitArrayCreationExpression = assert false

method add*(parent: var CsImplicitArrayCreationExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsImplicitArrayCreationExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsImplicitArrayCreationExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsImplicitArrayCreationExpression): string =
  assert false
  echo "--> in  gen*(c: var CsImplicitArrayCreationExpression)"

# ============= CsImplicitElementAccess ========

proc newCs*(t: typedesc[CsImplicitElementAccess]; name: string): CsImplicitElementAccess =
  new result
  result.typ = $typeof(t)
#TODO(create:CsImplicitElementAccess)

proc extract*(t: typedesc[CsImplicitElementAccess]; info: Info): CsImplicitElementAccess = assert false

method add*(parent: var CsImplicitElementAccess; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsImplicitElementAccess; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsImplicitElementAccess; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsImplicitElementAccess): string =
  assert false
  echo "--> in  gen*(c: var CsImplicitElementAccess)"

# ============= CsIncompleteMember ========

proc newCs*(t: typedesc[CsIncompleteMember]; name: string): CsIncompleteMember =
  new result
  result.typ = $typeof(t)
#TODO(create:CsIncompleteMember)

proc extract*(t: typedesc[CsIncompleteMember]; info: Info): CsIncompleteMember = assert false

method add*(parent: var CsIncompleteMember; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsIncompleteMember; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsIncompleteMember; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsIncompleteMember): string =
  assert false
  echo "--> in  gen*(c: var CsIncompleteMember)"

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

method add*(parent: var CsIndexer; item: CsPredefinedType) =

  parent.retType = item.name
# proc add*(parent: var CsIndexer; item: CsPredefinedType; data: AllNeededData) = parent.add(item) # TODO

method add*(parent: var CsIndexer; item: CsExplicitInterfaceSpecifier) =

  parent.firstVarType = item.name
# proc add*(parent: var CsIndexer; item: CsExplicitInterfaceSpecifier; data: AllNeededData) = parent.add(item) # TODO

method add*(parent: CsLiteralExpression; item: CsPrefixUnaryExpression) =
  parent.value = item.prefix & parent.value

proc addBExpr(p: CsInitializerExpression; b:BodyExpr) =
  echo "in addBExpr: " & b.typ
  if p.somePrefixOp.isNil:
    p.bexprs.add b
  else:
    case b.typ
    of "CsLiteralExpression":
    # method add*(parent: var CsLiteralExpression; item: CsPrefixUnaryExpression) =
      CsLiteralExpression(b).add(p.somePrefixOp) # first apply prefix to obj
      p.bexprs.add b # and then add applied-obj to list.
    else: assert false
    p.somePrefixOp = nil # disable the op.

proc newCs*(t: typedesc[CsInitializerExpression]): CsInitializerExpression =
  new result
  result.typ = $typeof(t)

#TODO(create:CsInitializerExpression)

proc extract*(t: typedesc[CsInitializerExpression]; info: Info): CsInitializerExpression =
  result = newCs(t)
  if info.essentials.len > 1:
    result.valueReceived = info.essentials[1]
  echo "haven't really implemented: proc extract*(t: typedesc[CsInitializerExpression]; info: Info): CsInitializerExpression "
  echo info  # Info: InitializerExpression;; @["3", "15, 25, 5"];; @[]
  # 3 is arity. now it's possible they won't be simple literals. the following objects should provide more info.
  # for now we can store them as they are, or just make room, expect 3 more "expressions" or whatever.

method add*(parent: var CsInitializerExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsInitializerExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsInitializerExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsInitializerExpression): string =

  echo "--> in  gen*(c: var CsInitializerExpression)"
  echo "gen CsInitializerExpression, got values:", c.valueReceived
  # result = ".initWith("
  result = ".initWith(@["
  var ls :seq[string]= @[]
  for b in c.bexprs:
    ls.add b.gen()
  result &= ls.join(", ")
  # result &= ")"
  result &= "])"
  echo "gen result CsInitializerExpression" & result

# ============= CsInterface ========

proc newCs*(t: typedesc[CsInterface]; name: string): CsInterface =
  new result
  result.typ = $typeof(t)
#TODO(create:CsInterface)

proc extract*(t: typedesc[CsInterface]; info: Info): CsInterface = assert false

method add*(parent: var CsInterface; item: CsProperty) =
  assert false # TODO(add:CsInterface)

# proc add*(parent: var CsInterface; item: CsProperty; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsInterface): string =
  assert false
  echo "--> in  gen*(c: var CsInterface)"

# ============= CsInterpolatedStringExpression ========

proc newCs*(t: typedesc[CsInterpolatedStringExpression]; name: string): CsInterpolatedStringExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsInterpolatedStringExpression)

proc extract*(t: typedesc[CsInterpolatedStringExpression]; info: Info): CsInterpolatedStringExpression = assert false

method add*(parent: var CsInterpolatedStringExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsInterpolatedStringExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsInterpolatedStringExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsInterpolatedStringExpression): string =
  assert false
  echo "--> in  gen*(c: var CsInterpolatedStringExpression)"

# ============= CsInterpolatedStringText ========

proc newCs*(t: typedesc[CsInterpolatedStringText]; name: string): CsInterpolatedStringText =
  new result
  result.typ = $typeof(t)
#TODO(create:CsInterpolatedStringText)

proc extract*(t: typedesc[CsInterpolatedStringText]; info: Info): CsInterpolatedStringText = assert false

method add*(parent: var CsInterpolatedStringText; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsInterpolatedStringText; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsInterpolatedStringText; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsInterpolatedStringText): string =
  assert false
  echo "--> in  gen*(c: var CsInterpolatedStringText)"

# ============= CsInterpolationAlignmentClause ========

proc newCs*(t: typedesc[CsInterpolationAlignmentClause]; name: string): CsInterpolationAlignmentClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsInterpolationAlignmentClause)

proc extract*(t: typedesc[CsInterpolationAlignmentClause]; info: Info): CsInterpolationAlignmentClause = assert false

method add*(parent: var CsInterpolationAlignmentClause; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsInterpolationAlignmentClause; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsInterpolationAlignmentClause; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsInterpolationAlignmentClause): string =
  assert false
  echo "--> in  gen*(c: var CsInterpolationAlignmentClause)"

# ============= CsInterpolationFormatClause ========

proc newCs*(t: typedesc[CsInterpolationFormatClause]; name: string): CsInterpolationFormatClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsInterpolationFormatClause)

proc extract*(t: typedesc[CsInterpolationFormatClause]; info: Info): CsInterpolationFormatClause = assert false

method add*(parent: var CsInterpolationFormatClause; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsInterpolationFormatClause; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsInterpolationFormatClause; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsInterpolationFormatClause): string =
  assert false
  echo "--> in  gen*(c: var CsInterpolationFormatClause)"

# ============= CsInterpolation ========

proc newCs*(t: typedesc[CsInterpolation]; name: string): CsInterpolation =
  new result
  result.typ = $typeof(t)
#TODO(create:CsInterpolation)

proc extract*(t: typedesc[CsInterpolation]; info: Info): CsInterpolation = assert false

method add*(parent: var CsInterpolation; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsInterpolation; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsInterpolation; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsInterpolation): string =
  assert false
  echo "--> in  gen*(c: var CsInterpolation)"

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
  assert s.contains(".") and s.startsWith(re.re"[A-Z]")
  let parts = s.rsplit(".", 1)
  let lastPart = parts[1] # last part is the function name that was called.
  result = lastPart.lowerFirst()

method gen*(c: CsInvocationExpression): string =

  echo "--> in  gen*(c: CsInvocationExpression)"

  result = if c.callName.contains(".") and c.callName.startsWith(re.re"[A-Z]"):
    normalizeCallName(c.callName)
  elif c.callName.startsWith(re.re"[A-Z]"):
    c.callName.lowerFirst()
  else:
    c.callName

  #[
  let exprStmt = root.exprsTable[c.parentId] # method or class... how do we do this? uuid to the rescue.
  let assumingMethod = root.allMethodsTable[exprStmt.parentId]
  if assumingMethod.isStatic or assumingMethod.parentClass().isStatic: discard
    # ......  so everyone gets a unique id, and that's how we call back to parent

  # refactor to proc isInStatic(for each type that* needs it)

  # for handling c# static calls, we don't need the static class it was defined in.

    ]#

  # ============= CsIsPatternExpression ========

proc newCs*(t: typedesc[CsIsPatternExpression]; name: string): CsIsPatternExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsIsPatternExpression)

proc extract*(t: typedesc[CsIsPatternExpression]; info: Info): CsIsPatternExpression = assert false

method add*(parent: var CsIsPatternExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsIsPatternExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsIsPatternExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsIsPatternExpression): string =
  assert false
  echo "--> in  gen*(c: var CsIsPatternExpression)"

# ============= CsJoinClause ========

proc newCs*(t: typedesc[CsJoinClause]; name: string): CsJoinClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsJoinClause)

proc extract*(t: typedesc[CsJoinClause]; info: Info): CsJoinClause = assert false

method add*(parent: var CsJoinClause; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsJoinClause; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsJoinClause; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsJoinClause): string =
  assert false
  echo "--> in  gen*(c: var CsJoinClause)"

# ============= CsJoinIntoClause ========

proc newCs*(t: typedesc[CsJoinIntoClause]; name: string): CsJoinIntoClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsJoinIntoClause)

proc extract*(t: typedesc[CsJoinIntoClause]; info: Info): CsJoinIntoClause = assert false

method add*(parent: var CsJoinIntoClause; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsJoinIntoClause; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsJoinIntoClause; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsJoinIntoClause): string =
  assert false
  echo "--> in  gen*(c: var CsJoinIntoClause)"

# ============= CsLabeledStatement ========

proc newCs*(t: typedesc[CsLabeledStatement]; name: string): CsLabeledStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsLabeledStatement)

proc extract*(t: typedesc[CsLabeledStatement]; info: Info): CsLabeledStatement = assert false

method add*(parent: var CsLabeledStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsLabeledStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsLabeledStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsLabeledStatement): string =
  assert false
  echo "--> in  gen*(c: var CsLabeledStatement)"

# ============= CsLetClause ========

proc newCs*(t: typedesc[CsLetClause]; name: string): CsLetClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsLetClause)

proc extract*(t: typedesc[CsLetClause]; info: Info): CsLetClause = assert false

method add*(parent: var CsLetClause; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsLetClause; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsLetClause; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsLetClause): string =
  assert false
  echo "--> in  gen*(c: var CsLetClause)"

# ============= CsLiteralExpression ========

method add*(parent: var CsInitializerExpression; item: CsPrefixUnaryExpression) =
  parent.somePrefixOp = item

method add*(parent: var CsInitializerExpression; item: CsLiteralExpression) =
  parent.addBExpr item

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

  echo "--> in  gen*(lit: CsLiteralExpression)"
  lit.value

# ============= CsLocalDeclarationStatement ========

# proc add*(parent: var CsLocalDeclarationStatement; item: Dummy; data: AllNeededData) = parent.add(item)

# ============= CsLocalFunctionStatement ========

proc newCs*(t: typedesc[CsLocalFunctionStatement]; name: string): CsLocalFunctionStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsLocalFunctionStatement)

proc extract*(t: typedesc[CsLocalFunctionStatement]; info: Info): CsLocalFunctionStatement = assert false

method add*(parent: var CsLocalFunctionStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsLocalFunctionStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsLocalFunctionStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsLocalFunctionStatement): string =
  assert false
  echo "--> in  gen*(c: var CsLocalFunctionStatement)"

proc newCs*(t: typedesc[CsAssignmentExpression]): CsAssignmentExpression =
  new result
  result.typ = $typeof(t)

# ============= CsLockStatement ========

proc newCs*(t: typedesc[CsLockStatement]; name: string): CsLockStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsLockStatement)

proc extract*(t: typedesc[CsLockStatement]; info: Info): CsLockStatement = assert false

method add*(parent: var CsLockStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsLockStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsLockStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsLockStatement): string =
  assert false
  echo "--> in  gen*(c: var CsLockStatement)"

# ============= CsMakeRefExpression ========

proc newCs*(t: typedesc[CsMakeRefExpression]; name: string): CsMakeRefExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsMakeRefExpression)

proc extract*(t: typedesc[CsMakeRefExpression]; info: Info): CsMakeRefExpression = assert false

method add*(parent: var CsMakeRefExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsMakeRefExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsMakeRefExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsMakeRefExpression): string =
  assert false
  echo "--> in  gen*(c: var CsMakeRefExpression)"

# ============= CsMemberBindingExpression ========

proc newCs*(t: typedesc[CsMemberBindingExpression]; name: string): CsMemberBindingExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsMemberBindingExpression)

proc extract*(t: typedesc[CsMemberBindingExpression]; info: Info): CsMemberBindingExpression = assert false

method add*(parent: var CsMemberBindingExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsMemberBindingExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsMemberBindingExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsMemberBindingExpression): string =
  assert false
  echo "--> in  gen*(c: var CsMemberBindingExpression)"

proc newCs*(t: typedesc[CsMethod]; name: string): CsMethod =
  new result
  result.typ = $typeof(t)

  result.name = name

method add*(parent: var CsMethod; t: CsPredefinedType) =
  parent.returnType = t.name

method add*(parent: var CsMethod; p: CsParameterList) =
  parent.parameterList = p

method gen*(item:CsObjectCreationExpression) : string =

  echo "--> in  gen*(item:CsObjectCreationExpression) "
  result = "new" & item.name.replacementGenericTypes() &
    "(" &
    item.args.gen().replacementGenericTypes() &
    ")"
  if not item.initExpr.isNil:
    echo "trying to gen initExpr"
    result &= item.initExpr.gen()

method add*(parent:var CsObjectCreationExpression; item:CsGenericName) =
  parent.genericName=item

method add*(parent:var CsObjectCreationExpression; item:CsInitializerExpression) =
  parent.initExpr = item
  # assert false

proc extract*(t: typedesc[CsAssignmentExpression]; info: Info): CsAssignmentExpression =
  result = newCs(CsAssignmentExpression)
  result.left = info.essentials[0]
  # result.right = info.essentials[1]

method add*(parent:CsAssignmentExpression; item: CsTypeArgumentList) =
  echo "havent implemented method add*(parent:CsAssignmentExpression; item: CsTypeArgumentList) "
  discard # TODO?

method add*(parent:CsAssignmentExpression; item: CsGenericName) =
  echo "havent implemented method add*(parent:CsAssignmentExpression; item: CsGenericName) "
  discard # TODO?

method add*(parent:CsAssignmentExpression; item: CsArgumentList) =
  echo "havent implemented method add*(parent:CsAssignmentExpression; item: CsArgumentList) "
  discard # TODO?

method add*(parent:CsAssignmentExpression; item: CsObjectCreationExpression) =
  parent.right = item


method add*(parent:CsGenericName; item:CsTypeArgumentList) =
  parent.typearglist = item

method gen*(c:CsVariableDeclarator):string =
  echo "rhs is: " & c.rhs.typ
  if c.ev != nil:
    result &= " = " & c.rhs.gen()

# method add*(parent: var CsMethod; item: CsObjectCreationExpression) =
#   parent.body.add item
# proc add*(parent: var CsMethod; item: CsObjectCreationExpression; data: AllNeededData) = parent.add(item) # TODO

method add*(parent: var CsMethod; item: CsReturnStatement) =
  parent.body.add item
# proc add*(parent: var CsMethod; item: CsReturnStatement; data: AllNeededData) = parent.add(item) # TODO
method add*(parent: var CsMethod; item: CsExpressionStatement) =
  parent.body.add item

# ============= CsNameColon ========

proc newCs*(t: typedesc[CsNameColon]; name: string): CsNameColon =
  new result
  result.typ = $typeof(t)
#TODO(create:CsNameColon)

proc extract*(t: typedesc[CsNameColon]; info: Info): CsNameColon = assert false

method add*(parent: var CsNameColon; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsNameColon; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsNameColon; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsNameColon): string =
  assert false
  echo "--> in  gen*(c: var CsNameColon)"

# ============= CsNameEquals ========

proc newCs*(t: typedesc[CsNameEquals]; name: string): CsNameEquals =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsNameEquals]; info: Info): CsNameEquals =
  var name = ""
  if info.essentials.len > 0:
    name = info.essentials[0] # TODO: add in csdisplay
  result = newCs(CsNameEquals,name)


method add*(parent: var CsNameEquals; item: CsGenericName)  =
  parent.genericName = item

method add*(parent: var CsParameter; item: CsGenericName)  =
  parent.genericType = item

# proc add*(parent: var CsNameEquals; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsNameEquals): string =
  assert false
  echo "--> in  gen*(c: var CsNameEquals)"

# type Child* = object
#   name: string
#   case kind: NamespaceParts
#   of NamespaceParts.Classes:
#     npCls: CsClass
#   of NamespaceParts.Interfaces:
#     npIface: CsInterface
#   of NamespaceParts.Enums:
#     npEnum: CsEnum

proc `$`*(c:CsUsingDirective):string=
  result = "import: ("
  result &= "name: " & c.name
  result &= ")"

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

proc extract*(t: typedesc[CsMethod]; info: Info; data: AllNeededData): CsMethod =
  let name = info.essentials[0]
  let m = newCs(CsMethod, name)
  result = m
  if info.extras.len > 0:
    let e = info.extras[0]
    echo e
    if e.contains("static"):
      result.isStatic = true

  if info.essentials.len>1:
    let ret = info.essentials[1]
    if not ret.isEmptyOrWhitespace: result.returnType = ret

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

  echo "--> in  gen*(c: CsUsingDirective)"
  result = "import dotnet/" & c.name.toLowerAscii.replace(".", "/")

proc gen*(r: CsNamespace): string =

  echo "--> in  gen*(r: CsNamespace)"
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



method add*(parent:var CsUsingDirective; item: CsNameEquals) =
  parent.shorthand = item

# ============= CsNullableType ========

proc newCs*(t: typedesc[CsNullableType]; name: string): CsNullableType =
  new result
  result.typ = $typeof(t)
#TODO(create:CsNullableType)

proc extract*(t: typedesc[CsNullableType]; info: Info): CsNullableType = assert false

method add*(parent: var CsNullableType; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsNullableType; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsNullableType; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsNullableType): string =
  assert false
  echo "--> in  gen*(c: var CsNullableType)"

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

# ============= CsOmittedArraySizeExpression ========

proc newCs*(t: typedesc[CsOmittedArraySizeExpression]; name: string): CsOmittedArraySizeExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsOmittedArraySizeExpression)

proc extract*(t: typedesc[CsOmittedArraySizeExpression]; info: Info): CsOmittedArraySizeExpression = assert false

method add*(parent: var CsOmittedArraySizeExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsOmittedArraySizeExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsOmittedArraySizeExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsOmittedArraySizeExpression): string =
  assert false
  echo "--> in  gen*(c: var CsOmittedArraySizeExpression)"

# ============= CsOmittedTypeArgument ========

proc newCs*(t: typedesc[CsOmittedTypeArgument]; name: string): CsOmittedTypeArgument =
  new result
  result.typ = $typeof(t)
#TODO(create:CsOmittedTypeArgument)

proc extract*(t: typedesc[CsOmittedTypeArgument]; info: Info): CsOmittedTypeArgument = assert false

method add*(parent: var CsOmittedTypeArgument; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsOmittedTypeArgument; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsOmittedTypeArgument; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsOmittedTypeArgument): string =
  assert false
  echo "--> in  gen*(c: var CsOmittedTypeArgument)"

# ============= CsOperator ========

proc newCs*(t: typedesc[CsOperator]; name: string): CsOperator =
  new result
  result.typ = $typeof(t)
#TODO(create:CsOperator)

proc extract*(t: typedesc[CsOperator]; info: Info): CsOperator = assert false

method add*(parent: var CsOperator; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsOperator; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsOperator; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsOperator): string =
  assert false
  echo "--> in  gen*(c: var CsOperator)"

# ============= CsOrderByClause ========

proc newCs*(t: typedesc[CsOrderByClause]; name: string): CsOrderByClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsOrderByClause)

proc extract*(t: typedesc[CsOrderByClause]; info: Info): CsOrderByClause = assert false

method add*(parent: var CsOrderByClause; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsOrderByClause; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsOrderByClause; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsOrderByClause): string =
  assert false
  echo "--> in  gen*(c: var CsOrderByClause)"

# ============= CsOrdering ========

proc newCs*(t: typedesc[CsOrdering]; name: string): CsOrdering =
  new result
  result.typ = $typeof(t)
#TODO(create:CsOrdering)

proc extract*(t: typedesc[CsOrdering]; info: Info): CsOrdering = assert false

method add*(parent: var CsOrdering; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsOrdering; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsOrdering; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsOrdering): string =
  assert false
  echo "--> in  gen*(c: var CsOrdering)"

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

proc newCs*(t: typedesc[CsParenthesizedExpression]; name: string): CsParenthesizedExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsParenthesizedExpression)

proc extract*(t: typedesc[CsParenthesizedExpression]; info: Info): CsParenthesizedExpression = assert false

method add*(parent: var CsParenthesizedExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsParenthesizedExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsParenthesizedExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsParenthesizedExpression): string =
  assert false
  echo "--> in  gen*(c: var CsParenthesizedExpression)"

# ============= CsParenthesizedLambdaExpression ========

proc newCs*(t: typedesc[CsParenthesizedLambdaExpression]; name: string): CsParenthesizedLambdaExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsParenthesizedLambdaExpression)

proc extract*(t: typedesc[CsParenthesizedLambdaExpression]; info: Info): CsParenthesizedLambdaExpression = assert false

method add*(parent: var CsParenthesizedLambdaExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsParenthesizedLambdaExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsParenthesizedLambdaExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsParenthesizedLambdaExpression): string =
  assert false
  echo "--> in  gen*(c: var CsParenthesizedLambdaExpression)"

# ============= CsParenthesizedVariableDesignation ========

proc newCs*(t: typedesc[CsParenthesizedVariableDesignation]; name: string): CsParenthesizedVariableDesignation =
  new result
  result.typ = $typeof(t)
#TODO(create:CsParenthesizedVariableDesignation)

proc extract*(t: typedesc[CsParenthesizedVariableDesignation]; info: Info): CsParenthesizedVariableDesignation = assert false

method add*(parent: var CsParenthesizedVariableDesignation; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsParenthesizedVariableDesignation; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsParenthesizedVariableDesignation; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsParenthesizedVariableDesignation): string =
  assert false
  echo "--> in  gen*(c: var CsParenthesizedVariableDesignation)"

# ============= CsPointerType ========

proc newCs*(t: typedesc[CsPointerType]; name: string): CsPointerType =
  new result
  result.typ = $typeof(t)
#TODO(create:CsPointerType)

proc extract*(t: typedesc[CsPointerType]; info: Info): CsPointerType = assert false

method add*(parent: var CsPointerType; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsPointerType; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsPointerType; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsPointerType): string =
  assert false
  echo "--> in  gen*(c: var CsPointerType)"

# ============= CsPostfixUnaryExpression ========

proc newCs*(t: typedesc[CsPostfixUnaryExpression]; name: string): CsPostfixUnaryExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsPostfixUnaryExpression)

proc extract*(t: typedesc[CsPostfixUnaryExpression]; info: Info): CsPostfixUnaryExpression = assert false

method add*(parent: var CsPostfixUnaryExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsPostfixUnaryExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsPostfixUnaryExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsPostfixUnaryExpression): string =
  assert false
  echo "--> in  gen*(c: var CsPostfixUnaryExpression)"

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

proc gen*(c: var CsPredefinedType): string =
  assert false
  echo "--> in  gen*(c: var CsPredefinedType)"

# ============= CsPrefixUnaryExpression ========

proc newCs*(t: typedesc[CsPrefixUnaryExpression]): CsPrefixUnaryExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsPrefixUnaryExpression)

proc extract*(t: typedesc[CsPrefixUnaryExpression]; info: Info): CsPrefixUnaryExpression =
  result = newCs(t)
  result.prefix = info.essentials[0]
  result.actingOn = info.essentials[1]

method add*(parent: var CsPrefixUnaryExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsPrefixUnaryExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsPrefixUnaryExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsPrefixUnaryExpression): string =
  assert false
  echo "--> in  gen*(c: var CsPrefixUnaryExpression)"

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

proc newCs*(t: typedesc[CsQueryBody]; name: string): CsQueryBody =
  new result
  result.typ = $typeof(t)
#TODO(create:CsQueryBody)

proc extract*(t: typedesc[CsQueryBody]; info: Info): CsQueryBody = assert false

method add*(parent: var CsQueryBody; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsQueryBody; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsQueryBody; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsQueryBody): string =
  assert false
  echo "--> in  gen*(c: var CsQueryBody)"

# ============= CsQueryContinuation ========

proc newCs*(t: typedesc[CsQueryContinuation]; name: string): CsQueryContinuation =
  new result
  result.typ = $typeof(t)
#TODO(create:CsQueryContinuation)

proc extract*(t: typedesc[CsQueryContinuation]; info: Info): CsQueryContinuation = assert false

method add*(parent: var CsQueryContinuation; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsQueryContinuation; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsQueryContinuation; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsQueryContinuation): string =
  assert false
  echo "--> in  gen*(c: var CsQueryContinuation)"

# ============= CsQueryExpression ========

proc newCs*(t: typedesc[CsQueryExpression]; name: string): CsQueryExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsQueryExpression)

proc extract*(t: typedesc[CsQueryExpression]; info: Info): CsQueryExpression = assert false

method add*(parent: var CsQueryExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsQueryExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsQueryExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsQueryExpression): string =
  assert false
  echo "--> in  gen*(c: var CsQueryExpression)"

# ============= CsRefExpression ========

proc newCs*(t: typedesc[CsRefExpression]; name: string): CsRefExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsRefExpression)

proc extract*(t: typedesc[CsRefExpression]; info: Info): CsRefExpression = assert false

method add*(parent: var CsRefExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsRefExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsRefExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsRefExpression): string =
  assert false
  echo "--> in  gen*(c: var CsRefExpression)"

# ============= CsRefTypeExpression ========

proc newCs*(t: typedesc[CsRefTypeExpression]; name: string): CsRefTypeExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsRefTypeExpression)

proc extract*(t: typedesc[CsRefTypeExpression]; info: Info): CsRefTypeExpression = assert false

method add*(parent: var CsRefTypeExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsRefTypeExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsRefTypeExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsRefTypeExpression): string =
  assert false
  echo "--> in  gen*(c: var CsRefTypeExpression)"

# ============= CsRefType ========

proc newCs*(t: typedesc[CsRefType]; name: string): CsRefType =
  new result
  result.typ = $typeof(t)
#TODO(create:CsRefType)

proc extract*(t: typedesc[CsRefType]; info: Info): CsRefType = assert false

method add*(parent: var CsRefType; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsRefType; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsRefType; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsRefType): string =
  assert false
  echo "--> in  gen*(c: var CsRefType)"

# ============= CsRefValueExpression ========

proc newCs*(t: typedesc[CsRefValueExpression]; name: string): CsRefValueExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsRefValueExpression)

proc extract*(t: typedesc[CsRefValueExpression]; info: Info): CsRefValueExpression = assert false

method add*(parent: var CsRefValueExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsRefValueExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsRefValueExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsRefValueExpression): string =
  assert false
  echo "--> in  gen*(c: var CsRefValueExpression)"

# ============= CsReturnStatement ========

proc newCs*(t: typedesc[CsReturnStatement]): CsReturnStatement =
  new result
  result.typ = $typeof(t)
  result.ttype = "CsReturnStatement"

proc extract*(t: typedesc[CsReturnStatement]; info: Info): CsReturnStatement =
  result = newCs(CsReturnStatement)
  let expectedFollowupAsString = if info.essentials.len > 0: info.essentials[0] else: ""
  result.value = expectedFollowupAsString
  # echo "From C# side -- expected to follow after return: " & expectedFollowupAsString

method add*(parent: var BodyExpr; item:CsObject) =
  raise newException(Exception,
    "reached here, but should have gone to instance of type: " & parent.ttype)

method add*(parent: var CsReturnStatement; item: CsArgumentList) =
  parent.args = item

method add*(parent: var CsReturnStatement; item: BodyExpr) =
  if parent.isComplete:
    assert false, "already complete with bodyExpr:" & $(not parent.expr.isNil)
  parent.expr = item; parent.isComplete = true

method gen*(c: CsReturnStatement): string =

  echo "--> in  gen*(c: CsReturnStatement)"
  echo "generating CsReturnStatement:"
  if not c.expr.isNil:
    echo "!!!!!!", c.expr.typ , " " , c.expr.ttype
  result = "return"
  if c.expr.isNil:
    if not c.value.isEmptyOrWhitespace:
      result &= " " & c.value
  else:
    echo c.expr.ttype
    result &= " " & c.expr.gen()
    # if not c.args.isNil:
    #   result &= "(" & c.args.gen() & ")"
  echo "result was:" & result

# ============= CsSelectClause ========

proc newCs*(t: typedesc[CsSelectClause]; name: string): CsSelectClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsSelectClause)

proc extract*(t: typedesc[CsSelectClause]; info: Info): CsSelectClause = assert false

method add*(parent: var CsSelectClause; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsSelectClause; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsSelectClause; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsSelectClause): string =
  assert false
  echo "--> in  gen*(c: var CsSelectClause)"

proc newCs*(t: typedesc[CsSimpleBaseType]): CsSimpleBaseType =
  new result
  result.typ = $typeof(t)
#TODO(create:CsSimpleBaseType)

proc extract*(t: typedesc[CsSimpleBaseType]; info: Info): CsSimpleBaseType =
  result = newCs(t)   # TODO

method add*(parent: var CsSimpleBaseType; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsSimpleBaseType; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsSimpleBaseType; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsSimpleBaseType): string =
  assert false
  echo "--> in  gen*(c: var CsSimpleBaseType)"

# ============= CsSimpleLambdaExpression ========

proc newCs*(t: typedesc[CsSimpleLambdaExpression]; name: string): CsSimpleLambdaExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsSimpleLambdaExpression)

proc extract*(t: typedesc[CsSimpleLambdaExpression]; info: Info): CsSimpleLambdaExpression = assert false

method add*(parent: var CsSimpleLambdaExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsSimpleLambdaExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsSimpleLambdaExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsSimpleLambdaExpression): string =
  assert false
  echo "--> in  gen*(c: var CsSimpleLambdaExpression)"

# ============= CsSingleVariableDesignation ========

proc newCs*(t: typedesc[CsSingleVariableDesignation]; name: string): CsSingleVariableDesignation =
  new result
  result.typ = $typeof(t)
#TODO(create:CsSingleVariableDesignation)

proc extract*(t: typedesc[CsSingleVariableDesignation]; info: Info): CsSingleVariableDesignation = assert false

method add*(parent: var CsSingleVariableDesignation; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsSingleVariableDesignation; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsSingleVariableDesignation; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsSingleVariableDesignation): string =
  assert false
  echo "--> in  gen*(c: var CsSingleVariableDesignation)"

# ============= CsSizeOfExpression ========

proc newCs*(t: typedesc[CsSizeOfExpression]; name: string): CsSizeOfExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsSizeOfExpression)

proc extract*(t: typedesc[CsSizeOfExpression]; info: Info): CsSizeOfExpression = assert false

method add*(parent: var CsSizeOfExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsSizeOfExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsSizeOfExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsSizeOfExpression): string =
  assert false
  echo "--> in  gen*(c: var CsSizeOfExpression)"

# ============= CsStackAllocArrayCreationExpression ========

proc newCs*(t: typedesc[CsStackAllocArrayCreationExpression]; name: string): CsStackAllocArrayCreationExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsStackAllocArrayCreationExpression)

proc extract*(t: typedesc[CsStackAllocArrayCreationExpression]; info: Info): CsStackAllocArrayCreationExpression = assert false

method add*(parent: var CsStackAllocArrayCreationExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsStackAllocArrayCreationExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsStackAllocArrayCreationExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsStackAllocArrayCreationExpression): string =
  assert false
  echo "--> in  gen*(c: var CsStackAllocArrayCreationExpression)"

# ============= CsStruct ========

proc newCs*(t: typedesc[CsStruct]; name: string): CsStruct =
  new result
  result.typ = $typeof(t)
#TODO(create:CsStruct)

proc extract*(t: typedesc[CsStruct]; info: Info): CsStruct = assert false

method add*(parent: var CsStruct; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsStruct; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsStruct; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsStruct): string =
  assert false
  echo "--> in  gen*(c: var CsStruct)"

# ============= CsSwitchSection ========

proc newCs*(t: typedesc[CsSwitchSection]; name: string): CsSwitchSection =
  new result
  result.typ = $typeof(t)
#TODO(create:CsSwitchSection)

proc extract*(t: typedesc[CsSwitchSection]; info: Info): CsSwitchSection = assert false

method add*(parent: var CsSwitchSection; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsSwitchSection; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsSwitchSection; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsSwitchSection): string =
  assert false
  echo "--> in  gen*(c: var CsSwitchSection)"

# ============= CsSwitchStatement ========

proc newCs*(t: typedesc[CsSwitchStatement]; name: string): CsSwitchStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsSwitchStatement)

proc extract*(t: typedesc[CsSwitchStatement]; info: Info): CsSwitchStatement = assert false

method add*(parent: var CsSwitchStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsSwitchStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsSwitchStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsSwitchStatement): string =
  assert false
  echo "--> in  gen*(c: var CsSwitchStatement)"

proc newCs*(t: typedesc[CsThisExpression]; name: string): CsThisExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsThisExpression)

proc extract*(t: typedesc[CsThisExpression]; info: Info): CsThisExpression = assert false

method add*(parent: var CsThisExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsThisExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsThisExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsThisExpression): string =
  assert false
  echo "--> in  gen*(c: var CsThisExpression)"

# ============= CsThrowExpression ========

proc newCs*(t: typedesc[CsThrowExpression]; name: string): CsThrowExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsThrowExpression)

proc extract*(t: typedesc[CsThrowExpression]; info: Info): CsThrowExpression = assert false

method add*(parent: var CsThrowExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsThrowExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsThrowExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsThrowExpression): string =
  assert false
  echo "--> in  gen*(c: var CsThrowExpression)"

# ============= CsThrowStatement ========

proc newCs*(t: typedesc[CsThrowStatement]; name: string): CsThrowStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsThrowStatement)

proc extract*(t: typedesc[CsThrowStatement]; info: Info): CsThrowStatement = assert false

method add*(parent: var CsThrowStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsThrowStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsThrowStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsThrowStatement): string =
  assert false
  echo "--> in  gen*(c: var CsThrowStatement)"

# ============= CsTryStatement ========

proc newCs*(t: typedesc[CsTryStatement]; name: string): CsTryStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTryStatement)

proc extract*(t: typedesc[CsTryStatement]; info: Info): CsTryStatement = assert false

method add*(parent: var CsTryStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsTryStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsTryStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsTryStatement): string =
  assert false
  echo "--> in  gen*(c: var CsTryStatement)"

# ============= CsTupleElement ========

proc newCs*(t: typedesc[CsTupleElement]; name: string): CsTupleElement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTupleElement)

proc extract*(t: typedesc[CsTupleElement]; info: Info): CsTupleElement = assert false

method add*(parent: var CsTupleElement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsTupleElement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsTupleElement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsTupleElement): string =
  assert false
  echo "--> in  gen*(c: var CsTupleElement)"

# ============= CsTupleExpression ========

proc newCs*(t: typedesc[CsTupleExpression]; name: string): CsTupleExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTupleExpression)

proc extract*(t: typedesc[CsTupleExpression]; info: Info): CsTupleExpression = assert false

method add*(parent: var CsTupleExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsTupleExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsTupleExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsTupleExpression): string =
  assert false
  echo "--> in  gen*(c: var CsTupleExpression)"

# ============= CsTupleType ========

proc newCs*(t: typedesc[CsTupleType]; name: string): CsTupleType =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTupleType)

proc extract*(t: typedesc[CsTupleType]; info: Info): CsTupleType = assert false

method add*(parent: var CsTupleType; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsTupleType; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsTupleType; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsTupleType): string =
  assert false
  echo "--> in  gen*(c: var CsTupleType)"

# ============= CsTypeArgumentList ========

proc newCs*(t: typedesc[CsTypeArgumentList]): CsTypeArgumentList =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsTypeArgumentList]; info: Info): CsTypeArgumentList =
  result = newCs(CsTypeArgumentList)
  result.types= info.essentials[0].split(",").mapIt(it.strip)

method add*(parent: var CsTypeArgumentList; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsTypeArgumentList; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsTypeArgumentList; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsTypeArgumentList): string =
  assert false
  echo "--> in  gen*(c: var CsTypeArgumentList)"

# ============= CsTypeConstraint ========

proc newCs*(t: typedesc[CsTypeConstraint]; name: string): CsTypeConstraint =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTypeConstraint)

proc extract*(t: typedesc[CsTypeConstraint]; info: Info): CsTypeConstraint = assert false

method add*(parent: var CsTypeConstraint; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsTypeConstraint; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsTypeConstraint; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsTypeConstraint): string =
  assert false
  echo "--> in  gen*(c: var CsTypeConstraint)"

proc newCs*(t: typedesc[CsTypeOfExpression]; name: string): CsTypeOfExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTypeOfExpression)

proc extract*(t: typedesc[CsTypeOfExpression]; info: Info): CsTypeOfExpression = assert false

method add*(parent: var CsTypeOfExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsTypeOfExpression; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsTypeOfExpression; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsTypeOfExpression): string =
  assert false
  echo "--> in  gen*(c: var CsTypeOfExpression)"

# ============= CsTypeParameterConstraintClause ========

proc newCs*(t: typedesc[CsTypeParameterConstraintClause]; name: string): CsTypeParameterConstraintClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTypeParameterConstraintClause)

proc extract*(t: typedesc[CsTypeParameterConstraintClause]; info: Info): CsTypeParameterConstraintClause = assert false

method add*(parent: var CsTypeParameterConstraintClause; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsTypeParameterConstraintClause; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsTypeParameterConstraintClause; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsTypeParameterConstraintClause): string =
  assert false
  echo "--> in  gen*(c: var CsTypeParameterConstraintClause)"

# ============= CsTypeParameterList ========

proc newCs*(t: typedesc[CsTypeParameterList]; name: string): CsTypeParameterList =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTypeParameterList)

proc extract*(t: typedesc[CsTypeParameterList]; info: Info): CsTypeParameterList = assert false

method add*(parent: var CsTypeParameterList; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsTypeParameterList; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsTypeParameterList; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsTypeParameterList): string =
  assert false
  echo "--> in  gen*(c: var CsTypeParameterList)"

# ============= CsTypeParameter ========

proc newCs*(t: typedesc[CsTypeParameter]; name: string): CsTypeParameter =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTypeParameter)

proc extract*(t: typedesc[CsTypeParameter]; info: Info): CsTypeParameter = assert false

method add*(parent: var CsTypeParameter; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsTypeParameter; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsTypeParameter; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsTypeParameter): string =
  assert false
  echo "--> in  gen*(c: var CsTypeParameter)"

# ============= CsUnsafeStatement ========

proc newCs*(t: typedesc[CsUnsafeStatement]; name: string): CsUnsafeStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsUnsafeStatement)

proc extract*(t: typedesc[CsUnsafeStatement]; info: Info): CsUnsafeStatement = assert false

method add*(parent: var CsUnsafeStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsUnsafeStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsUnsafeStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsUnsafeStatement): string =
  assert false
  echo "--> in  gen*(c: var CsUnsafeStatement)"

# ============= CsUsingDirective ========

proc newCs*(t: typedesc[CsUsingDirective]; name: string): CsUsingDirective =
  new result
  result.typ = $typeof(t)
  result.name = name

proc extract*(t: typedesc[CsUsingDirective]; info: Info): CsUsingDirective =
  let name = info.essentials[0]
  result = newCs(CsUsingDirective, name)

# method add*(parent: var CsUsingDirective; item: Dummy) =

#   assert false # TODO(add:CsUsingDirective)

# proc add*(parent: var CsUsingDirective; item: Dummy; data: AllNeededData) = parent.add(item)

# ============= CsUsingStatement ========

proc newCs*(t: typedesc[CsUsingStatement]; name: string): CsUsingStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsUsingStatement)

proc extract*(t: typedesc[CsUsingStatement]; info: Info): CsUsingStatement = assert false

method add*(parent: var CsUsingStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsUsingStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsUsingStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsUsingStatement): string =
  assert false
  echo "--> in  gen*(c: var CsUsingStatement)"

# ============= CsWhenClause ========

proc newCs*(t: typedesc[CsWhenClause]; name: string): CsWhenClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsWhenClause)

proc extract*(t: typedesc[CsWhenClause]; info: Info): CsWhenClause = assert false

method add*(parent: var CsWhenClause; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsWhenClause; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsWhenClause; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsWhenClause): string =
  assert false
  echo "--> in  gen*(c: var CsWhenClause)"

# ============= CsWhereClause ========

proc newCs*(t: typedesc[CsWhereClause]; name: string): CsWhereClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsWhereClause)

proc extract*(t: typedesc[CsWhereClause]; info: Info): CsWhereClause = assert false

method add*(parent: var CsWhereClause; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsWhereClause; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsWhereClause; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsWhereClause): string =
  assert false
  echo "--> in  gen*(c: var CsWhereClause)"

# ============= CsWhileStatement ========

proc newCs*(t: typedesc[CsWhileStatement]; name: string): CsWhileStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsWhileStatement)

proc extract*(t: typedesc[CsWhileStatement]; info: Info): CsWhileStatement = assert false

method add*(parent: var CsWhileStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsWhileStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsWhileStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsWhileStatement): string =
  assert false
  echo "--> in  gen*(c: var CsWhileStatement)"

# ============= CsYieldStatement ========

proc newCs*(t: typedesc[CsYieldStatement]; name: string): CsYieldStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsYieldStatement)

proc extract*(t: typedesc[CsYieldStatement]; info: Info): CsYieldStatement = assert false

method add*(parent: var CsYieldStatement; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent: var CsYieldStatement; item: Dummy) "
  if stopEarly: assert false

# proc add*(parent: var CsYieldStatement; item: Dummy; data: AllNeededData) = parent.add(item)

proc gen*(c: var CsYieldStatement): string =
  assert false
  echo "--> in  gen*(c: var CsYieldStatement)"

# ======================================================

proc newCs*(t: typedesc[CsBlock]):CsBlock =
  new result
  result.typ = $typeof(t)

proc extract*(t:typedesc[CsBlock], info:Info,data:AllNeededData):CsBlock =
  result = newCs(t)

method gen*(c: CsBlock):string = assert false

proc newCs*(t: typedesc[CsVariable]):CsVariable =
  new result
  result.typ = $typeof(t)

proc newCs*(t: typedesc[CsLocalDeclarationStatement]): CsLocalDeclarationStatement =
  new result
  result.typ = $typeof(t)
  result.ttype = "CsLocalDeclarationStatement"

proc extract*(t: typedesc[CsLocalDeclarationStatement]; info: Info; data:AllNeededData): CsLocalDeclarationStatement =
  result = newCs(CsLocalDeclarationStatement)
  result.vartype = info.essentials[1]
  result.names = info.essentials[0].split(",").mapIt(it.strip)

method add*(parent:var CsVariable,item: CsGenericName) =
  parent.genericName = item


method gen*(c:  CsLocalDeclarationStatement): string =

  echo "--> in  gen*(c:  CsLocalDeclarationStatement)"
  # echo "first gen attempt!!!", c.names.join(", ") & " : " & c.vartype
  # result = "var " & $c.names.join(", ")
  # if c.vartype != "var":
  #   result &= " : " & c.vartype
  echo "START OF gen CsLocalDeclarationStatement:"
  echo "left hand side"
  result &= c.lhs.gen()
  echo "gen result so far: " & result
  echo "right hand side"
  result &= c.rhs.gen()
  echo "gen result so far: " & result
  echo "END OF gen CsLocalDeclarationStatement."

method add*(parent: var CsMethod; t: CsLocalDeclarationStatement) =
  parent.body.add t

method add*(parent: var CsLocalDeclarationStatement; item: CsVariable) =
  parent.lhs = item

method add*(parent: var CsLocalDeclarationStatement; item: CsGenericName) =
  parent.lhs.genericName = item

method add*(parent: var CsLocalDeclarationStatement; item: CsTypeArgumentList) =
  parent.lhs.genericName.typearglist = item
  # TODO: can also be the rhs. so we should forward to last construct that fits instead of a high parent.

method add*(parent: var CsLocalDeclarationStatement; item: CsVariableDeclarator) =
  parent.rhs = item

method add*(parent: var CsVariableDeclarator; item: CsLiteralExpression) =
  parent.rhs = item
method add*(parent: var CsVariableDeclarator; item: CsArgumentList) =
  parent.arglist = item # FIXME!

method add*(parent: var CsLocalDeclarationStatement; item: CsLiteralExpression) =
  parent.rhs.add item

method add*(parent: var CsLocalDeclarationStatement; item: CsArgumentList) =
  parent.rhs.add item

method add*(parent:var CsVariable; item: CsPredefinedType) =  assert false

method add*(parent: var CsVariableDeclarator; item: CsEqualsValueClause)=
  parent.ev = item

proc newCs*(t: typedesc[CsVariableDeclarator]):CsVariableDeclarator =
  new result
  result.typ = $typeof(t)

method add*(parent: var CsVariableDeclarator; item: CsBinaryExpression)=
  parent.rhs = item

method add*(parent: var CsVariableDeclarator; item: CsObjectCreationExpression)=
  parent.rhs = item
  # assert parent.bexpr.isNil
  # parent.bexpr = item

proc extract*(_: typedesc[CsVariableDeclarator]; info: Info): CsVariableDeclarator =
  result = newCs(CsVariableDeclarator)
  result.name = info.essentials[0]

proc extract*(t:typedesc[CsVariable], info:Info,data:AllNeededData):CsVariable =
  result = newCs(CsVariable)
  let p = info.essentials[0].split(":");
  result.thetype = p[1]
  assert p[0] == "type"
  let n = info.essentials[1].split(":");
  result.name = n[1]
  assert n[0] == "name"

method gen*(c: CsVariable):string =
  result = "var " & c.name
  if c.thetype != "var":
    result &= " : " & c.thetype.replacementGenericTypes()

method add*(parent:var CsBinaryPattern; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent:var CsBinaryPattern; item: Dummy) "
  #   assert false
proc extract*(t:typedesc[CsBinaryPattern], info:Info,data:AllNeededData):CsBinaryPattern = assert false
method gen*(c: CsBinaryPattern):string = assert false

method add*(parent:var CsDiscardPattern; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent:var CsDiscardPattern; item: Dummy) "
  #   assert false
proc extract*(t:typedesc[CsDiscardPattern], info:Info,data:AllNeededData):CsDiscardPattern = assert false
method gen*(c: CsDiscardPattern):string = assert false

method add*(parent:var CsFunctionPointerType; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent:var CsFunctionPointerType; item: Dummy) "
  #   assert false
proc extract*(t:typedesc[CsFunctionPointerType], info:Info,data:AllNeededData):CsFunctionPointerType = assert false
method gen*(c: CsFunctionPointerType):string = assert false

method add*(parent:var CsImplicitObjectCreationExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent:var CsImplicitObjectCreationExpression; item: Dummy) "
  #   assert false
proc extract*(t:typedesc[CsImplicitObjectCreationExpression], info:Info,data:AllNeededData):CsImplicitObjectCreationExpression = assert false
method gen*(c: CsImplicitObjectCreationExpression):string = assert false

proc newCs*(t:typedesc[CsMemberAccessExpression]):CsMemberAccessExpression =
  new result
  result.typ = $typeof(t)

method add*(parent:var CsMemberAccessExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent:var CsMemberAccessExpression; item: Dummy) "
  #   assert false

proc extract*(t:typedesc[CsMemberAccessExpression], info:Info,data:AllNeededData):CsMemberAccessExpression =
  result = newCs(t)  # i think we can discard it.

method gen*(c: CsMemberAccessExpression):string = assert false

method add*(parent:var CsParenthesizedPattern; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent:var CsParenthesizedPattern; item: Dummy) "
  #   assert false
proc extract*(t:typedesc[CsParenthesizedPattern], info:Info,data:AllNeededData):CsParenthesizedPattern = assert false
method gen*(c: CsParenthesizedPattern):string = assert false

method add*(parent:var CsPositionalPatternClause; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent:var CsPositionalPatternClause; item: Dummy) "
  #   assert false
proc extract*(t:typedesc[CsPositionalPatternClause], info:Info,data:AllNeededData):CsPositionalPatternClause = assert false
method gen*(c: CsPositionalPatternClause):string = assert false

method add*(parent:var CsPrimaryConstructorBaseType; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent:var CsPrimaryConstructorBaseType; item: Dummy) "
  #   assert false
proc extract*(t:typedesc[CsPrimaryConstructorBaseType], info:Info,data:AllNeededData):CsPrimaryConstructorBaseType = assert false
method gen*(c: CsPrimaryConstructorBaseType):string = assert false

method add*(parent:var CsPropertyPatternClause; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent:var CsPropertyPatternClause; item: Dummy) "
  #   assert false
proc extract*(t:typedesc[CsPropertyPatternClause], info:Info,data:AllNeededData):CsPropertyPatternClause = assert false
method gen*(c: CsPropertyPatternClause):string = assert false

method add*(parent:var CsRangeExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent:var CsRangeExpression; item: Dummy) "
  #   assert false
proc extract*(t:typedesc[CsRangeExpression], info:Info,data:AllNeededData):CsRangeExpression = assert false
method gen*(c: CsRangeExpression):string = assert false

method add*(parent:var CsRecord; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent:var CsRecord; item: Dummy) "
  #   assert false
proc extract*(t:typedesc[CsRecord], info:Info,data:AllNeededData):CsRecord = assert false
method gen*(c: CsRecord):string = assert false

method add*(parent:var CsRecursivePattern; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent:var CsRecursivePattern; item: Dummy) "
  #   assert false
proc extract*(t:typedesc[CsRecursivePattern], info:Info,data:AllNeededData):CsRecursivePattern = assert false
method gen*(c: CsRecursivePattern):string = assert false

method add*(parent:var CsRelationalPattern; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent:var CsRelationalPattern; item: Dummy) "
  #   assert false
proc extract*(t:typedesc[CsRelationalPattern], info:Info,data:AllNeededData):CsRelationalPattern = assert false
method gen*(c: CsRelationalPattern):string = assert false

method add*(parent:var CsSubpattern; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent:var CsSubpattern; item: Dummy) "
  #   assert false
proc extract*(t:typedesc[CsSubpattern], info:Info,data:AllNeededData):CsSubpattern = assert false
method gen*(c: CsSubpattern):string = assert false

method add*(parent:var CsSwitchExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent:var CsSwitchExpression; item: Dummy) "
  #   assert false
proc extract*(t:typedesc[CsSwitchExpression], info:Info,data:AllNeededData):CsSwitchExpression = assert false
method gen*(c: CsSwitchExpression):string = assert false

method add*(parent:var CsSwitchExpressionArm; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent:var CsSwitchExpressionArm; item: Dummy) "
  #   assert false
proc extract*(t:typedesc[CsSwitchExpressionArm], info:Info,data:AllNeededData):CsSwitchExpressionArm = assert false
method gen*(c: CsSwitchExpressionArm):string = assert false

method add*(parent:var CsTypePattern; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent:var CsTypePattern; item: Dummy) "
  #   assert false
proc extract*(t:typedesc[CsTypePattern], info:Info,data:AllNeededData):CsTypePattern = assert false
method gen*(c: CsTypePattern):string = assert false

method add*(parent:var CsUnaryPattern; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent:var CsUnaryPattern; item: Dummy) "
  #   assert false
proc extract*(t:typedesc[CsUnaryPattern], info:Info,data:AllNeededData):CsUnaryPattern = assert false
method gen*(c: CsUnaryPattern):string = assert false

method add*(parent:var CsVarPattern; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent:var CsVarPattern; item: Dummy) "
  #   assert false
proc extract*(t:typedesc[CsVarPattern], info:Info,data:AllNeededData):CsVarPattern = assert false
method gen*(c: CsVarPattern):string = assert false

method add*(parent:var CsWithExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent:var CsWithExpression; item: Dummy) "
  #   assert false
proc extract*(t:typedesc[CsWithExpression], info:Info,data:AllNeededData):CsWithExpression = assert false
method gen*(c: CsWithExpression):string = assert false

method add*(parent:var CsImplicitStackAllocArrayCreationExpression; item: Dummy)  =
  echo "!!! ---->> unimplemented:  method add*(parent:var CsImplicitStackAllocArrayCreationExpression; item: Dummy) "
  #   assert false
proc extract*(t:typedesc[CsImplicitStackAllocArrayCreationExpression], info:Info,data:AllNeededData):CsImplicitStackAllocArrayCreationExpression = assert false
method gen*(c: CsImplicitStackAllocArrayCreationExpression):string = assert false