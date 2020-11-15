# extract.nim

import types, state, create
import tables

func extractCsNamespace*(info: Info): CsNamespace =
  newCsNamespace(info.essentials[0])

func extractCsNamespace*(b: Block): CsNamespace =
  newCsNamespace(b.instanceName)

proc addNamespace*(csn: CsNamespace) =
  root.ns.add(csn)
  root.nsTables[csn.name] = csn

proc addNamespace*(ns: string) =
  let csn = newCsNamespace(ns)
  addNamespace(csn)

proc extractClass*(info: Info): CsClass =
  # new result
  let name = info.essentials[0]
  result = CsClass(name: name)

proc addClass*(ns: CsNamespace, class: CsClass) =
  ns.classes.add(class)
  ns.classTable[class.name] = class

#[ some generic ideas to simplify code.
proc findCurrentElement[T]():T =
  # for elem in currentPath: advance the ref according to elem, then return ref when we're done.
  # this is the position to add to Root.
  discard

proc add[T](a:T) =
  let currentRef = findCurrentElement()
  currentRef.add(a)
  ]#

#TODO: we want a c# example for each, to put in unit testing. also, figure out later if we miss some crucial pieces in info.
# proc extractCsArgument(info:Info) : CsArgument
# proc extractCsExpressionStatement(info:Info) : CsExpressionStatement
# proc extractCsBinaryExpression(info:Info) : CsBinaryExpression
# proc extractCsParameter(info:Info) : CsParameter
# proc extractCsAssignmentExpression(info:Info) : CsAssignmentExpression
# proc extractCsEqualsValueClause(info:Info) : CsEqualsValueClause
# proc extractCsParameterList(info:Info) : CsParameterList
# proc extractCsLocalDeclarationStatement(info:Info) : CsLocalDeclarationStatement
# proc extractCsObjectCreationExpression(info:Info) : CsObjectCreationExpression
# proc extractCsReturnStatement(info:Info) : CsReturnStatement
# proc extractCsIfStatement(info:Info) : CsIfStatement
# proc extractCsAttribute(info:Info) : CsAttribute
# proc extractCsAttributeList(info:Info) : CsAttributeList
# proc extractCsThisExpression(info:Info) : CsThisExpression
# proc extractCsTypeArgumentList(info:Info) : CsTypeArgumentList
# proc extractCsGenericName(info:Info) : CsGenericName
# proc extractCsAttributeArgument(info:Info) : CsAttributeArgument
# proc extractCsAccessor(info:Info) : CsAccessor
# proc extractCsField(info:Info) : CsField
# proc extractCsBracketedArgumentList(info:Info) : CsBracketedArgumentList
# proc extractCsElementAccessExpression(info:Info) : CsElementAccessExpression
# proc extractCsProperty(info:Info) : CsProperty
# proc extractCsAccessorList(info:Info) : CsAccessorList
# proc extractCsAttributeArgumentList(info:Info) : CsAttributeArgumentList
# proc extractCsParenthesizedExpression(info:Info) : CsParenthesizedExpression
# proc extractCsCastExpression(info:Info) : CsCastExpression
# proc extractCsArrayRankSpecifier(info:Info) : CsArrayRankSpecifier
# proc extractCsArrayType(info:Info) : CsArrayType
# proc extractCsPrefixUnaryExpression(info:Info) : CsPrefixUnaryExpression
# proc extractCsOmittedArraySizeExpression(info:Info) : CsOmittedArraySizeExpression
# proc extractCsInitializerExpression(info:Info) : CsInitializerExpression
# proc extractCsNameEquals(info:Info) : CsNameEquals
# proc extractCsThrowStatement(info:Info) : CsThrowStatement
# proc extractCsTypeOfExpression(info:Info) : CsTypeOfExpression
# proc extractCsElseClause(info:Info) : CsElseClause
# proc extractCsCaseSwitchLabel(info:Info) : CsCaseSwitchLabel
# proc extractCsSimpleBaseType(info:Info) : CsSimpleBaseType
# proc extractCsConstructor(info:Info) : CsConstructor
# proc extractCsBaseList(info:Info) : CsBaseList
# proc extractCsSwitchSection(info:Info) : CsSwitchSection
# proc extractCsEnumMember(info:Info) : CsEnumMember
# proc extractCsSimpleLambdaExpression(info:Info) : CsSimpleLambdaExpression
# proc extractCsPostfixUnaryExpression(info:Info) : CsPostfixUnaryExpression
# proc extractCsArrayCreationExpression(info:Info) : CsArrayCreationExpression
# proc extractCsArrowExpressionClause(info:Info) : CsArrowExpressionClause
# proc extractCsBreakStatement(info:Info) : CsBreakStatement
# proc extractCsAliasQualifiedName(info:Info) : CsAliasQualifiedName
# proc extractCsTypeParameter(info:Info) : CsTypeParameter
# proc extractCsAwaitExpression(info:Info) : CsAwaitExpression
# proc extractCsConditionalExpression(info:Info) : CsConditionalExpression
# proc extractCsAttributeTargetSpecifier(info:Info) : CsAttributeTargetSpecifier
# proc extractCsTypeParameterList(info:Info) : CsTypeParameterList
# proc extractCsForEachStatement(info:Info) : CsForEachStatement
# proc extractCsForStatement(info:Info) : CsForStatement
# proc extractCsInterpolatedStringText(info:Info) : CsInterpolatedStringText
# proc extractCsParenthesizedLambdaExpression(info:Info) : CsParenthesizedLambdaExpression
# proc extractCsTryStatement(info:Info) : CsTryStatement
# proc extractCsNullableType(info:Info) : CsNullableType
# proc extractCsBaseExpression(info:Info) : CsBaseExpression
# proc extractCsCatchClause(info:Info) : CsCatchClause
# proc extractCsConstructorInitializer(info:Info) : CsConstructorInitializer
# proc extractCsInterpolation(info:Info) : CsInterpolation
# proc extractCsCatch(info:Info) : CsCatch
# proc extractCsNameColon(info:Info) : CsNameColon
# proc extractCsUsingStatement(info:Info) : CsUsingStatement
# proc extractCsTypeParameterConstraintClause(info:Info) : CsTypeParameterConstraintClause
# proc extractCsTypeConstraint(info:Info) : CsTypeConstraint
# proc extractCsSingleVariableDesignation(info:Info) : CsSingleVariableDesignation
# proc extractCsInterpolatedStringExpression(info:Info) : CsInterpolatedStringExpression
# proc extractCsImplicitArrayCreationExpression(info:Info) : CsImplicitArrayCreationExpression
# proc extractCsWhileStatement(info:Info) : CsWhileStatement
# proc extractCsDeclarationExpression(info:Info) : CsDeclarationExpression
# proc extractCsExplicitInterfaceSpecifier(info:Info) : CsExplicitInterfaceSpecifier
# proc extractCsConditionalAccessExpression(info:Info) : CsConditionalAccessExpression
# proc extractCsSwitchStatement(info:Info) : CsSwitchStatement
# proc extractCsMemberBindingExpression(info:Info) : CsMemberBindingExpression
# proc extractCsDefaultExpression(info:Info) : CsDefaultExpression
# proc extractCsPointerType(info:Info) : CsPointerType
# proc extractCsInterface(info:Info) : CsInterface
# proc extractCsContinueStatement(info:Info) : CsContinueStatement
# proc extractCsFinallyClause(info:Info) : CsFinallyClause
# proc extractCsEnum(info:Info) : CsEnum
# proc extractCsDefaultSwitchLabel(info:Info) : CsDefaultSwitchLabel
# proc extractCsYieldStatement(info:Info) : CsYieldStatement
# proc extractCsAnonymousObjectMemberDeclarator(info:Info) : CsAnonymousObjectMemberDeclarator
# proc extractCsCheckedExpression(info:Info) : CsCheckedExpression
# proc extractCsStruct(info:Info) : CsStruct
# proc extractCsIsPatternExpression(info:Info) : CsIsPatternExpression
# proc extractCsLockStatement(info:Info) : CsLockStatement
# proc extractCsDeclarationPattern(info:Info) : CsDeclarationPattern
# proc extractCsThrowExpression(info:Info) : CsThrowExpression
# proc extractCsConstantPattern(info:Info) : CsConstantPattern
# proc extractCsRefType(info:Info) : CsRefType
# proc extractCsRefExpression(info:Info) : CsRefExpression
# proc extractCsClassOrStructConstraint(info:Info) : CsClassOrStructConstraint
# proc extractCsOmittedTypeArgument(info:Info) : CsOmittedTypeArgument
# proc extractCsTupleElement(info:Info) : CsTupleElement
# proc extractCsOperator(info:Info) : CsOperator
# proc extractCsEventField(info:Info) : CsEventField
# proc extractCsDelegate(info:Info) : CsDelegate
# proc extractCsImplicitElementAccess(info:Info) : CsImplicitElementAccess
# proc extractCsAnonymousMethodExpression(info:Info) : CsAnonymousMethodExpression
# proc extractCsTupleExpression(info:Info) : CsTupleExpression
# proc extractCsAnonymousObjectCreationExpression(info:Info) : CsAnonymousObjectCreationExpression
# proc extractCsIndexer(info:Info) : CsIndexer
# proc extractCsBracketedParameterList(info:Info) : CsBracketedParameterList
# proc extractCsEvent(info:Info) : CsEvent
# proc extractCsGotoStatement(info:Info) : CsGotoStatement
# proc extractCsDoStatement(info:Info) : CsDoStatement
# proc extractCsGlobalStatement(info:Info) : CsGlobalStatement
# proc extractCsIncompleteMember(info:Info) : CsIncompleteMember
# proc extractCsLocalFunctionStatement(info:Info) : CsLocalFunctionStatement
# proc extractCsConversionOperator(info:Info) : CsConversionOperator
# proc extractCsTupleType(info:Info) : CsTupleType
# proc extractCsFixedStatement(info:Info) : CsFixedStatement
# proc extractCsEmptyStatement(info:Info) : CsEmptyStatement
# proc extractCsFromClause(info:Info) : CsFromClause
# proc extractCsSizeOfExpression(info:Info) : CsSizeOfExpression
# proc extractCsQueryBody(info:Info) : CsQueryBody
# proc extractCsCheckedStatement(info:Info) : CsCheckedStatement
# proc extractCsQueryExpression(info:Info) : CsQueryExpression
# proc extractCsSelectClause(info:Info) : CsSelectClause
# proc extractCsCasePatternSwitchLabel(info:Info) : CsCasePatternSwitchLabel
# proc extractCsLabeledStatement(info:Info) : CsLabeledStatement
# proc extractCsWhereClause(info:Info) : CsWhereClause
# proc extractCsConstructorConstraint(info:Info) : CsConstructorConstraint
# proc extractCsUnsafeStatement(info:Info) : CsUnsafeStatement
# proc extractCsParenthesizedVariableDesignation(info:Info) : CsParenthesizedVariableDesignation
# proc extractCsInterpolationFormatClause(info:Info) : CsInterpolationFormatClause
# proc extractCsDestructor(info:Info) : CsDestructor
# proc extractCsDiscardDesignation(info:Info) : CsDiscardDesignation
# proc extractCsStackAllocArrayCreationExpression(info:Info) : CsStackAllocArrayCreationExpression
# proc extractCsWhenClause(info:Info) : CsWhenClause
# proc extractCsForEachVariableStatement(info:Info) : CsForEachVariableStatement
# proc extractCsLetClause(info:Info) : CsLetClause
# proc extractCsElementBindingExpression(info:Info) : CsElementBindingExpression
# proc extractCsCatchFilterClause(info:Info) : CsCatchFilterClause
# proc extractCsOrdering(info:Info) : CsOrdering
# proc extractCsOrderByClause(info:Info) : CsOrderByClause
# proc extractCsJoinClause(info:Info) : CsJoinClause
# proc extractCsGroupClause(info:Info) : CsGroupClause
# proc extractCsInterpolationAlignmentClause(info:Info) : CsInterpolationAlignmentClause
# proc extractCsQueryContinuation(info:Info) : CsQueryContinuation
# proc extractCsExternAliasDirective(info:Info) : CsExternAliasDirective
# proc extractCsMakeRefExpression(info:Info) : CsMakeRefExpression
# proc extractCsJoinIntoClause(info:Info) : CsJoinIntoClause
# proc extractCsRefValueExpression(info:Info) : CsRefValueExpression
# proc extractCsRefTypeExpression(info:Info) : CsRefTypeExpression
#
#proc extractCsAccessor(info: Info): CsAccessor
#proc extractCsAccessorList(info: Info): CsAccessorList
#proc extractCsAliasQualifiedName(info: Info): CsAliasQualifiedName
#proc extractCsAnonymousMethodExpression(info: Info): CsAnonymousMethodExpression
#proc extractCsAnonymousObjectCreationExpression(  info: Info): CsAnonymousObjectCreationExpression
#proc extractCsAnonymousObjectMemberDeclarator(  info: Info): CsAnonymousObjectMemberDeclarator
#proc extractCsArgument(info: Info): CsArgument
#proc extractCsArrayCreationExpression(info: Info): CsArrayCreationExpression
#proc extractCsArrayRankSpecifier(info: Info): CsArrayRankSpecifier
#proc extractCsArrayType(info: Info): CsArrayType
#proc extractCsArrowExpressionClause(info: Info): CsArrowExpressionClause
#proc extractCsAssignmentExpression(info: Info): CsAssignmentExpression
#proc extractCsAttribute(info: Info): CsAttribute
#proc extractCsAttributeArgument(info: Info): CsAttributeArgument
#proc extractCsAttributeArgumentList(info: Info): CsAttributeArgumentList
#proc extractCsAttributeList(info: Info): CsAttributeList
#proc extractCsAttributeTargetSpecifier(info: Info): CsAttributeTargetSpecifier
#proc extractCsAwaitExpression(info: Info): CsAwaitExpression
#proc extractCsBaseExpression(info: Info): CsBaseExpression
#proc extractCsBaseList(info: Info): CsBaseList
#proc extractCsBinaryExpression(info: Info): CsBinaryExpression
#proc extractCsBracketedArgumentList(info: Info): CsBracketedArgumentList
#proc extractCsBracketedParameterList(info: Info): CsBracketedParameterList
#proc extractCsBreakStatement(info: Info): CsBreakStatement
#proc extractCsCasePatternSwitchLabel(info: Info): CsCasePatternSwitchLabel
#proc extractCsCaseSwitchLabel(info: Info): CsCaseSwitchLabel
#proc extractCsCastExpression(info: Info): CsCastExpression
#proc extractCsCatch(info: Info): CsCatch
#proc extractCsCatchClause(info: Info): CsCatchClause
#proc extractCsCatchFilterClause(info: Info): CsCatchFilterClause
#proc extractCsCheckedExpression(info: Info): CsCheckedExpression
#proc extractCsCheckedStatement(info: Info): CsCheckedStatement
#proc extractCsClassOrStructConstraint(info: Info): CsClassOrStructConstraint
#proc extractCsConditionalAccessExpression(  info: Info): CsConditionalAccessExpression
#proc extractCsConditionalExpression(info: Info): CsConditionalExpression
#proc extractCsConstantPattern(info: Info): CsConstantPattern
#proc extractCsConstructor(info: Info): CsConstructor
#proc extractCsConstructorConstraint(info: Info): CsConstructorConstraint
#proc extractCsConstructorInitializer(info: Info): CsConstructorInitializer
#proc extractCsContinueStatement(info: Info): CsContinueStatement
#proc extractCsConversionOperator(info: Info): CsConversionOperator
#proc extractCsDeclarationExpression(info: Info): CsDeclarationExpression
#proc extractCsDeclarationPattern(info: Info): CsDeclarationPattern
#proc extractCsDefaultExpression(info: Info): CsDefaultExpression
#proc extractCsDefaultSwitchLabel(info: Info): CsDefaultSwitchLabel
#proc extractCsDelegate(info: Info): CsDelegate
#proc extractCsDestructor(info: Info): CsDestructor
#proc extractCsDiscardDesignation(info: Info): CsDiscardDesignation
#proc extractCsDoStatement(info: Info): CsDoStatement
#proc extractCsElementAccessExpression(info: Info): CsElementAccessExpression
#proc extractCsElementBindingExpression(info: Info): CsElementBindingExpression
#proc extractCsElseClause(info: Info): CsElseClause
#proc extractCsEmptyStatement(info: Info): CsEmptyStatement
#proc extractCsEnum(info: Info): CsEnum
#proc extractCsEnumMember(info: Info): CsEnumMember
#proc extractCsEqualsValueClause(info: Info): CsEqualsValueClause
#proc extractCsEvent(info: Info): CsEvent
#proc extractCsEventField(info: Info): CsEventField
#proc extractCsExplicitInterfaceSpecifier(  info: Info): CsExplicitInterfaceSpecifier
#proc extractCsExpressionStatement(info: Info): CsExpressionStatement
#proc extractCsExternAliasDirective(info: Info): CsExternAliasDirective
#proc extractCsField(info: Info): CsField
#proc extractCsFinallyClause(info: Info): CsFinallyClause
#proc extractCsFixedStatement(info: Info): CsFixedStatement
#proc extractCsForEachStatement(info: Info): CsForEachStatement
#proc extractCsForEachVariableStatement(info: Info): CsForEachVariableStatement
#proc extractCsForStatement(info: Info): CsForStatement
#proc extractCsFromClause(info: Info): CsFromClause
#proc extractCsGenericName(info: Info): CsGenericName
#proc extractCsGlobalStatement(info: Info): CsGlobalStatement
#proc extractCsGotoStatement(info: Info): CsGotoStatement
#proc extractCsGroupClause(info: Info): CsGroupClause
#proc extractCsIfStatement(info: Info): CsIfStatement
#proc extractCsImplicitArrayCreationExpression(  info: Info): CsImplicitArrayCreationExpression
#proc extractCsImplicitElementAccess(info: Info): CsImplicitElementAccess
#proc extractCsIncompleteMember(info: Info): CsIncompleteMember
#proc extractCsIndexer(info: Info): CsIndexer
#proc extractCsInitializerExpression(info: Info): CsInitializerExpression
#proc extractCsInterface(info: Info): CsInterface
#proc extractCsInterpolatedStringExpression(  info: Info): CsInterpolatedStringExpression
#proc extractCsInterpolatedStringText(info: Info): CsInterpolatedStringText
#proc extractCsInterpolation(info: Info): CsInterpolation
#proc extractCsInterpolationAlignmentClause(  info: Info): CsInterpolationAlignmentClause
#proc extractCsInterpolationFormatClause(info: Info): CsInterpolationFormatClause
#proc extractCsIsPatternExpression(info: Info): CsIsPatternExpression
#proc extractCsJoinClause(info: Info): CsJoinClause
#proc extractCsJoinIntoClause(info: Info): CsJoinIntoClause
#proc extractCsLabeledStatement(info: Info): CsLabeledStatement
#proc extractCsLetClause(info: Info): CsLetClause
#proc extractCsLocalDeclarationStatement(info: Info): CsLocalDeclarationStatement
#proc extractCsLocalFunctionStatement(info: Info): CsLocalFunctionStatement
#proc extractCsLockStatement(info: Info): CsLockStatement
#proc extractCsMakeRefExpression(info: Info): CsMakeRefExpression
#proc extractCsMemberBindingExpression(info: Info): CsMemberBindingExpression
#proc extractCsNameColon(info: Info): CsNameColon
#proc extractCsNameEquals(info: Info): CsNameEquals
#proc extractCsNullableType(info: Info): CsNullableType
#proc extractCsObjectCreationExpression(info: Info): CsObjectCreationExpression
#proc extractCsOmittedArraySizeExpression(  info: Info): CsOmittedArraySizeExpression
#proc extractCsOmittedTypeArgument(info: Info): CsOmittedTypeArgument
#proc extractCsOperator(info: Info): CsOperator
#proc extractCsOrderByClause(info: Info): CsOrderByClause
#proc extractCsOrdering(info: Info): CsOrdering
#proc extractCsParameter(info: Info): CsParameter
#proc extractCsParameterList(info: Info): CsParameterList
#proc extractCsParenthesizedExpression(info: Info): CsParenthesizedExpression
#proc extractCsParenthesizedLambdaExpression(  info: Info): CsParenthesizedLambdaExpression
#proc extractCsParenthesizedVariableDesignation(  info: Info): CsParenthesizedVariableDesignation
#proc extractCsPointerType(info: Info): CsPointerType
#proc extractCsPostfixUnaryExpression(info: Info): CsPostfixUnaryExpression
#proc extractCsPrefixUnaryExpression(info: Info): CsPrefixUnaryExpression
#proc extractCsProperty(info: Info): CsProperty
#proc extractCsQueryBody(info: Info): CsQueryBody
#proc extractCsQueryContinuation(info: Info): CsQueryContinuation
#proc extractCsQueryExpression(info: Info): CsQueryExpression
#proc extractCsRefExpression(info: Info): CsRefExpression
#proc extractCsRefType(info: Info): CsRefType
#proc extractCsRefTypeExpression(info: Info): CsRefTypeExpression
#proc extractCsRefValueExpression(info: Info): CsRefValueExpression
#proc extractCsReturnStatement(info: Info): CsReturnStatement
#proc extractCsSelectClause(info: Info): CsSelectClause
#proc extractCsSimpleBaseType(info: Info): CsSimpleBaseType
#proc extractCsSimpleLambdaExpression(info: Info): CsSimpleLambdaExpression
#proc extractCsSingleVariableDesignation(info: Info): CsSingleVariableDesignation
#proc extractCsSizeOfExpression(info: Info): CsSizeOfExpression
#proc extractCsStackAllocArrayCreationExpression(  info: Info): CsStackAllocArrayCreationExpression
#proc extractCsStruct(info: Info): CsStruct
#proc extractCsSwitchSection(info: Info): CsSwitchSection
#proc extractCsSwitchStatement(info: Info): CsSwitchStatement
#proc extractCsThisExpression(info: Info): CsThisExpression
#proc extractCsThrowExpression(info: Info): CsThrowExpression
#proc extractCsThrowStatement(info: Info): CsThrowStatement
#proc extractCsTryStatement(info: Info): CsTryStatement
#proc extractCsTupleElement(info: Info): CsTupleElement
#proc extractCsTupleExpression(info: Info): CsTupleExpression
#proc extractCsTupleType(info: Info): CsTupleType
#proc extractCsTypeArgumentList(info: Info): CsTypeArgumentList
#proc extractCsTypeConstraint(info: Info): CsTypeConstraint
#proc extractCsTypeOfExpression(info: Info): CsTypeOfExpression
#proc extractCsTypeParameter(info: Info): CsTypeParameter
#proc extractCsTypeParameterConstraintClause(  info: Info): CsTypeParameterConstraintClause
#proc extractCsTypeParameterList(info: Info): CsTypeParameterList
#proc extractCsUnsafeStatement(info: Info): CsUnsafeStatement
#proc extractCsUsingStatement(info: Info): CsUsingStatement
#proc extractCsWhenClause(info: Info): CsWhenClause
#proc extractCsWhereClause(info: Info): CsWhereClause
#proc extractCsWhileStatement(info: Info): CsWhileStatement
#proc extractCsYieldStatement(info: Info): CsYieldStatement
