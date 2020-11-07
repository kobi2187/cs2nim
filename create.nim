# create.nim

import types

import json
proc jsonWithoutSource*(n: JsonNode): JsonNode =
  var p = n.deepCopy
  p.delete("Source")
  result = p
#Some plan: then we add this object to the current location in root. (based on blocks and currentPath)
# so, i think we wouldn't need to keep track of current location except for this blocks stack.
# add the source and original json minus source to the object created (based on CsObject fields)
# (with a general proc acting on CsObject)
# these will be comments when generated later on.

# put here all the newCsType procs

import tables
proc newCsNamespace*(name: string): CsNamespace =
  new result
  result.name = name
  # result.classes = @[]
  result.classTable = newTable[string, CsClass]()

proc newCsRoot*(): CsRoot =
  result.ns = @[]
  result.nsTables = newTable[string, CsNamespace]()

  let defaultNs = newCsNamespace("default")
  result.global = defaultNs
  result.nsTables["default"] = defaultNs



# proc newCsAccessor(XXX): CsAccessor
# proc newCsAccessorList(XXX): CsAccessorList
# proc newCsAliasQualifiedName(XXX): CsAliasQualifiedName
# proc newCsAnonymousMethodExpression(XXX): CsAnonymousMethodExpression
# proc newCsAnonymousObjectCreationExpression(  XXX): CsAnonymousObjectCreationExpression
# proc newCsAnonymousObjectMemberDeclarator(  XXX): CsAnonymousObjectMemberDeclarator
# proc newCsArgument(XXX): CsArgument
# proc newCsArrayCreationExpression(XXX): CsArrayCreationExpression
# proc newCsArrayRankSpecifier(XXX): CsArrayRankSpecifier
# proc newCsArrayType(XXX): CsArrayType
# proc newCsArrowExpressionClause(XXX): CsArrowExpressionClause
# proc newCsAssignmentExpression(XXX): CsAssignmentExpression
# proc newCsAttribute(XXX): CsAttribute
# proc newCsAttributeArgument(XXX): CsAttributeArgument
# proc newCsAttributeArgumentList(XXX): CsAttributeArgumentList
# proc newCsAttributeList(XXX): CsAttributeList
# proc newCsAttributeTargetSpecifier(XXX): CsAttributeTargetSpecifier
# proc newCsAwaitExpression(XXX): CsAwaitExpression
# proc newCsBaseExpression(XXX): CsBaseExpression
# proc newCsBaseList(XXX): CsBaseList
# proc newCsBinaryExpression(XXX): CsBinaryExpression
# proc newCsBracketedArgumentList(XXX): CsBracketedArgumentList
# proc newCsBracketedParameterList(XXX): CsBracketedParameterList
# proc newCsBreakStatement(XXX): CsBreakStatement
# proc newCsCasePatternSwitchLabel(XXX): CsCasePatternSwitchLabel
# proc newCsCaseSwitchLabel(XXX): CsCaseSwitchLabel
# proc newCsCastExpression(XXX): CsCastExpression
# proc newCsCatch(XXX): CsCatch
# proc newCsCatchClause(XXX): CsCatchClause
# proc newCsCatchFilterClause(XXX): CsCatchFilterClause
# proc newCsCheckedExpression(XXX): CsCheckedExpression
# proc newCsCheckedStatement(XXX): CsCheckedStatement
# proc newCsClassOrStructConstraint(XXX): CsClassOrStructConstraint
# proc newCsConditionalAccessExpression(XXX): CsConditionalAccessExpression
# proc newCsConditionalExpression(XXX): CsConditionalExpression
# proc newCsConstantPattern(XXX): CsConstantPattern
# proc newCsConstructor(XXX): CsConstructor
# proc newCsConstructorConstraint(XXX): CsConstructorConstraint
# proc newCsConstructorInitializer(XXX): CsConstructorInitializer
# proc newCsContinueStatement(XXX): CsContinueStatement
# proc newCsConversionOperator(XXX): CsConversionOperator
# proc newCsDeclarationExpression(XXX): CsDeclarationExpression
# proc newCsDeclarationPattern(XXX): CsDeclarationPattern
# proc newCsDefaultExpression(XXX): CsDefaultExpression
# proc newCsDefaultSwitchLabel(XXX): CsDefaultSwitchLabel
# proc newCsDelegate(XXX): CsDelegate
# proc newCsDestructor(XXX): CsDestructor
# proc newCsDiscardDesignation(XXX): CsDiscardDesignation
# proc newCsDoStatement(XXX): CsDoStatement
# proc newCsElementAccessExpression(XXX): CsElementAccessExpression
# proc newCsElementBindingExpression(XXX): CsElementBindingExpression
# proc newCsElseClause(XXX): CsElseClause
# proc newCsEmptyStatement(XXX): CsEmptyStatement
# proc newCsEnum(XXX): CsEnum
# proc newCsEnumMember(XXX): CsEnumMember
# proc newCsEqualsValueClause(XXX): CsEqualsValueClause
# proc newCsEvent(XXX): CsEvent
# proc newCsEventField(XXX): CsEventField
# proc newCsExplicitInterfaceSpecifier(XXX): CsExplicitInterfaceSpecifier
# proc newCsExpressionStatement(XXX): CsExpressionStatement
# proc newCsExternAliasDirective(XXX): CsExternAliasDirective
# proc newCsField(XXX): CsField
# proc newCsFinallyClause(XXX): CsFinallyClause
# proc newCsFixedStatement(XXX): CsFixedStatement
# proc newCsForEachStatement(XXX): CsForEachStatement
# proc newCsForEachVariableStatement(XXX): CsForEachVariableStatement
# proc newCsForStatement(XXX): CsForStatement
# proc newCsFromClause(XXX): CsFromClause
# proc newCsGenericName(XXX): CsGenericName
# proc newCsGlobalStatement(XXX): CsGlobalStatement
# proc newCsGotoStatement(XXX): CsGotoStatement
# proc newCsGroupClause(XXX): CsGroupClause
# proc newCsIfStatement(XXX): CsIfStatement
# proc newCsImplicitArrayCreationExpression(  XXX): CsImplicitArrayCreationExpression
# proc newCsImplicitElementAccess(XXX): CsImplicitElementAccess
# proc newCsIncompleteMember(XXX): CsIncompleteMember
# proc newCsIndexer(XXX): CsIndexer
# proc newCsInitializerExpression(XXX): CsInitializerExpression
# proc newCsInterface(XXX): CsInterface
# proc newCsInterpolatedStringExpression(XXX): CsInterpolatedStringExpression
# proc newCsInterpolatedStringText(XXX): CsInterpolatedStringText
# proc newCsInterpolation(XXX): CsInterpolation
# proc newCsInterpolationAlignmentClause(XXX): CsInterpolationAlignmentClause
# proc newCsInterpolationFormatClause(XXX): CsInterpolationFormatClause
# proc newCsIsPatternExpression(XXX): CsIsPatternExpression
# proc newCsJoinClause(XXX): CsJoinClause
# proc newCsJoinIntoClause(XXX): CsJoinIntoClause
# proc newCsLabeledStatement(XXX): CsLabeledStatement
# proc newCsLetClause(XXX): CsLetClause
# proc newCsLocalDeclarationStatement(XXX): CsLocalDeclarationStatement
# proc newCsLocalFunctionStatement(XXX): CsLocalFunctionStatement
# proc newCsLockStatement(XXX): CsLockStatement
# proc newCsMakeRefExpression(XXX): CsMakeRefExpression
# proc newCsMemberBindingExpression(XXX): CsMemberBindingExpression
# proc newCsNameColon(XXX): CsNameColon
# proc newCsNameEquals(XXX): CsNameEquals
# proc newCsNullableType(XXX): CsNullableType
# proc newCsObjectCreationExpression(XXX): CsObjectCreationExpression
# proc newCsOmittedArraySizeExpression(XXX): CsOmittedArraySizeExpression
# proc newCsOmittedTypeArgument(XXX): CsOmittedTypeArgument
# proc newCsOperator(XXX): CsOperator
# proc newCsOrderByClause(XXX): CsOrderByClause
# proc newCsOrdering(XXX): CsOrdering
# proc newCsParameter(XXX): CsParameter
# proc newCsParameterList(XXX): CsParameterList
# proc newCsParenthesizedExpression(XXX): CsParenthesizedExpression
# proc newCsParenthesizedLambdaExpression(XXX): CsParenthesizedLambdaExpression
# proc newCsParenthesizedVariableDesignation(  XXX): CsParenthesizedVariableDesignation
# proc newCsPointerType(XXX): CsPointerType
# proc newCsPostfixUnaryExpression(XXX): CsPostfixUnaryExpression
# proc newCsPrefixUnaryExpression(XXX): CsPrefixUnaryExpression
# proc newCsProperty(XXX): CsProperty
# proc newCsQueryBody(XXX): CsQueryBody
# proc newCsQueryContinuation(XXX): CsQueryContinuation
# proc newCsQueryExpression(XXX): CsQueryExpression
# proc newCsRefExpression(XXX): CsRefExpression
# proc newCsRefType(XXX): CsRefType
# proc newCsRefTypeExpression(XXX): CsRefTypeExpression
# proc newCsRefValueExpression(XXX): CsRefValueExpression
# proc newCsReturnStatement(XXX): CsReturnStatement
# proc newCsSelectClause(XXX): CsSelectClause
# proc newCsSimpleBaseType(XXX): CsSimpleBaseType
# proc newCsSimpleLambdaExpression(XXX): CsSimpleLambdaExpression
# proc newCsSingleVariableDesignation(XXX): CsSingleVariableDesignation
# proc newCsSizeOfExpression(XXX): CsSizeOfExpression
# proc newCsStackAllocArrayCreationExpression(  XXX): CsStackAllocArrayCreationExpression
# proc newCsStruct(XXX): CsStruct
# proc newCsSwitchSection(XXX): CsSwitchSection
# proc newCsSwitchStatement(XXX): CsSwitchStatement
# proc newCsThisExpression(XXX): CsThisExpression
# proc newCsThrowExpression(XXX): CsThrowExpression
# proc newCsThrowStatement(XXX): CsThrowStatement
# proc newCsTryStatement(XXX): CsTryStatement
# proc newCsTupleElement(XXX): CsTupleElement
# proc newCsTupleExpression(XXX): CsTupleExpression
# proc newCsTupleType(XXX): CsTupleType
# proc newCsTypeArgumentList(XXX): CsTypeArgumentList
# proc newCsTypeConstraint(XXX): CsTypeConstraint
# proc newCsTypeOfExpression(XXX): CsTypeOfExpression
# proc newCsTypeParameter(XXX): CsTypeParameter
# proc newCsTypeParameterConstraintClause(XXX): CsTypeParameterConstraintClause
# proc newCsTypeParameterList(XXX): CsTypeParameterList
# proc newCsUnsafeStatement(XXX): CsUnsafeStatement
# proc newCsUsingStatement(XXX): CsUsingStatement
# proc newCsWhenClause(XXX): CsWhenClause
# proc newCsWhereClause(XXX): CsWhereClause
# proc newCsWhileStatement(XXX): CsWhileStatement
# proc newCsYieldStatement(XXX): CsYieldStatement
