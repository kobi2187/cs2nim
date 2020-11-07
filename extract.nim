# extract.nim

import types, state
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


#TODO: we want a c# example for each, to put in unit testing. also, figure out later if we miss some crucial pieces in info.
# proc extractCsNamespace(info:Info) : CsNamespace
# proc newCsNamespace(XXX): CsNamespace
# proc extractCsArgument(info:Info) : CsArgument
# proc newCsArgument(XXX): CsArgument
# proc extractCsExpressionStatement(info:Info) : CsExpressionStatement
# proc newCsExpressionStatement(XXX): CsExpressionStatement
# proc extractCsBinaryExpression(info:Info) : CsBinaryExpression
# proc newCsBinaryExpression(XXX): CsBinaryExpression
# proc extractCsParameter(info:Info) : CsParameter
# proc newCsParameter(XXX): CsParameter
# proc extractCsAssignmentExpression(info:Info) : CsAssignmentExpression
# proc newCsAssignmentExpression(XXX): CsAssignmentExpression
# proc extractCsEqualsValueClause(info:Info) : CsEqualsValueClause
# proc newCsEqualsValueClause(XXX): CsEqualsValueClause
# proc extractCsParameterList(info:Info) : CsParameterList
# proc newCsParameterList(XXX): CsParameterList
# proc extractCsLocalDeclarationStatement(info:Info) : CsLocalDeclarationStatement
# proc newCsLocalDeclarationStatement(XXX): CsLocalDeclarationStatement
# proc extractCsObjectCreationExpression(info:Info) : CsObjectCreationExpression
# proc newCsObjectCreationExpression(XXX): CsObjectCreationExpression
# proc extractCsReturnStatement(info:Info) : CsReturnStatement
# proc newCsReturnStatement(XXX): CsReturnStatement
# proc extractCsIfStatement(info:Info) : CsIfStatement
# proc newCsIfStatement(XXX): CsIfStatement
# proc extractCsAttribute(info:Info) : CsAttribute
# proc newCsAttribute(XXX): CsAttribute
# proc extractCsAttributeList(info:Info) : CsAttributeList
# proc newCsAttributeList(XXX): CsAttributeList
# proc extractCsThisExpression(info:Info) : CsThisExpression
# proc newCsThisExpression(XXX): CsThisExpression
# proc extractCsTypeArgumentList(info:Info) : CsTypeArgumentList
# proc newCsTypeArgumentList(XXX): CsTypeArgumentList
# proc extractCsGenericName(info:Info) : CsGenericName
# proc newCsGenericName(XXX): CsGenericName
# proc extractCsAttributeArgument(info:Info) : CsAttributeArgument
# proc newCsAttributeArgument(XXX): CsAttributeArgument
# proc extractCsAccessor(info:Info) : CsAccessor
# proc newCsAccessor(XXX): CsAccessor
# proc extractCsField(info:Info) : CsField
# proc newCsField(XXX): CsField
# proc extractCsBracketedArgumentList(info:Info) : CsBracketedArgumentList
# proc newCsBracketedArgumentList(XXX): CsBracketedArgumentList
# proc extractCsElementAccessExpression(info:Info) : CsElementAccessExpression
# proc newCsElementAccessExpression(XXX): CsElementAccessExpression
# proc extractCsProperty(info:Info) : CsProperty
# proc newCsProperty(XXX): CsProperty
# proc extractCsAccessorList(info:Info) : CsAccessorList
# proc newCsAccessorList(XXX): CsAccessorList
# proc extractCsAttributeArgumentList(info:Info) : CsAttributeArgumentList
# proc newCsAttributeArgumentList(XXX): CsAttributeArgumentList
# proc extractCsParenthesizedExpression(info:Info) : CsParenthesizedExpression
# proc newCsParenthesizedExpression(XXX): CsParenthesizedExpression
# proc extractCsCastExpression(info:Info) : CsCastExpression
# proc newCsCastExpression(XXX): CsCastExpression
# proc extractCsArrayRankSpecifier(info:Info) : CsArrayRankSpecifier
# proc newCsArrayRankSpecifier(XXX): CsArrayRankSpecifier
# proc extractCsArrayType(info:Info) : CsArrayType
# proc newCsArrayType(XXX): CsArrayType
# proc extractCsPrefixUnaryExpression(info:Info) : CsPrefixUnaryExpression
# proc newCsPrefixUnaryExpression(XXX): CsPrefixUnaryExpression
# proc extractCsOmittedArraySizeExpression(info:Info) : CsOmittedArraySizeExpression
# proc newCsOmittedArraySizeExpression(XXX): CsOmittedArraySizeExpression
# proc extractCsInitializerExpression(info:Info) : CsInitializerExpression
# proc newCsInitializerExpression(XXX): CsInitializerExpression
# proc extractCsNameEquals(info:Info) : CsNameEquals
# proc newCsNameEquals(XXX): CsNameEquals
# proc extractCsThrowStatement(info:Info) : CsThrowStatement
# proc newCsThrowStatement(XXX): CsThrowStatement
# proc extractCsTypeOfExpression(info:Info) : CsTypeOfExpression
# proc newCsTypeOfExpression(XXX): CsTypeOfExpression
# proc extractCsElseClause(info:Info) : CsElseClause
# proc newCsElseClause(XXX): CsElseClause
# proc extractCsCaseSwitchLabel(info:Info) : CsCaseSwitchLabel
# proc newCsCaseSwitchLabel(XXX): CsCaseSwitchLabel
# proc extractCsSimpleBaseType(info:Info) : CsSimpleBaseType
# proc newCsSimpleBaseType(XXX): CsSimpleBaseType
# proc extractCsConstructor(info:Info) : CsConstructor
# proc newCsConstructor(XXX): CsConstructor
# proc extractCsBaseList(info:Info) : CsBaseList
# proc newCsBaseList(XXX): CsBaseList
# proc extractCsSwitchSection(info:Info) : CsSwitchSection
# proc newCsSwitchSection(XXX): CsSwitchSection
# proc extractCsEnumMember(info:Info) : CsEnumMember
# proc newCsEnumMember(XXX): CsEnumMember
# proc extractCsSimpleLambdaExpression(info:Info) : CsSimpleLambdaExpression
# proc newCsSimpleLambdaExpression(XXX): CsSimpleLambdaExpression
# proc extractCsPostfixUnaryExpression(info:Info) : CsPostfixUnaryExpression
# proc newCsPostfixUnaryExpression(XXX): CsPostfixUnaryExpression
# proc extractCsArrayCreationExpression(info:Info) : CsArrayCreationExpression
# proc newCsArrayCreationExpression(XXX): CsArrayCreationExpression
# proc extractCsArrowExpressionClause(info:Info) : CsArrowExpressionClause
# proc newCsArrowExpressionClause(XXX): CsArrowExpressionClause
# proc extractCsBreakStatement(info:Info) : CsBreakStatement
# proc newCsBreakStatement(XXX): CsBreakStatement
# proc extractCsAliasQualifiedName(info:Info) : CsAliasQualifiedName
# proc newCsAliasQualifiedName(XXX): CsAliasQualifiedName
# proc extractCsTypeParameter(info:Info) : CsTypeParameter
# proc newCsTypeParameter(XXX): CsTypeParameter
# proc extractCsAwaitExpression(info:Info) : CsAwaitExpression
# proc newCsAwaitExpression(XXX): CsAwaitExpression
# proc extractCsConditionalExpression(info:Info) : CsConditionalExpression
# proc newCsConditionalExpression(XXX): CsConditionalExpression
# proc extractCsAttributeTargetSpecifier(info:Info) : CsAttributeTargetSpecifier
# proc newCsAttributeTargetSpecifier(XXX): CsAttributeTargetSpecifier
# proc extractCsTypeParameterList(info:Info) : CsTypeParameterList
# proc newCsTypeParameterList(XXX): CsTypeParameterList
# proc extractCsForEachStatement(info:Info) : CsForEachStatement
# proc newCsForEachStatement(XXX): CsForEachStatement
# proc extractCsForStatement(info:Info) : CsForStatement
# proc newCsForStatement(XXX): CsForStatement
# proc extractCsInterpolatedStringText(info:Info) : CsInterpolatedStringText
# proc newCsInterpolatedStringText(XXX): CsInterpolatedStringText
# proc extractCsParenthesizedLambdaExpression(info:Info) : CsParenthesizedLambdaExpression
# proc newCsParenthesizedLambdaExpression(XXX): CsParenthesizedLambdaExpression
# proc extractCsTryStatement(info:Info) : CsTryStatement
# proc newCsTryStatement(XXX): CsTryStatement
# proc extractCsNullableType(info:Info) : CsNullableType
# proc newCsNullableType(XXX): CsNullableType
# proc extractCsBaseExpression(info:Info) : CsBaseExpression
# proc newCsBaseExpression(XXX): CsBaseExpression
# proc extractCsCatchClause(info:Info) : CsCatchClause
# proc newCsCatchClause(XXX): CsCatchClause
# proc extractCsConstructorInitializer(info:Info) : CsConstructorInitializer
# proc newCsConstructorInitializer(XXX): CsConstructorInitializer
# proc extractCsInterpolation(info:Info) : CsInterpolation
# proc newCsInterpolation(XXX): CsInterpolation
# proc extractCsCatch(info:Info) : CsCatch
# proc newCsCatch(XXX): CsCatch
# proc extractCsNameColon(info:Info) : CsNameColon
# proc newCsNameColon(XXX): CsNameColon
# proc extractCsUsingStatement(info:Info) : CsUsingStatement
# proc newCsUsingStatement(XXX): CsUsingStatement
# proc extractCsTypeParameterConstraintClause(info:Info) : CsTypeParameterConstraintClause
# proc newCsTypeParameterConstraintClause(XXX): CsTypeParameterConstraintClause
# proc extractCsTypeConstraint(info:Info) : CsTypeConstraint
# proc newCsTypeConstraint(XXX): CsTypeConstraint
# proc extractCsSingleVariableDesignation(info:Info) : CsSingleVariableDesignation
# proc newCsSingleVariableDesignation(XXX): CsSingleVariableDesignation
# proc extractCsInterpolatedStringExpression(info:Info) : CsInterpolatedStringExpression
# proc newCsInterpolatedStringExpression(XXX): CsInterpolatedStringExpression
# proc extractCsImplicitArrayCreationExpression(info:Info) : CsImplicitArrayCreationExpression
# proc newCsImplicitArrayCreationExpression(XXX): CsImplicitArrayCreationExpression
# proc extractCsWhileStatement(info:Info) : CsWhileStatement
# proc newCsWhileStatement(XXX): CsWhileStatement
# proc extractCsDeclarationExpression(info:Info) : CsDeclarationExpression
# proc newCsDeclarationExpression(XXX): CsDeclarationExpression
# proc extractCsExplicitInterfaceSpecifier(info:Info) : CsExplicitInterfaceSpecifier
# proc newCsExplicitInterfaceSpecifier(XXX): CsExplicitInterfaceSpecifier
# proc extractCsConditionalAccessExpression(info:Info) : CsConditionalAccessExpression
# proc newCsConditionalAccessExpression(XXX): CsConditionalAccessExpression
# proc extractCsSwitchStatement(info:Info) : CsSwitchStatement
# proc newCsSwitchStatement(XXX): CsSwitchStatement
# proc extractCsMemberBindingExpression(info:Info) : CsMemberBindingExpression
# proc newCsMemberBindingExpression(XXX): CsMemberBindingExpression
# proc extractCsDefaultExpression(info:Info) : CsDefaultExpression
# proc newCsDefaultExpression(XXX): CsDefaultExpression
# proc extractCsPointerType(info:Info) : CsPointerType
# proc newCsPointerType(XXX): CsPointerType
# proc extractCsInterface(info:Info) : CsInterface
# proc newCsInterface(XXX): CsInterface
# proc extractCsContinueStatement(info:Info) : CsContinueStatement
# proc newCsContinueStatement(XXX): CsContinueStatement
# proc extractCsFinallyClause(info:Info) : CsFinallyClause
# proc newCsFinallyClause(XXX): CsFinallyClause
# proc extractCsEnum(info:Info) : CsEnum
# proc newCsEnum(XXX): CsEnum
# proc extractCsDefaultSwitchLabel(info:Info) : CsDefaultSwitchLabel
# proc newCsDefaultSwitchLabel(XXX): CsDefaultSwitchLabel
# proc extractCsYieldStatement(info:Info) : CsYieldStatement
# proc newCsYieldStatement(XXX): CsYieldStatement
# proc extractCsAnonymousObjectMemberDeclarator(info:Info) : CsAnonymousObjectMemberDeclarator
# proc newCsAnonymousObjectMemberDeclarator(XXX): CsAnonymousObjectMemberDeclarator
# proc extractCsCheckedExpression(info:Info) : CsCheckedExpression
# proc newCsCheckedExpression(XXX): CsCheckedExpression
# proc extractCsStruct(info:Info) : CsStruct
# proc newCsStruct(XXX): CsStruct
# proc extractCsIsPatternExpression(info:Info) : CsIsPatternExpression
# proc newCsIsPatternExpression(XXX): CsIsPatternExpression
# proc extractCsLockStatement(info:Info) : CsLockStatement
# proc newCsLockStatement(XXX): CsLockStatement
# proc extractCsDeclarationPattern(info:Info) : CsDeclarationPattern
# proc newCsDeclarationPattern(XXX): CsDeclarationPattern
# proc extractCsThrowExpression(info:Info) : CsThrowExpression
# proc newCsThrowExpression(XXX): CsThrowExpression
# proc extractCsConstantPattern(info:Info) : CsConstantPattern
# proc newCsConstantPattern(XXX): CsConstantPattern
# proc extractCsRefType(info:Info) : CsRefType
# proc newCsRefType(XXX): CsRefType
# proc extractCsRefExpression(info:Info) : CsRefExpression
# proc newCsRefExpression(XXX): CsRefExpression
# proc extractCsClassOrStructConstraint(info:Info) : CsClassOrStructConstraint
# proc newCsClassOrStructConstraint(XXX): CsClassOrStructConstraint
# proc extractCsOmittedTypeArgument(info:Info) : CsOmittedTypeArgument
# proc newCsOmittedTypeArgument(XXX): CsOmittedTypeArgument
# proc extractCsTupleElement(info:Info) : CsTupleElement
# proc newCsTupleElement(XXX): CsTupleElement
# proc extractCsOperator(info:Info) : CsOperator
# proc newCsOperator(XXX): CsOperator
# proc extractCsEventField(info:Info) : CsEventField
# proc newCsEventField(XXX): CsEventField
# proc extractCsDelegate(info:Info) : CsDelegate
# proc newCsDelegate(XXX): CsDelegate
# proc extractCsImplicitElementAccess(info:Info) : CsImplicitElementAccess
# proc newCsImplicitElementAccess(XXX): CsImplicitElementAccess
# proc extractCsAnonymousMethodExpression(info:Info) : CsAnonymousMethodExpression
# proc newCsAnonymousMethodExpression(XXX): CsAnonymousMethodExpression
# proc extractCsTupleExpression(info:Info) : CsTupleExpression
# proc newCsTupleExpression(XXX): CsTupleExpression
# proc extractCsAnonymousObjectCreationExpression(info:Info) : CsAnonymousObjectCreationExpression
# proc newCsAnonymousObjectCreationExpression(XXX): CsAnonymousObjectCreationExpression
# proc extractCsIndexer(info:Info) : CsIndexer
# proc newCsIndexer(XXX): CsIndexer
# proc extractCsBracketedParameterList(info:Info) : CsBracketedParameterList
# proc newCsBracketedParameterList(XXX): CsBracketedParameterList
# proc extractCsEvent(info:Info) : CsEvent
# proc newCsEvent(XXX): CsEvent
# proc extractCsGotoStatement(info:Info) : CsGotoStatement
# proc newCsGotoStatement(XXX): CsGotoStatement
# proc extractCsDoStatement(info:Info) : CsDoStatement
# proc newCsDoStatement(XXX): CsDoStatement
# proc extractCsGlobalStatement(info:Info) : CsGlobalStatement
# proc newCsGlobalStatement(XXX): CsGlobalStatement
# proc extractCsIncompleteMember(info:Info) : CsIncompleteMember
# proc newCsIncompleteMember(XXX): CsIncompleteMember
# proc extractCsLocalFunctionStatement(info:Info) : CsLocalFunctionStatement
# proc newCsLocalFunctionStatement(XXX): CsLocalFunctionStatement
# proc extractCsConversionOperator(info:Info) : CsConversionOperator
# proc newCsConversionOperator(XXX): CsConversionOperator
# proc extractCsTupleType(info:Info) : CsTupleType
# proc newCsTupleType(XXX): CsTupleType
# proc extractCsFixedStatement(info:Info) : CsFixedStatement
# proc newCsFixedStatement(XXX): CsFixedStatement
# proc extractCsEmptyStatement(info:Info) : CsEmptyStatement
# proc newCsEmptyStatement(XXX): CsEmptyStatement
# proc extractCsFromClause(info:Info) : CsFromClause
# proc newCsFromClause(XXX): CsFromClause
# proc extractCsSizeOfExpression(info:Info) : CsSizeOfExpression
# proc newCsSizeOfExpression(XXX): CsSizeOfExpression
# proc extractCsQueryBody(info:Info) : CsQueryBody
# proc newCsQueryBody(XXX): CsQueryBody
# proc extractCsCheckedStatement(info:Info) : CsCheckedStatement
# proc newCsCheckedStatement(XXX): CsCheckedStatement
# proc extractCsQueryExpression(info:Info) : CsQueryExpression
# proc newCsQueryExpression(XXX): CsQueryExpression
# proc extractCsSelectClause(info:Info) : CsSelectClause
# proc newCsSelectClause(XXX): CsSelectClause
# proc extractCsCasePatternSwitchLabel(info:Info) : CsCasePatternSwitchLabel
# proc newCsCasePatternSwitchLabel(XXX): CsCasePatternSwitchLabel
# proc extractCsLabeledStatement(info:Info) : CsLabeledStatement
# proc newCsLabeledStatement(XXX): CsLabeledStatement
# proc extractCsWhereClause(info:Info) : CsWhereClause
# proc newCsWhereClause(XXX): CsWhereClause
# proc extractCsConstructorConstraint(info:Info) : CsConstructorConstraint
# proc newCsConstructorConstraint(XXX): CsConstructorConstraint
# proc extractCsUnsafeStatement(info:Info) : CsUnsafeStatement
# proc newCsUnsafeStatement(XXX): CsUnsafeStatement
# proc extractCsParenthesizedVariableDesignation(info:Info) : CsParenthesizedVariableDesignation
# proc newCsParenthesizedVariableDesignation(XXX): CsParenthesizedVariableDesignation
# proc extractCsInterpolationFormatClause(info:Info) : CsInterpolationFormatClause
# proc newCsInterpolationFormatClause(XXX): CsInterpolationFormatClause
# proc extractCsDestructor(info:Info) : CsDestructor
# proc newCsDestructor(XXX): CsDestructor
# proc extractCsDiscardDesignation(info:Info) : CsDiscardDesignation
# proc newCsDiscardDesignation(XXX): CsDiscardDesignation
# proc extractCsStackAllocArrayCreationExpression(info:Info) : CsStackAllocArrayCreationExpression
# proc newCsStackAllocArrayCreationExpression(XXX): CsStackAllocArrayCreationExpression
# proc extractCsWhenClause(info:Info) : CsWhenClause
# proc newCsWhenClause(XXX): CsWhenClause
# proc extractCsForEachVariableStatement(info:Info) : CsForEachVariableStatement
# proc newCsForEachVariableStatement(XXX): CsForEachVariableStatement
# proc extractCsLetClause(info:Info) : CsLetClause
# proc newCsLetClause(XXX): CsLetClause
# proc extractCsElementBindingExpression(info:Info) : CsElementBindingExpression
# proc newCsElementBindingExpression(XXX): CsElementBindingExpression
# proc extractCsCatchFilterClause(info:Info) : CsCatchFilterClause
# proc newCsCatchFilterClause(XXX): CsCatchFilterClause
# proc extractCsOrdering(info:Info) : CsOrdering
# proc newCsOrdering(XXX): CsOrdering
# proc extractCsOrderByClause(info:Info) : CsOrderByClause
# proc newCsOrderByClause(XXX): CsOrderByClause
# proc extractCsJoinClause(info:Info) : CsJoinClause
# proc newCsJoinClause(XXX): CsJoinClause
# proc extractCsGroupClause(info:Info) : CsGroupClause
# proc newCsGroupClause(XXX): CsGroupClause
# proc extractCsInterpolationAlignmentClause(info:Info) : CsInterpolationAlignmentClause
# proc newCsInterpolationAlignmentClause(XXX): CsInterpolationAlignmentClause
# proc extractCsQueryContinuation(info:Info) : CsQueryContinuation
# proc newCsQueryContinuation(XXX): CsQueryContinuation
# proc extractCsExternAliasDirective(info:Info) : CsExternAliasDirective
# proc newCsExternAliasDirective(XXX): CsExternAliasDirective
# proc extractCsMakeRefExpression(info:Info) : CsMakeRefExpression
# proc newCsMakeRefExpression(XXX): CsMakeRefExpression
# proc extractCsJoinIntoClause(info:Info) : CsJoinIntoClause
# proc newCsJoinIntoClause(XXX): CsJoinIntoClause
# proc extractCsRefValueExpression(info:Info) : CsRefValueExpression
# proc newCsRefValueExpression(XXX): CsRefValueExpression
# proc extractCsRefTypeExpression(info:Info) : CsRefTypeExpression
# proc newCsRefTypeExpression(XXX): CsRefTypeExpression
