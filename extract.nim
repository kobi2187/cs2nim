# extract.nim

import types, state, create
import tables

func extractCsNamespace*(info: Info): CsNamespace =
  newCsNamespace(info.essentials[0])


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
# proc newCsArgument(XXX): CsArgument
# proc add(a:XXX; b:CsArgument)
# proc extractCsExpressionStatement(info:Info) : CsExpressionStatement
# proc newCsExpressionStatement(XXX): CsExpressionStatement
# proc add(a:XXX; b:CsExpressionStatement)
# proc extractCsBinaryExpression(info:Info) : CsBinaryExpression
# proc newCsBinaryExpression(XXX): CsBinaryExpression
# proc add(a:XXX; b:CsBinaryExpression)
# proc extractCsParameter(info:Info) : CsParameter
# proc newCsParameter(XXX): CsParameter
# proc add(a:XXX; b:CsParameter)
# proc extractCsAssignmentExpression(info:Info) : CsAssignmentExpression
# proc newCsAssignmentExpression(XXX): CsAssignmentExpression
# proc add(a:XXX; b:CsAssignmentExpression)
# proc extractCsEqualsValueClause(info:Info) : CsEqualsValueClause
# proc newCsEqualsValueClause(XXX): CsEqualsValueClause
# proc add(a:XXX; b:CsEqualsValueClause)
# proc extractCsParameterList(info:Info) : CsParameterList
# proc newCsParameterList(XXX): CsParameterList
# proc add(a:XXX; b:CsParameterList)
# proc extractCsLocalDeclarationStatement(info:Info) : CsLocalDeclarationStatement
# proc newCsLocalDeclarationStatement(XXX): CsLocalDeclarationStatement
# proc add(a:XXX; b:CsLocalDeclarationStatement)
# proc extractCsObjectCreationExpression(info:Info) : CsObjectCreationExpression
# proc newCsObjectCreationExpression(XXX): CsObjectCreationExpression
# proc add(a:XXX; b:CsObjectCreationExpression)
# proc extractCsReturnStatement(info:Info) : CsReturnStatement
# proc newCsReturnStatement(XXX): CsReturnStatement
# proc add(a:XXX; b:CsReturnStatement)
# proc extractCsIfStatement(info:Info) : CsIfStatement
# proc newCsIfStatement(XXX): CsIfStatement
# proc add(a:XXX; b:CsIfStatement)
# proc extractCsAttribute(info:Info) : CsAttribute
# proc newCsAttribute(XXX): CsAttribute
# proc add(a:XXX; b:CsAttribute)
# proc extractCsAttributeList(info:Info) : CsAttributeList
# proc newCsAttributeList(XXX): CsAttributeList
# proc add(a:XXX; b:CsAttributeList)
# proc extractCsThisExpression(info:Info) : CsThisExpression
# proc newCsThisExpression(XXX): CsThisExpression
# proc add(a:XXX; b:CsThisExpression)
# proc extractCsTypeArgumentList(info:Info) : CsTypeArgumentList
# proc newCsTypeArgumentList(XXX): CsTypeArgumentList
# proc add(a:XXX; b:CsTypeArgumentList)
# proc extractCsGenericName(info:Info) : CsGenericName
# proc newCsGenericName(XXX): CsGenericName
# proc add(a:XXX; b:CsGenericName)
# proc extractCsAttributeArgument(info:Info) : CsAttributeArgument
# proc newCsAttributeArgument(XXX): CsAttributeArgument
# proc add(a:XXX; b:CsAttributeArgument)
# proc extractCsAccessor(info:Info) : CsAccessor
# proc newCsAccessor(XXX): CsAccessor
# proc add(a:XXX; b:CsAccessor)
# proc extractCsField(info:Info) : CsField
# proc newCsField(XXX): CsField
# proc add(a:XXX; b:CsField)
# proc extractCsBracketedArgumentList(info:Info) : CsBracketedArgumentList
# proc newCsBracketedArgumentList(XXX): CsBracketedArgumentList
# proc add(a:XXX; b:CsBracketedArgumentList)
# proc extractCsElementAccessExpression(info:Info) : CsElementAccessExpression
# proc newCsElementAccessExpression(XXX): CsElementAccessExpression
# proc add(a:XXX; b:CsElementAccessExpression)
# proc extractCsProperty(info:Info) : CsProperty
# proc newCsProperty(XXX): CsProperty
# proc add(a:XXX; b:CsProperty)
# proc extractCsAccessorList(info:Info) : CsAccessorList
# proc newCsAccessorList(XXX): CsAccessorList
# proc add(a:XXX; b:CsAccessorList)
# proc extractCsAttributeArgumentList(info:Info) : CsAttributeArgumentList
# proc newCsAttributeArgumentList(XXX): CsAttributeArgumentList
# proc add(a:XXX; b:CsAttributeArgumentList)
# proc extractCsParenthesizedExpression(info:Info) : CsParenthesizedExpression
# proc newCsParenthesizedExpression(XXX): CsParenthesizedExpression
# proc add(a:XXX; b:CsParenthesizedExpression)
# proc extractCsCastExpression(info:Info) : CsCastExpression
# proc newCsCastExpression(XXX): CsCastExpression
# proc add(a:XXX; b:CsCastExpression)
# proc extractCsArrayRankSpecifier(info:Info) : CsArrayRankSpecifier
# proc newCsArrayRankSpecifier(XXX): CsArrayRankSpecifier
# proc add(a:XXX; b:CsArrayRankSpecifier)
# proc extractCsArrayType(info:Info) : CsArrayType
# proc newCsArrayType(XXX): CsArrayType
# proc add(a:XXX; b:CsArrayType)
# proc extractCsPrefixUnaryExpression(info:Info) : CsPrefixUnaryExpression
# proc newCsPrefixUnaryExpression(XXX): CsPrefixUnaryExpression
# proc add(a:XXX; b:CsPrefixUnaryExpression)
# proc extractCsOmittedArraySizeExpression(info:Info) : CsOmittedArraySizeExpression
# proc newCsOmittedArraySizeExpression(XXX): CsOmittedArraySizeExpression
# proc add(a:XXX; b:CsOmittedArraySizeExpression)
# proc extractCsInitializerExpression(info:Info) : CsInitializerExpression
# proc newCsInitializerExpression(XXX): CsInitializerExpression
# proc add(a:XXX; b:CsInitializerExpression)
# proc extractCsNameEquals(info:Info) : CsNameEquals
# proc newCsNameEquals(XXX): CsNameEquals
# proc add(a:XXX; b:CsNameEquals)
# proc extractCsThrowStatement(info:Info) : CsThrowStatement
# proc newCsThrowStatement(XXX): CsThrowStatement
# proc add(a:XXX; b:CsThrowStatement)
# proc extractCsTypeOfExpression(info:Info) : CsTypeOfExpression
# proc newCsTypeOfExpression(XXX): CsTypeOfExpression
# proc add(a:XXX; b:CsTypeOfExpression)
# proc extractCsElseClause(info:Info) : CsElseClause
# proc newCsElseClause(XXX): CsElseClause
# proc add(a:XXX; b:CsElseClause)
# proc extractCsCaseSwitchLabel(info:Info) : CsCaseSwitchLabel
# proc newCsCaseSwitchLabel(XXX): CsCaseSwitchLabel
# proc add(a:XXX; b:CsCaseSwitchLabel)
# proc extractCsSimpleBaseType(info:Info) : CsSimpleBaseType
# proc newCsSimpleBaseType(XXX): CsSimpleBaseType
# proc add(a:XXX; b:CsSimpleBaseType)
# proc extractCsConstructor(info:Info) : CsConstructor
# proc newCsConstructor(XXX): CsConstructor
# proc add(a:XXX; b:CsConstructor)
# proc extractCsBaseList(info:Info) : CsBaseList
# proc newCsBaseList(XXX): CsBaseList
# proc add(a:XXX; b:CsBaseList)
# proc extractCsSwitchSection(info:Info) : CsSwitchSection
# proc newCsSwitchSection(XXX): CsSwitchSection
# proc add(a:XXX; b:CsSwitchSection)
# proc extractCsEnumMember(info:Info) : CsEnumMember
# proc newCsEnumMember(XXX): CsEnumMember
# proc add(a:XXX; b:CsEnumMember)
# proc extractCsSimpleLambdaExpression(info:Info) : CsSimpleLambdaExpression
# proc newCsSimpleLambdaExpression(XXX): CsSimpleLambdaExpression
# proc add(a:XXX; b:CsSimpleLambdaExpression)
# proc extractCsPostfixUnaryExpression(info:Info) : CsPostfixUnaryExpression
# proc newCsPostfixUnaryExpression(XXX): CsPostfixUnaryExpression
# proc add(a:XXX; b:CsPostfixUnaryExpression)
# proc extractCsArrayCreationExpression(info:Info) : CsArrayCreationExpression
# proc newCsArrayCreationExpression(XXX): CsArrayCreationExpression
# proc add(a:XXX; b:CsArrayCreationExpression)
# proc extractCsArrowExpressionClause(info:Info) : CsArrowExpressionClause
# proc newCsArrowExpressionClause(XXX): CsArrowExpressionClause
# proc add(a:XXX; b:CsArrowExpressionClause)
# proc extractCsBreakStatement(info:Info) : CsBreakStatement
# proc newCsBreakStatement(XXX): CsBreakStatement
# proc add(a:XXX; b:CsBreakStatement)
# proc extractCsAliasQualifiedName(info:Info) : CsAliasQualifiedName
# proc newCsAliasQualifiedName(XXX): CsAliasQualifiedName
# proc add(a:XXX; b:CsAliasQualifiedName)
# proc extractCsTypeParameter(info:Info) : CsTypeParameter
# proc newCsTypeParameter(XXX): CsTypeParameter
# proc add(a:XXX; b:CsTypeParameter)
# proc extractCsAwaitExpression(info:Info) : CsAwaitExpression
# proc newCsAwaitExpression(XXX): CsAwaitExpression
# proc add(a:XXX; b:CsAwaitExpression)
# proc extractCsConditionalExpression(info:Info) : CsConditionalExpression
# proc newCsConditionalExpression(XXX): CsConditionalExpression
# proc add(a:XXX; b:CsConditionalExpression)
# proc extractCsAttributeTargetSpecifier(info:Info) : CsAttributeTargetSpecifier
# proc newCsAttributeTargetSpecifier(XXX): CsAttributeTargetSpecifier
# proc add(a:XXX; b:CsAttributeTargetSpecifier)
# proc extractCsTypeParameterList(info:Info) : CsTypeParameterList
# proc newCsTypeParameterList(XXX): CsTypeParameterList
# proc add(a:XXX; b:CsTypeParameterList)
# proc extractCsForEachStatement(info:Info) : CsForEachStatement
# proc newCsForEachStatement(XXX): CsForEachStatement
# proc add(a:XXX; b:CsForEachStatement)
# proc extractCsForStatement(info:Info) : CsForStatement
# proc newCsForStatement(XXX): CsForStatement
# proc add(a:XXX; b:CsForStatement)
# proc extractCsInterpolatedStringText(info:Info) : CsInterpolatedStringText
# proc newCsInterpolatedStringText(XXX): CsInterpolatedStringText
# proc add(a:XXX; b:CsInterpolatedStringText)
# proc extractCsParenthesizedLambdaExpression(info:Info) : CsParenthesizedLambdaExpression
# proc newCsParenthesizedLambdaExpression(XXX): CsParenthesizedLambdaExpression
# proc add(a:XXX; b:CsParenthesizedLambdaExpression)
# proc extractCsTryStatement(info:Info) : CsTryStatement
# proc newCsTryStatement(XXX): CsTryStatement
# proc add(a:XXX; b:CsTryStatement)
# proc extractCsNullableType(info:Info) : CsNullableType
# proc newCsNullableType(XXX): CsNullableType
# proc add(a:XXX; b:CsNullableType)
# proc extractCsBaseExpression(info:Info) : CsBaseExpression
# proc newCsBaseExpression(XXX): CsBaseExpression
# proc add(a:XXX; b:CsBaseExpression)
# proc extractCsCatchClause(info:Info) : CsCatchClause
# proc newCsCatchClause(XXX): CsCatchClause
# proc add(a:XXX; b:CsCatchClause)
# proc extractCsConstructorInitializer(info:Info) : CsConstructorInitializer
# proc newCsConstructorInitializer(XXX): CsConstructorInitializer
# proc add(a:XXX; b:CsConstructorInitializer)
# proc extractCsInterpolation(info:Info) : CsInterpolation
# proc newCsInterpolation(XXX): CsInterpolation
# proc add(a:XXX; b:CsInterpolation)
# proc extractCsCatch(info:Info) : CsCatch
# proc newCsCatch(XXX): CsCatch
# proc add(a:XXX; b:CsCatch)
# proc extractCsNameColon(info:Info) : CsNameColon
# proc newCsNameColon(XXX): CsNameColon
# proc add(a:XXX; b:CsNameColon)
# proc extractCsUsingStatement(info:Info) : CsUsingStatement
# proc newCsUsingStatement(XXX): CsUsingStatement
# proc add(a:XXX; b:CsUsingStatement)
# proc extractCsTypeParameterConstraintClause(info:Info) : CsTypeParameterConstraintClause
# proc newCsTypeParameterConstraintClause(XXX): CsTypeParameterConstraintClause
# proc add(a:XXX; b:CsTypeParameterConstraintClause)
# proc extractCsTypeConstraint(info:Info) : CsTypeConstraint
# proc newCsTypeConstraint(XXX): CsTypeConstraint
# proc add(a:XXX; b:CsTypeConstraint)
# proc extractCsSingleVariableDesignation(info:Info) : CsSingleVariableDesignation
# proc newCsSingleVariableDesignation(XXX): CsSingleVariableDesignation
# proc add(a:XXX; b:CsSingleVariableDesignation)
# proc extractCsInterpolatedStringExpression(info:Info) : CsInterpolatedStringExpression
# proc newCsInterpolatedStringExpression(XXX): CsInterpolatedStringExpression
# proc add(a:XXX; b:CsInterpolatedStringExpression)
# proc extractCsImplicitArrayCreationExpression(info:Info) : CsImplicitArrayCreationExpression
# proc newCsImplicitArrayCreationExpression(XXX): CsImplicitArrayCreationExpression
# proc add(a:XXX; b:CsImplicitArrayCreationExpression)
# proc extractCsWhileStatement(info:Info) : CsWhileStatement
# proc newCsWhileStatement(XXX): CsWhileStatement
# proc add(a:XXX; b:CsWhileStatement)
# proc extractCsDeclarationExpression(info:Info) : CsDeclarationExpression
# proc newCsDeclarationExpression(XXX): CsDeclarationExpression
# proc add(a:XXX; b:CsDeclarationExpression)
# proc extractCsExplicitInterfaceSpecifier(info:Info) : CsExplicitInterfaceSpecifier
# proc newCsExplicitInterfaceSpecifier(XXX): CsExplicitInterfaceSpecifier
# proc add(a:XXX; b:CsExplicitInterfaceSpecifier)
# proc extractCsConditionalAccessExpression(info:Info) : CsConditionalAccessExpression
# proc newCsConditionalAccessExpression(XXX): CsConditionalAccessExpression
# proc add(a:XXX; b:CsConditionalAccessExpression)
# proc extractCsSwitchStatement(info:Info) : CsSwitchStatement
# proc newCsSwitchStatement(XXX): CsSwitchStatement
# proc add(a:XXX; b:CsSwitchStatement)
# proc extractCsMemberBindingExpression(info:Info) : CsMemberBindingExpression
# proc newCsMemberBindingExpression(XXX): CsMemberBindingExpression
# proc add(a:XXX; b:CsMemberBindingExpression)
# proc extractCsDefaultExpression(info:Info) : CsDefaultExpression
# proc newCsDefaultExpression(XXX): CsDefaultExpression
# proc add(a:XXX; b:CsDefaultExpression)
# proc extractCsPointerType(info:Info) : CsPointerType
# proc newCsPointerType(XXX): CsPointerType
# proc add(a:XXX; b:CsPointerType)
# proc extractCsInterface(info:Info) : CsInterface
# proc newCsInterface(XXX): CsInterface
# proc add(a:XXX; b:CsInterface)
# proc extractCsContinueStatement(info:Info) : CsContinueStatement
# proc newCsContinueStatement(XXX): CsContinueStatement
# proc add(a:XXX; b:CsContinueStatement)
# proc extractCsFinallyClause(info:Info) : CsFinallyClause
# proc newCsFinallyClause(XXX): CsFinallyClause
# proc add(a:XXX; b:CsFinallyClause)
# proc extractCsEnum(info:Info) : CsEnum
# proc newCsEnum(XXX): CsEnum
# proc add(a:XXX; b:CsEnum)
# proc extractCsDefaultSwitchLabel(info:Info) : CsDefaultSwitchLabel
# proc newCsDefaultSwitchLabel(XXX): CsDefaultSwitchLabel
# proc add(a:XXX; b:CsDefaultSwitchLabel)
# proc extractCsYieldStatement(info:Info) : CsYieldStatement
# proc newCsYieldStatement(XXX): CsYieldStatement
# proc add(a:XXX; b:CsYieldStatement)
# proc extractCsAnonymousObjectMemberDeclarator(info:Info) : CsAnonymousObjectMemberDeclarator
# proc newCsAnonymousObjectMemberDeclarator(XXX): CsAnonymousObjectMemberDeclarator
# proc add(a:XXX; b:CsAnonymousObjectMemberDeclarator)
# proc extractCsCheckedExpression(info:Info) : CsCheckedExpression
# proc newCsCheckedExpression(XXX): CsCheckedExpression
# proc add(a:XXX; b:CsCheckedExpression)
# proc extractCsStruct(info:Info) : CsStruct
# proc newCsStruct(XXX): CsStruct
# proc add(a:XXX; b:CsStruct)
# proc extractCsIsPatternExpression(info:Info) : CsIsPatternExpression
# proc newCsIsPatternExpression(XXX): CsIsPatternExpression
# proc add(a:XXX; b:CsIsPatternExpression)
# proc extractCsLockStatement(info:Info) : CsLockStatement
# proc newCsLockStatement(XXX): CsLockStatement
# proc add(a:XXX; b:CsLockStatement)
# proc extractCsDeclarationPattern(info:Info) : CsDeclarationPattern
# proc newCsDeclarationPattern(XXX): CsDeclarationPattern
# proc add(a:XXX; b:CsDeclarationPattern)
# proc extractCsThrowExpression(info:Info) : CsThrowExpression
# proc newCsThrowExpression(XXX): CsThrowExpression
# proc add(a:XXX; b:CsThrowExpression)
# proc extractCsConstantPattern(info:Info) : CsConstantPattern
# proc newCsConstantPattern(XXX): CsConstantPattern
# proc add(a:XXX; b:CsConstantPattern)
# proc extractCsRefType(info:Info) : CsRefType
# proc newCsRefType(XXX): CsRefType
# proc add(a:XXX; b:CsRefType)
# proc extractCsRefExpression(info:Info) : CsRefExpression
# proc newCsRefExpression(XXX): CsRefExpression
# proc add(a:XXX; b:CsRefExpression)
# proc extractCsClassOrStructConstraint(info:Info) : CsClassOrStructConstraint
# proc newCsClassOrStructConstraint(XXX): CsClassOrStructConstraint
# proc add(a:XXX; b:CsClassOrStructConstraint)
# proc extractCsOmittedTypeArgument(info:Info) : CsOmittedTypeArgument
# proc newCsOmittedTypeArgument(XXX): CsOmittedTypeArgument
# proc add(a:XXX; b:CsOmittedTypeArgument)
# proc extractCsTupleElement(info:Info) : CsTupleElement
# proc newCsTupleElement(XXX): CsTupleElement
# proc add(a:XXX; b:CsTupleElement)
# proc extractCsOperator(info:Info) : CsOperator
# proc newCsOperator(XXX): CsOperator
# proc add(a:XXX; b:CsOperator)
# proc extractCsEventField(info:Info) : CsEventField
# proc newCsEventField(XXX): CsEventField
# proc add(a:XXX; b:CsEventField)
# proc extractCsDelegate(info:Info) : CsDelegate
# proc newCsDelegate(XXX): CsDelegate
# proc add(a:XXX; b:CsDelegate)
# proc extractCsImplicitElementAccess(info:Info) : CsImplicitElementAccess
# proc newCsImplicitElementAccess(XXX): CsImplicitElementAccess
# proc add(a:XXX; b:CsImplicitElementAccess)
# proc extractCsAnonymousMethodExpression(info:Info) : CsAnonymousMethodExpression
# proc newCsAnonymousMethodExpression(XXX): CsAnonymousMethodExpression
# proc add(a:XXX; b:CsAnonymousMethodExpression)
# proc extractCsTupleExpression(info:Info) : CsTupleExpression
# proc newCsTupleExpression(XXX): CsTupleExpression
# proc add(a:XXX; b:CsTupleExpression)
# proc extractCsAnonymousObjectCreationExpression(info:Info) : CsAnonymousObjectCreationExpression
# proc newCsAnonymousObjectCreationExpression(XXX): CsAnonymousObjectCreationExpression
# proc add(a:XXX; b:CsAnonymousObjectCreationExpression)
# proc extractCsIndexer(info:Info) : CsIndexer
# proc newCsIndexer(XXX): CsIndexer
# proc add(a:XXX; b:CsIndexer)
# proc extractCsBracketedParameterList(info:Info) : CsBracketedParameterList
# proc newCsBracketedParameterList(XXX): CsBracketedParameterList
# proc add(a:XXX; b:CsBracketedParameterList)
# proc extractCsEvent(info:Info) : CsEvent
# proc newCsEvent(XXX): CsEvent
# proc add(a:XXX; b:CsEvent)
# proc extractCsGotoStatement(info:Info) : CsGotoStatement
# proc newCsGotoStatement(XXX): CsGotoStatement
# proc add(a:XXX; b:CsGotoStatement)
# proc extractCsDoStatement(info:Info) : CsDoStatement
# proc newCsDoStatement(XXX): CsDoStatement
# proc add(a:XXX; b:CsDoStatement)
# proc extractCsGlobalStatement(info:Info) : CsGlobalStatement
# proc newCsGlobalStatement(XXX): CsGlobalStatement
# proc add(a:XXX; b:CsGlobalStatement)
# proc extractCsIncompleteMember(info:Info) : CsIncompleteMember
# proc newCsIncompleteMember(XXX): CsIncompleteMember
# proc add(a:XXX; b:CsIncompleteMember)
# proc extractCsLocalFunctionStatement(info:Info) : CsLocalFunctionStatement
# proc newCsLocalFunctionStatement(XXX): CsLocalFunctionStatement
# proc add(a:XXX; b:CsLocalFunctionStatement)
# proc extractCsConversionOperator(info:Info) : CsConversionOperator
# proc newCsConversionOperator(XXX): CsConversionOperator
# proc add(a:XXX; b:CsConversionOperator)
# proc extractCsTupleType(info:Info) : CsTupleType
# proc newCsTupleType(XXX): CsTupleType
# proc add(a:XXX; b:CsTupleType)
# proc extractCsFixedStatement(info:Info) : CsFixedStatement
# proc newCsFixedStatement(XXX): CsFixedStatement
# proc add(a:XXX; b:CsFixedStatement)
# proc extractCsEmptyStatement(info:Info) : CsEmptyStatement
# proc newCsEmptyStatement(XXX): CsEmptyStatement
# proc add(a:XXX; b:CsEmptyStatement)
# proc extractCsFromClause(info:Info) : CsFromClause
# proc newCsFromClause(XXX): CsFromClause
# proc add(a:XXX; b:CsFromClause)
# proc extractCsSizeOfExpression(info:Info) : CsSizeOfExpression
# proc newCsSizeOfExpression(XXX): CsSizeOfExpression
# proc add(a:XXX; b:CsSizeOfExpression)
# proc extractCsQueryBody(info:Info) : CsQueryBody
# proc newCsQueryBody(XXX): CsQueryBody
# proc add(a:XXX; b:CsQueryBody)
# proc extractCsCheckedStatement(info:Info) : CsCheckedStatement
# proc newCsCheckedStatement(XXX): CsCheckedStatement
# proc add(a:XXX; b:CsCheckedStatement)
# proc extractCsQueryExpression(info:Info) : CsQueryExpression
# proc newCsQueryExpression(XXX): CsQueryExpression
# proc add(a:XXX; b:CsQueryExpression)
# proc extractCsSelectClause(info:Info) : CsSelectClause
# proc newCsSelectClause(XXX): CsSelectClause
# proc add(a:XXX; b:CsSelectClause)
# proc extractCsCasePatternSwitchLabel(info:Info) : CsCasePatternSwitchLabel
# proc newCsCasePatternSwitchLabel(XXX): CsCasePatternSwitchLabel
# proc add(a:XXX; b:CsCasePatternSwitchLabel)
# proc extractCsLabeledStatement(info:Info) : CsLabeledStatement
# proc newCsLabeledStatement(XXX): CsLabeledStatement
# proc add(a:XXX; b:CsLabeledStatement)
# proc extractCsWhereClause(info:Info) : CsWhereClause
# proc newCsWhereClause(XXX): CsWhereClause
# proc add(a:XXX; b:CsWhereClause)
# proc extractCsConstructorConstraint(info:Info) : CsConstructorConstraint
# proc newCsConstructorConstraint(XXX): CsConstructorConstraint
# proc add(a:XXX; b:CsConstructorConstraint)
# proc extractCsUnsafeStatement(info:Info) : CsUnsafeStatement
# proc newCsUnsafeStatement(XXX): CsUnsafeStatement
# proc add(a:XXX; b:CsUnsafeStatement)
# proc extractCsParenthesizedVariableDesignation(info:Info) : CsParenthesizedVariableDesignation
# proc newCsParenthesizedVariableDesignation(XXX): CsParenthesizedVariableDesignation
# proc add(a:XXX; b:CsParenthesizedVariableDesignation)
# proc extractCsInterpolationFormatClause(info:Info) : CsInterpolationFormatClause
# proc newCsInterpolationFormatClause(XXX): CsInterpolationFormatClause
# proc add(a:XXX; b:CsInterpolationFormatClause)
# proc extractCsDestructor(info:Info) : CsDestructor
# proc newCsDestructor(XXX): CsDestructor
# proc add(a:XXX; b:CsDestructor)
# proc extractCsDiscardDesignation(info:Info) : CsDiscardDesignation
# proc newCsDiscardDesignation(XXX): CsDiscardDesignation
# proc add(a:XXX; b:CsDiscardDesignation)
# proc extractCsStackAllocArrayCreationExpression(info:Info) : CsStackAllocArrayCreationExpression
# proc newCsStackAllocArrayCreationExpression(XXX): CsStackAllocArrayCreationExpression
# proc add(a:XXX; b:CsStackAllocArrayCreationExpression)
# proc extractCsWhenClause(info:Info) : CsWhenClause
# proc newCsWhenClause(XXX): CsWhenClause
# proc add(a:XXX; b:CsWhenClause)
# proc extractCsForEachVariableStatement(info:Info) : CsForEachVariableStatement
# proc newCsForEachVariableStatement(XXX): CsForEachVariableStatement
# proc add(a:XXX; b:CsForEachVariableStatement)
# proc extractCsLetClause(info:Info) : CsLetClause
# proc newCsLetClause(XXX): CsLetClause
# proc add(a:XXX; b:CsLetClause)
# proc extractCsElementBindingExpression(info:Info) : CsElementBindingExpression
# proc newCsElementBindingExpression(XXX): CsElementBindingExpression
# proc add(a:XXX; b:CsElementBindingExpression)
# proc extractCsCatchFilterClause(info:Info) : CsCatchFilterClause
# proc newCsCatchFilterClause(XXX): CsCatchFilterClause
# proc add(a:XXX; b:CsCatchFilterClause)
# proc extractCsOrdering(info:Info) : CsOrdering
# proc newCsOrdering(XXX): CsOrdering
# proc add(a:XXX; b:CsOrdering)
# proc extractCsOrderByClause(info:Info) : CsOrderByClause
# proc newCsOrderByClause(XXX): CsOrderByClause
# proc add(a:XXX; b:CsOrderByClause)
# proc extractCsJoinClause(info:Info) : CsJoinClause
# proc newCsJoinClause(XXX): CsJoinClause
# proc add(a:XXX; b:CsJoinClause)
# proc extractCsGroupClause(info:Info) : CsGroupClause
# proc newCsGroupClause(XXX): CsGroupClause
# proc add(a:XXX; b:CsGroupClause)
# proc extractCsInterpolationAlignmentClause(info:Info) : CsInterpolationAlignmentClause
# proc newCsInterpolationAlignmentClause(XXX): CsInterpolationAlignmentClause
# proc add(a:XXX; b:CsInterpolationAlignmentClause)
# proc extractCsQueryContinuation(info:Info) : CsQueryContinuation
# proc newCsQueryContinuation(XXX): CsQueryContinuation
# proc add(a:XXX; b:CsQueryContinuation)
# proc extractCsExternAliasDirective(info:Info) : CsExternAliasDirective
# proc newCsExternAliasDirective(XXX): CsExternAliasDirective
# proc add(a:XXX; b:CsExternAliasDirective)
# proc extractCsMakeRefExpression(info:Info) : CsMakeRefExpression
# proc newCsMakeRefExpression(XXX): CsMakeRefExpression
# proc add(a:XXX; b:CsMakeRefExpression)
# proc extractCsJoinIntoClause(info:Info) : CsJoinIntoClause
# proc newCsJoinIntoClause(XXX): CsJoinIntoClause
# proc add(a:XXX; b:CsJoinIntoClause)
# proc extractCsRefValueExpression(info:Info) : CsRefValueExpression
# proc newCsRefValueExpression(XXX): CsRefValueExpression
# proc add(a:XXX; b:CsRefValueExpression)
# proc extractCsRefTypeExpression(info:Info) : CsRefTypeExpression
# proc newCsRefTypeExpression(XXX): CsRefTypeExpression
# proc add(a:XXX; b:CsRefTypeExpression)

proc extractCsAccessor(info: Info): CsAccessor
proc extractCsAccessorList(info: Info): CsAccessorList
proc extractCsAliasQualifiedName(info: Info): CsAliasQualifiedName
proc extractCsAnonymousMethodExpression(info: Info): CsAnonymousMethodExpression
proc extractCsAnonymousObjectCreationExpression(
  info: Info): CsAnonymousObjectCreationExpression
proc extractCsAnonymousObjectMemberDeclarator(
  info: Info): CsAnonymousObjectMemberDeclarator
proc extractCsArgument(info: Info): CsArgument
proc extractCsArrayCreationExpression(info: Info): CsArrayCreationExpression
proc extractCsArrayRankSpecifier(info: Info): CsArrayRankSpecifier
proc extractCsArrayType(info: Info): CsArrayType
proc extractCsArrowExpressionClause(info: Info): CsArrowExpressionClause
proc extractCsAssignmentExpression(info: Info): CsAssignmentExpression
proc extractCsAttribute(info: Info): CsAttribute
proc extractCsAttributeArgument(info: Info): CsAttributeArgument
proc extractCsAttributeArgumentList(info: Info): CsAttributeArgumentList
proc extractCsAttributeList(info: Info): CsAttributeList
proc extractCsAttributeTargetSpecifier(info: Info): CsAttributeTargetSpecifier
proc extractCsAwaitExpression(info: Info): CsAwaitExpression
proc extractCsBaseExpression(info: Info): CsBaseExpression
proc extractCsBaseList(info: Info): CsBaseList
proc extractCsBinaryExpression(info: Info): CsBinaryExpression
proc extractCsBracketedArgumentList(info: Info): CsBracketedArgumentList
proc extractCsBracketedParameterList(info: Info): CsBracketedParameterList
proc extractCsBreakStatement(info: Info): CsBreakStatement
proc extractCsCasePatternSwitchLabel(info: Info): CsCasePatternSwitchLabel
proc extractCsCaseSwitchLabel(info: Info): CsCaseSwitchLabel
proc extractCsCastExpression(info: Info): CsCastExpression
proc extractCsCatch(info: Info): CsCatch
proc extractCsCatchClause(info: Info): CsCatchClause
proc extractCsCatchFilterClause(info: Info): CsCatchFilterClause
proc extractCsCheckedExpression(info: Info): CsCheckedExpression
proc extractCsCheckedStatement(info: Info): CsCheckedStatement
proc extractCsClassOrStructConstraint(info: Info): CsClassOrStructConstraint
proc extractCsConditionalAccessExpression(
  info: Info): CsConditionalAccessExpression
proc extractCsConditionalExpression(info: Info): CsConditionalExpression
proc extractCsConstantPattern(info: Info): CsConstantPattern
proc extractCsConstructor(info: Info): CsConstructor
proc extractCsConstructorConstraint(info: Info): CsConstructorConstraint
proc extractCsConstructorInitializer(info: Info): CsConstructorInitializer
proc extractCsContinueStatement(info: Info): CsContinueStatement
proc extractCsConversionOperator(info: Info): CsConversionOperator
proc extractCsDeclarationExpression(info: Info): CsDeclarationExpression
proc extractCsDeclarationPattern(info: Info): CsDeclarationPattern
proc extractCsDefaultExpression(info: Info): CsDefaultExpression
proc extractCsDefaultSwitchLabel(info: Info): CsDefaultSwitchLabel
proc extractCsDelegate(info: Info): CsDelegate
proc extractCsDestructor(info: Info): CsDestructor
proc extractCsDiscardDesignation(info: Info): CsDiscardDesignation
proc extractCsDoStatement(info: Info): CsDoStatement
proc extractCsElementAccessExpression(info: Info): CsElementAccessExpression
proc extractCsElementBindingExpression(info: Info): CsElementBindingExpression
proc extractCsElseClause(info: Info): CsElseClause
proc extractCsEmptyStatement(info: Info): CsEmptyStatement
proc extractCsEnum(info: Info): CsEnum
proc extractCsEnumMember(info: Info): CsEnumMember
proc extractCsEqualsValueClause(info: Info): CsEqualsValueClause
proc extractCsEvent(info: Info): CsEvent
proc extractCsEventField(info: Info): CsEventField
proc extractCsExplicitInterfaceSpecifier(
  info: Info): CsExplicitInterfaceSpecifier
proc extractCsExpressionStatement(info: Info): CsExpressionStatement
proc extractCsExternAliasDirective(info: Info): CsExternAliasDirective
proc extractCsField(info: Info): CsField
proc extractCsFinallyClause(info: Info): CsFinallyClause
proc extractCsFixedStatement(info: Info): CsFixedStatement
proc extractCsForEachStatement(info: Info): CsForEachStatement
proc extractCsForEachVariableStatement(info: Info): CsForEachVariableStatement
proc extractCsForStatement(info: Info): CsForStatement
proc extractCsFromClause(info: Info): CsFromClause
proc extractCsGenericName(info: Info): CsGenericName
proc extractCsGlobalStatement(info: Info): CsGlobalStatement
proc extractCsGotoStatement(info: Info): CsGotoStatement
proc extractCsGroupClause(info: Info): CsGroupClause
proc extractCsIfStatement(info: Info): CsIfStatement
proc extractCsImplicitArrayCreationExpression(
  info: Info): CsImplicitArrayCreationExpression
proc extractCsImplicitElementAccess(info: Info): CsImplicitElementAccess
proc extractCsIncompleteMember(info: Info): CsIncompleteMember
proc extractCsIndexer(info: Info): CsIndexer
proc extractCsInitializerExpression(info: Info): CsInitializerExpression
proc extractCsInterface(info: Info): CsInterface
proc extractCsInterpolatedStringExpression(
  info: Info): CsInterpolatedStringExpression
proc extractCsInterpolatedStringText(info: Info): CsInterpolatedStringText
proc extractCsInterpolation(info: Info): CsInterpolation
proc extractCsInterpolationAlignmentClause(
  info: Info): CsInterpolationAlignmentClause
proc extractCsInterpolationFormatClause(info: Info): CsInterpolationFormatClause
proc extractCsIsPatternExpression(info: Info): CsIsPatternExpression
proc extractCsJoinClause(info: Info): CsJoinClause
proc extractCsJoinIntoClause(info: Info): CsJoinIntoClause
proc extractCsLabeledStatement(info: Info): CsLabeledStatement
proc extractCsLetClause(info: Info): CsLetClause
proc extractCsLocalDeclarationStatement(info: Info): CsLocalDeclarationStatement
proc extractCsLocalFunctionStatement(info: Info): CsLocalFunctionStatement
proc extractCsLockStatement(info: Info): CsLockStatement
proc extractCsMakeRefExpression(info: Info): CsMakeRefExpression
proc extractCsMemberBindingExpression(info: Info): CsMemberBindingExpression
proc extractCsNameColon(info: Info): CsNameColon
proc extractCsNameEquals(info: Info): CsNameEquals
proc extractCsNullableType(info: Info): CsNullableType
proc extractCsObjectCreationExpression(info: Info): CsObjectCreationExpression
proc extractCsOmittedArraySizeExpression(
  info: Info): CsOmittedArraySizeExpression
proc extractCsOmittedTypeArgument(info: Info): CsOmittedTypeArgument
proc extractCsOperator(info: Info): CsOperator
proc extractCsOrderByClause(info: Info): CsOrderByClause
proc extractCsOrdering(info: Info): CsOrdering
proc extractCsParameter(info: Info): CsParameter
proc extractCsParameterList(info: Info): CsParameterList
proc extractCsParenthesizedExpression(info: Info): CsParenthesizedExpression
proc extractCsParenthesizedLambdaExpression(
  info: Info): CsParenthesizedLambdaExpression
proc extractCsParenthesizedVariableDesignation(
  info: Info): CsParenthesizedVariableDesignation
proc extractCsPointerType(info: Info): CsPointerType
proc extractCsPostfixUnaryExpression(info: Info): CsPostfixUnaryExpression
proc extractCsPrefixUnaryExpression(info: Info): CsPrefixUnaryExpression
proc extractCsProperty(info: Info): CsProperty
proc extractCsQueryBody(info: Info): CsQueryBody
proc extractCsQueryContinuation(info: Info): CsQueryContinuation
proc extractCsQueryExpression(info: Info): CsQueryExpression
proc extractCsRefExpression(info: Info): CsRefExpression
proc extractCsRefType(info: Info): CsRefType
proc extractCsRefTypeExpression(info: Info): CsRefTypeExpression
proc extractCsRefValueExpression(info: Info): CsRefValueExpression
proc extractCsReturnStatement(info: Info): CsReturnStatement
proc extractCsSelectClause(info: Info): CsSelectClause
proc extractCsSimpleBaseType(info: Info): CsSimpleBaseType
proc extractCsSimpleLambdaExpression(info: Info): CsSimpleLambdaExpression
proc extractCsSingleVariableDesignation(info: Info): CsSingleVariableDesignation
proc extractCsSizeOfExpression(info: Info): CsSizeOfExpression
proc extractCsStackAllocArrayCreationExpression(
  info: Info): CsStackAllocArrayCreationExpression
proc extractCsStruct(info: Info): CsStruct
proc extractCsSwitchSection(info: Info): CsSwitchSection
proc extractCsSwitchStatement(info: Info): CsSwitchStatement
proc extractCsThisExpression(info: Info): CsThisExpression
proc extractCsThrowExpression(info: Info): CsThrowExpression
proc extractCsThrowStatement(info: Info): CsThrowStatement
proc extractCsTryStatement(info: Info): CsTryStatement
proc extractCsTupleElement(info: Info): CsTupleElement
proc extractCsTupleExpression(info: Info): CsTupleExpression
proc extractCsTupleType(info: Info): CsTupleType
proc extractCsTypeArgumentList(info: Info): CsTypeArgumentList
proc extractCsTypeConstraint(info: Info): CsTypeConstraint
proc extractCsTypeOfExpression(info: Info): CsTypeOfExpression
proc extractCsTypeParameter(info: Info): CsTypeParameter
proc extractCsTypeParameterConstraintClause(
  info: Info): CsTypeParameterConstraintClause
proc extractCsTypeParameterList(info: Info): CsTypeParameterList
proc extractCsUnsafeStatement(info: Info): CsUnsafeStatement
proc extractCsUsingStatement(info: Info): CsUsingStatement
proc extractCsWhenClause(info: Info): CsWhenClause
proc extractCsWhereClause(info: Info): CsWhereClause
proc extractCsWhileStatement(info: Info): CsWhileStatement
proc extractCsYieldStatement(info: Info): CsYieldStatement
