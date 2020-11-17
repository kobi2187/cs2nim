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

proc extract[T](t: typedesc(T), info: Info): T = discard

proc extract*(CsArgument, info: Info): CsArgument = discard
proc extract*(CsExpressionStatement, info: Info): CsExpressionStatement = discard #TODO
proc extract*(CsBinaryExpression, info: Info): CsBinaryExpression = discard #TODO
proc extract*(CsParameter, info: Info): CsParameter = discard #TODO
proc extract*(CsAssignmentExpression, info: Info): CsAssignmentExpression = discard #TODO
proc extract*(CsEqualsValueClause, info: Info): CsEqualsValueClause = discard #TODO
proc extract*(CsParameterList, info: Info): CsParameterList = discard #TODO
proc extract*(CsLocalDeclarationStatement,
    info: Info): CsLocalDeclarationStatement = discard #TODO
proc extract*(CsObjectCreationExpression,
    info: Info): CsObjectCreationExpression = discard #TODO
proc extract*(CsReturnStatement, info: Info): CsReturnStatement = discard #TODO
proc extract*(CsIfStatement, info: Info): CsIfStatement = discard #TODO
proc extract*(CsAttribute, info: Info): CsAttribute = discard #TODO
proc extract*(CsAttributeList, info: Info): CsAttributeList = discard #TODO
proc extract*(CsThisExpression, info: Info): CsThisExpression = discard #TODO
proc extract*(CsTypeArgumentList, info: Info): CsTypeArgumentList = discard #TODO
proc extract*(CsGenericName, info: Info): CsGenericName = discard #TODO
proc extract*(CsAttributeArgument, info: Info): CsAttributeArgument = discard #TODO
proc extract*(CsAccessor, info: Info): CsAccessor = discard #TODO
proc extract*(CsField, info: Info): CsField = discard #TODO
proc extract*(CsBracketedArgumentList, info: Info): CsBracketedArgumentList = discard #TODO
proc extract*(CsElementAccessExpression,
    info: Info): CsElementAccessExpression = discard #TODO
proc extract*(CsProperty, info: Info): CsProperty = discard #TODO
proc extract*(CsAccessorList, info: Info): CsAccessorList = discard #TODO
proc extract*(CsAttributeArgumentList, info: Info): CsAttributeArgumentList = discard #TODO
proc extract*(CsParenthesizedExpression,
    info: Info): CsParenthesizedExpression = discard #TODO
proc extract*(CsCastExpression, info: Info): CsCastExpression = discard #TODO
proc extract*(CsArrayRankSpecifier, info: Info): CsArrayRankSpecifier = discard #TODO
proc extract*(CsArrayType, info: Info): CsArrayType = discard #TODO
proc extract*(CsPrefixUnaryExpression, info: Info): CsPrefixUnaryExpression = discard #TODO
proc extract*(CsOmittedArraySizeExpression,
    info: Info): CsOmittedArraySizeExpression = discard #TODO
proc extract*(CsInitializerExpression, info: Info): CsInitializerExpression = discard #TODO
proc extract*(CsNameEquals, info: Info): CsNameEquals = discard #TODO
proc extract*(CsThrowStatement, info: Info): CsThrowStatement = discard #TODO
proc extract*(CsTypeOfExpression, info: Info): CsTypeOfExpression = discard #TODO
proc extract*(CsElseClause, info: Info): CsElseClause = discard #TODO
proc extract*(CsCaseSwitchLabel, info: Info): CsCaseSwitchLabel = discard #TODO
proc extract*(CsSimpleBaseType, info: Info): CsSimpleBaseType = discard #TODO
proc extract*(CsConstructor, info: Info): CsConstructor = discard #TODO
proc extract*(CsBaseList, info: Info): CsBaseList = discard #TODO
proc extract*(CsSwitchSection, info: Info): CsSwitchSection = discard #TODO
proc extract*(CsEnumMember, info: Info): CsEnumMember = discard #TODO
proc extract*(CsSimpleLambdaExpression, info: Info): CsSimpleLambdaExpression = discard #TODO
proc extract*(CsPostfixUnaryExpression, info: Info): CsPostfixUnaryExpression = discard #TODO
proc extract*(CsArrayCreationExpression,
    info: Info): CsArrayCreationExpression = discard #TODO
proc extract*(CsArrowExpressionClause, info: Info): CsArrowExpressionClause = discard #TODO
proc extract*(CsBreakStatement, info: Info): CsBreakStatement = discard #TODO
proc extract*(CsAliasQualifiedName, info: Info): CsAliasQualifiedName = discard #TODO
proc extract*(CsTypeParameter, info: Info): CsTypeParameter = discard #TODO
proc extract*(CsAwaitExpression, info: Info): CsAwaitExpression = discard #TODO
proc extract*(CsConditionalExpression, info: Info): CsConditionalExpression = discard #TODO
proc extract*(CsAttributeTargetSpecifier,
    info: Info): CsAttributeTargetSpecifier = discard #TODO
proc extract*(CsTypeParameterList, info: Info): CsTypeParameterList = discard #TODO
proc extract*(CsForEachStatement, info: Info): CsForEachStatement = discard #TODO
proc extract*(CsForStatement, info: Info): CsForStatement = discard #TODO
proc extract*(CsInterpolatedStringText, info: Info): CsInterpolatedStringText = discard #TODO
proc extract*(CsParenthesizedLambdaExpression,
    info: Info): CsParenthesizedLambdaExpression = discard #TODO
proc extract*(CsTryStatement, info: Info): CsTryStatement = discard #TODO
proc extract*(CsNullableType, info: Info): CsNullableType = discard #TODO
proc extract*(CsBaseExpression, info: Info): CsBaseExpression = discard #TODO
proc extract*(CsCatchClause, info: Info): CsCatchClause = discard #TODO
proc extract*(CsConstructorInitializer, info: Info): CsConstructorInitializer = discard #TODO
proc extract*(CsInterpolation, info: Info): CsInterpolation = discard #TODO
proc extract*(CsCatch, info: Info): CsCatch = discard #TODO
proc extract*(CsNameColon, info: Info): CsNameColon = discard #TODO
proc extract*(CsUsingStatement, info: Info): CsUsingStatement = discard #TODO
proc extract*(CsTypeParameterConstraintClause,
    info: Info): CsTypeParameterConstraintClause = discard #TODO
proc extract*(CsTypeConstraint, info: Info): CsTypeConstraint = discard #TODO
proc extract*(CsSingleVariableDesignation,
    info: Info): CsSingleVariableDesignation = discard #TODO
proc extract*(CsInterpolatedStringExpression,
    info: Info): CsInterpolatedStringExpression = discard #TODO
proc extract*(CsImplicitArrayCreationExpression,
    info: Info): CsImplicitArrayCreationExpression = discard #TODO
proc extract*(CsWhileStatement, info: Info): CsWhileStatement = discard #TODO
proc extract*(CsDeclarationExpression, info: Info): CsDeclarationExpression = discard #TODO
proc extract*(CsExplicitInterfaceSpecifier,
    info: Info): CsExplicitInterfaceSpecifier = discard #TODO
proc extract*(CsConditionalAccessExpression,
    info: Info): CsConditionalAccessExpression = discard #TODO
proc extract*(CsSwitchStatement, info: Info): CsSwitchStatement = discard #TODO
proc extract*(CsMemberBindingExpression,
    info: Info): CsMemberBindingExpression = discard #TODO
proc extract*(CsDefaultExpression, info: Info): CsDefaultExpression = discard #TODO
proc extract*(CsPointerType, info: Info): CsPointerType = discard #TODO
proc extract*(CsInterface, info: Info): CsInterface = discard #TODO
proc extract*(CsContinueStatement, info: Info): CsContinueStatement = discard #TODO
proc extract*(CsFinallyClause, info: Info): CsFinallyClause = discard #TODO
proc extract*(CsEnum, info: Info): CsEnum = discard #TODO
proc extract*(CsDefaultSwitchLabel, info: Info): CsDefaultSwitchLabel = discard #TODO
proc extract*(CsYieldStatement, info: Info): CsYieldStatement = discard #TODO
proc extract*(CsAnonymousObjectMemberDeclarator,
    info: Info): CsAnonymousObjectMemberDeclarator = discard #TODO
proc extract*(CsCheckedExpression, info: Info): CsCheckedExpression = discard #TODO
proc extract*(CsStruct, info: Info): CsStruct = discard #TODO
proc extract*(CsIsPatternExpression, info: Info): CsIsPatternExpression = discard #TODO
proc extract*(CsLockStatement, info: Info): CsLockStatement = discard #TODO
proc extract*(CsDeclarationPattern, info: Info): CsDeclarationPattern = discard #TODO
proc extract*(CsThrowExpression, info: Info): CsThrowExpression = discard #TODO
proc extract*(CsConstantPattern, info: Info): CsConstantPattern = discard #TODO
proc extract*(CsRefType, info: Info): CsRefType = discard #TODO
proc extract*(CsRefExpression, info: Info): CsRefExpression = discard #TODO
proc extract*(CsClassOrStructConstraint,
    info: Info): CsClassOrStructConstraint = discard #TODO
proc extract*(CsOmittedTypeArgument, info: Info): CsOmittedTypeArgument = discard #TODO
proc extract*(CsTupleElement, info: Info): CsTupleElement = discard #TODO
proc extract*(CsOperator, info: Info): CsOperator = discard #TODO
proc extract*(CsEventField, info: Info): CsEventField = discard #TODO
proc extract*(CsDelegate, info: Info): CsDelegate = discard #TODO
proc extract*(CsImplicitElementAccess, info: Info): CsImplicitElementAccess = discard #TODO
proc extract*(CsAnonymousMethodExpression,
    info: Info): CsAnonymousMethodExpression = discard #TODO
proc extract*(CsTupleExpression, info: Info): CsTupleExpression = discard #TODO
proc extract*(CsAnonymousObjectCreationExpression,
    info: Info): CsAnonymousObjectCreationExpression = discard #TODO
proc extract*(CsIndexer, info: Info): CsIndexer = discard #TODO
proc extract*(CsBracketedParameterList, info: Info): CsBracketedParameterList = discard #TODO
proc extract*(CsEvent, info: Info): CsEvent = discard #TODO
proc extract*(CsGotoStatement, info: Info): CsGotoStatement = discard #TODO
proc extract*(CsDoStatement, info: Info): CsDoStatement = discard #TODO
proc extract*(CsGlobalStatement, info: Info): CsGlobalStatement = discard #TODO
proc extract*(CsIncompleteMember, info: Info): CsIncompleteMember = discard #TODO
proc extract*(CsLocalFunctionStatement, info: Info): CsLocalFunctionStatement = discard #TODO
proc extract*(CsConversionOperator, info: Info): CsConversionOperator = discard #TODO
proc extract*(CsTupleType, info: Info): CsTupleType = discard #TODO
proc extract*(CsFixedStatement, info: Info): CsFixedStatement = discard #TODO
proc extract*(CsEmptyStatement, info: Info): CsEmptyStatement = discard #TODO
proc extract*(CsFromClause, info: Info): CsFromClause = discard #TODO
proc extract*(CsSizeOfExpression, info: Info): CsSizeOfExpression = discard #TODO
proc extract*(CsQueryBody, info: Info): CsQueryBody = discard #TODO
proc extract*(CsCheckedStatement, info: Info): CsCheckedStatement = discard #TODO
proc extract*(CsQueryExpression, info: Info): CsQueryExpression = discard #TODO
proc extract*(CsSelectClause, info: Info): CsSelectClause = discard #TODO
proc extract*(CsCasePatternSwitchLabel, info: Info): CsCasePatternSwitchLabel = discard #TODO
proc extract*(CsLabeledStatement, info: Info): CsLabeledStatement = discard #TODO
proc extract*(CsWhereClause, info: Info): CsWhereClause = discard #TODO
proc extract*(CsConstructorConstraint, info: Info): CsConstructorConstraint = discard #TODO
proc extract*(CsUnsafeStatement, info: Info): CsUnsafeStatement = discard #TODO
proc extract*(CsParenthesizedVariableDesignation,
    info: Info): CsParenthesizedVariableDesignation = discard #TODO
proc extract*(CsInterpolationFormatClause,
    info: Info): CsInterpolationFormatClause = discard #TODO
proc extract*(CsDestructor, info: Info): CsDestructor = discard #TODO
proc extract*(CsDiscardDesignation, info: Info): CsDiscardDesignation = discard #TODO
proc extract*(CsStackAllocArrayCreationExpression,
    info: Info): CsStackAllocArrayCreationExpression = discard #TODO
proc extract*(CsWhenClause, info: Info): CsWhenClause = discard #TODO
proc extract*(CsForEachVariableStatement,
    info: Info): CsForEachVariableStatement = discard #TODO
proc extract*(CsLetClause, info: Info): CsLetClause = discard #TODO
proc extract*(CsElementBindingExpression,
    info: Info): CsElementBindingExpression = discard #TODO
proc extract*(CsCatchFilterClause, info: Info): CsCatchFilterClause = discard #TODO
proc extract*(CsOrdering, info: Info): CsOrdering = discard #TODO
proc extract*(CsOrderByClause, info: Info): CsOrderByClause = discard #TODO
proc extract*(CsJoinClause, info: Info): CsJoinClause = discard #TODO
proc extract*(CsGroupClause, info: Info): CsGroupClause = discard #TODO
proc extract*(CsInterpolationAlignmentClause,
    info: Info): CsInterpolationAlignmentClause = discard #TODO
proc extract*(CsQueryContinuation, info: Info): CsQueryContinuation = discard #TODO
proc extract*(CsExternAliasDirective, info: Info): CsExternAliasDirective = discard #TODO
proc extract*(CsMakeRefExpression, info: Info): CsMakeRefExpression = discard #TODO
proc extract*(CsJoinIntoClause, info: Info): CsJoinIntoClause = discard #TODO
proc extract*(CsRefValueExpression, info: Info): CsRefValueExpression = discard #TODO
proc extract*(CsRefTypeExpression, info: Info): CsRefTypeExpression = discard #TODO
proc extract*(CsAccessor, info: Info): CsAccessor = discard #TODO
proc extract*(CsAccessorList, info: Info): CsAccessorList = discard #TODO
proc extract*(CsAliasQualifiedName, info: Info): CsAliasQualifiedName = discard #TODO
proc extract*(CsAnonymousMethodExpression,
    info: Info): CsAnonymousMethodExpression = discard #TODO
proc extract*(CsAnonymousObjectCreationExpression,
    info: Info): CsAnonymousObjectCreationExpression = discard #TODO
proc extract*(CsAnonymousObjectMemberDeclarator,
    info: Info): CsAnonymousObjectMemberDeclarator = discard #TODO
proc extract*(CsArgument, info: Info): CsArgument = discard #TODO
proc extract*(CsArrayCreationExpression,
    info: Info): CsArrayCreationExpression = discard #TODO
proc extract*(CsArrayRankSpecifier, info: Info): CsArrayRankSpecifier = discard #TODO
proc extract*(CsArrayType, info: Info): CsArrayType = discard #TODO
proc extract*(CsArrowExpressionClause, info: Info): CsArrowExpressionClause = discard #TODO
proc extract*(CsAssignmentExpression, info: Info): CsAssignmentExpression = discard #TODO
proc extract*(CsAttribute, info: Info): CsAttribute = discard #TODO
proc extract*(CsAttributeArgument, info: Info): CsAttributeArgument = discard #TODO
proc extract*(CsAttributeArgumentList, info: Info): CsAttributeArgumentList = discard #TODO
proc extract*(CsAttributeList, info: Info): CsAttributeList = discard #TODO
proc extract*(CsAttributeTargetSpecifier,
    info: Info): CsAttributeTargetSpecifier = discard #TODO
proc extract*(CsAwaitExpression, info: Info): CsAwaitExpression = discard #TODO
proc extract*(CsBaseExpression, info: Info): CsBaseExpression = discard #TODO
proc extract*(CsBaseList, info: Info): CsBaseList = discard #TODO
proc extract*(CsBinaryExpression, info: Info): CsBinaryExpression = discard #TODO
proc extract*(CsBracketedArgumentList, info: Info): CsBracketedArgumentList = discard #TODO
proc extract*(CsBracketedParameterList, info: Info): CsBracketedParameterList = discard #TODO
proc extract*(CsBreakStatement, info: Info): CsBreakStatement = discard #TODO
proc extract*(CsCasePatternSwitchLabel, info: Info): CsCasePatternSwitchLabel = discard #TODO
proc extract*(CsCaseSwitchLabel, info: Info): CsCaseSwitchLabel = discard #TODO
proc extract*(CsCastExpression, info: Info): CsCastExpression = discard #TODO
proc extract*(CsCatch, info: Info): CsCatch = discard #TODO
proc extract*(CsCatchClause, info: Info): CsCatchClause = discard #TODO
proc extract*(CsCatchFilterClause, info: Info): CsCatchFilterClause = discard #TODO
proc extract*(CsCheckedExpression, info: Info): CsCheckedExpression = discard #TODO
proc extract*(CsCheckedStatement, info: Info): CsCheckedStatement = discard #TODO
proc extract*(CsClassOrStructConstraint,
    info: Info): CsClassOrStructConstraint = discard #TODO
proc extract*(CsConditionalAccessExpression,
    info: Info): CsConditionalAccessExpression = discard #TODO
proc extract*(CsConditionalExpression, info: Info): CsConditionalExpression = discard #TODO
proc extract*(CsConstantPattern, info: Info): CsConstantPattern = discard #TODO
proc extract*(CsConstructor, info: Info): CsConstructor = discard #TODO
proc extract*(CsConstructorConstraint, info: Info): CsConstructorConstraint = discard #TODO
proc extract*(CsConstructorInitializer, info: Info): CsConstructorInitializer = discard #TODO
proc extract*(CsContinueStatement, info: Info): CsContinueStatement = discard #TODO
proc extract*(CsConversionOperator, info: Info): CsConversionOperator = discard #TODO
proc extract*(CsDeclarationExpression, info: Info): CsDeclarationExpression = discard #TODO
proc extract*(CsDeclarationPattern, info: Info): CsDeclarationPattern = discard #TODO
proc extract*(CsDefaultExpression, info: Info): CsDefaultExpression = discard #TODO
proc extract*(CsDefaultSwitchLabel, info: Info): CsDefaultSwitchLabel = discard #TODO
proc extract*(CsDelegate, info: Info): CsDelegate = discard #TODO
proc extract*(CsDestructor, info: Info): CsDestructor = discard #TODO
proc extract*(CsDiscardDesignation, info: Info): CsDiscardDesignation = discard #TODO
proc extract*(CsDoStatement, info: Info): CsDoStatement = discard #TODO
proc extract*(CsElementAccessExpression,
    info: Info): CsElementAccessExpression = discard #TODO
proc extract*(CsElementBindingExpression,
    info: Info): CsElementBindingExpression = discard #TODO
proc extract*(CsElseClause, info: Info): CsElseClause = discard #TODO
proc extract*(CsEmptyStatement, info: Info): CsEmptyStatement = discard #TODO
proc extract*(CsEnum, info: Info): CsEnum = discard #TODO
proc extract*(CsEnumMember, info: Info): CsEnumMember = discard #TODO
proc extract*(CsEqualsValueClause, info: Info): CsEqualsValueClause = discard #TODO
proc extract*(CsEvent, info: Info): CsEvent = discard #TODO
proc extract*(CsEventField, info: Info): CsEventField = discard #TODO
proc extract*(CsExplicitInterfaceSpecifier,
    info: Info): CsExplicitInterfaceSpecifier = discard #TODO
proc extract*(CsExpressionStatement, info: Info): CsExpressionStatement = discard #TODO
proc extract*(CsExternAliasDirective, info: Info): CsExternAliasDirective = discard #TODO
proc extract*(CsField, info: Info): CsField = discard #TODO
proc extract*(CsFinallyClause, info: Info): CsFinallyClause = discard #TODO
proc extract*(CsFixedStatement, info: Info): CsFixedStatement = discard #TODO
proc extract*(CsForEachStatement, info: Info): CsForEachStatement = discard #TODO
proc extract*(CsForEachVariableStatement,
    info: Info): CsForEachVariableStatement = discard #TODO
proc extract*(CsForStatement, info: Info): CsForStatement = discard #TODO
proc extract*(CsFromClause, info: Info): CsFromClause = discard #TODO
proc extract*(CsGenericName, info: Info): CsGenericName = discard #TODO
proc extract*(CsGlobalStatement, info: Info): CsGlobalStatement = discard #TODO
proc extract*(CsGotoStatement, info: Info): CsGotoStatement = discard #TODO
proc extract*(CsGroupClause, info: Info): CsGroupClause = discard #TODO
proc extract*(CsIfStatement, info: Info): CsIfStatement = discard #TODO
proc extract*(CsImplicitArrayCreationExpression,
    info: Info): CsImplicitArrayCreationExpression = discard #TODO
proc extract*(CsImplicitElementAccess, info: Info): CsImplicitElementAccess = discard #TODO
proc extract*(CsIncompleteMember, info: Info): CsIncompleteMember = discard #TODO
proc extract*(CsIndexer, info: Info): CsIndexer = discard #TODO
proc extract*(CsInitializerExpression, info: Info): CsInitializerExpression = discard #TODO
proc extract*(CsInterface, info: Info): CsInterface = discard #TODO
proc extract*(CsInterpolatedStringExpression,
    info: Info): CsInterpolatedStringExpression = discard #TODO
proc extract*(CsInterpolatedStringText, info: Info): CsInterpolatedStringText = discard #TODO
proc extract*(CsInterpolation, info: Info): CsInterpolation = discard #TODO
proc extract*(CsInterpolationAlignmentClause,
    info: Info): CsInterpolationAlignmentClause = discard #TODO
proc extract*(CsInterpolationFormatClause,
    info: Info): CsInterpolationFormatClause = discard #TODO
proc extract*(CsIsPatternExpression, info: Info): CsIsPatternExpression = discard #TODO
proc extract*(CsJoinClause, info: Info): CsJoinClause = discard #TODO
proc extract*(CsJoinIntoClause, info: Info): CsJoinIntoClause = discard #TODO
proc extract*(CsLabeledStatement, info: Info): CsLabeledStatement = discard #TODO
proc extract*(CsLetClause, info: Info): CsLetClause = discard #TODO
proc extract*(CsLocalDeclarationStatement,
    info: Info): CsLocalDeclarationStatement = discard #TODO
proc extract*(CsLocalFunctionStatement, info: Info): CsLocalFunctionStatement = discard #TODO
proc extract*(CsLockStatement, info: Info): CsLockStatement = discard #TODO
proc extract*(CsMakeRefExpression, info: Info): CsMakeRefExpression = discard #TODO
proc extract*(CsMemberBindingExpression,
    info: Info): CsMemberBindingExpression = discard #TODO
proc extract*(CsNameColon, info: Info): CsNameColon = discard #TODO
proc extract*(CsNameEquals, info: Info): CsNameEquals = discard #TODO
proc extract*(CsNullableType, info: Info): CsNullableType = discard #TODO
proc extract*(CsObjectCreationExpression,
    info: Info): CsObjectCreationExpression = discard #TODO
proc extract*(CsOmittedArraySizeExpression,
    info: Info): CsOmittedArraySizeExpression = discard #TODO
proc extract*(CsOmittedTypeArgument, info: Info): CsOmittedTypeArgument = discard #TODO
proc extract*(CsOperator, info: Info): CsOperator = discard #TODO
proc extract*(CsOrderByClause, info: Info): CsOrderByClause = discard #TODO
proc extract*(CsOrdering, info: Info): CsOrdering = discard #TODO
proc extract*(CsParameter, info: Info): CsParameter = discard #TODO
proc extract*(CsParameterList, info: Info): CsParameterList = discard #TODO
proc extract*(CsParenthesizedExpression,
    info: Info): CsParenthesizedExpression = discard #TODO
proc extract*(CsParenthesizedLambdaExpression,
    info: Info): CsParenthesizedLambdaExpression = discard #TODO
proc extract*(CsParenthesizedVariableDesignation,
    info: Info): CsParenthesizedVariableDesignation = discard #TODO
proc extract*(CsPointerType, info: Info): CsPointerType = discard #TODO
proc extract*(CsPostfixUnaryExpression, info: Info): CsPostfixUnaryExpression = discard #TODO
proc extract*(CsPrefixUnaryExpression, info: Info): CsPrefixUnaryExpression = discard #TODO
proc extract*(CsProperty, info: Info): CsProperty = discard #TODO
proc extract*(CsQueryBody, info: Info): CsQueryBody = discard #TODO
proc extract*(CsQueryContinuation, info: Info): CsQueryContinuation = discard #TODO
proc extract*(CsQueryExpression, info: Info): CsQueryExpression = discard #TODO
proc extract*(CsRefExpression, info: Info): CsRefExpression = discard #TODO
proc extract*(CsRefType, info: Info): CsRefType = discard #TODO
proc extract*(CsRefTypeExpression, info: Info): CsRefTypeExpression = discard #TODO
proc extract*(CsRefValueExpression, info: Info): CsRefValueExpression = discard #TODO
proc extract*(CsReturnStatement, info: Info): CsReturnStatement = discard #TODO
proc extract*(CsSelectClause, info: Info): CsSelectClause = discard #TODO
proc extract*(CsSimpleBaseType, info: Info): CsSimpleBaseType = discard #TODO
proc extract*(CsSimpleLambdaExpression, info: Info): CsSimpleLambdaExpression = discard #TODO
proc extract*(CsSingleVariableDesignation,
    info: Info): CsSingleVariableDesignation = discard #TODO
proc extract*(CsSizeOfExpression, info: Info): CsSizeOfExpression = discard #TODO
proc extract*(CsStackAllocArrayCreationExpression,
    info: Info): CsStackAllocArrayCreationExpression = discard #TODO
proc extract*(CsStruct, info: Info): CsStruct = discard #TODO
proc extract*(CsSwitchSection, info: Info): CsSwitchSection = discard #TODO
proc extract*(CsSwitchStatement, info: Info): CsSwitchStatement = discard #TODO
proc extract*(CsThisExpression, info: Info): CsThisExpression = discard #TODO
proc extract*(CsThrowExpression, info: Info): CsThrowExpression = discard #TODO
proc extract*(CsThrowStatement, info: Info): CsThrowStatement = discard #TODO
proc extract*(CsTryStatement, info: Info): CsTryStatement = discard #TODO
proc extract*(CsTupleElement, info: Info): CsTupleElement = discard #TODO
proc extract*(CsTupleExpression, info: Info): CsTupleExpression = discard #TODO
proc extract*(CsTupleType, info: Info): CsTupleType = discard #TODO
proc extract*(CsTypeArgumentList, info: Info): CsTypeArgumentList = discard #TODO
proc extract*(CsTypeConstraint, info: Info): CsTypeConstraint = discard #TODO
proc extract*(CsTypeOfExpression, info: Info): CsTypeOfExpression = discard #TODO
proc extract*(CsTypeParameter, info: Info): CsTypeParameter = discard #TODO
proc extract*(CsTypeParameterConstraintClause,
    info: Info): CsTypeParameterConstraintClause = discard #TODO
proc extract*(CsTypeParameterList, info: Info): CsTypeParameterList = discard #TODO
proc extract*(CsUnsafeStatement, info: Info): CsUnsafeStatement = discard #TODO
proc extract*(CsUsingStatement, info: Info): CsUsingStatement = discard #TODO
proc extract*(CsWhenClause, info: Info): CsWhenClause = discard #TODO
proc extract*(CsWhereClause, info: Info): CsWhereClause = discard #TODO
proc extract*(CsWhileStatement, info: Info): CsWhileStatement = discard #TODO
proc extract*(CsYieldStatement, info: Info): CsYieldStatement = discard #TODO
