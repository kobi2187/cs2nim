# create.nim

import types

import json

# with the idea of adding the json input or C# code as Nim comments.
proc jsonWithoutSource*(n: JsonNode): JsonNode =
  var p = n.deepCopy
  p.delete("Source")
  result = p


# put here all the newCsType procs
import tables, strutils
proc newCsNamespace*(name: string): CsNamespace =
  new result
  result.name = name.toLowerAscii
  result.classes = @[]
  result.classTable = newTable[string, CsClass]()

proc newCsRoot*(): CsRoot =
  result.ns = @[]
  result.nsTables = newTable[string, CsNamespace]()

  let defaultNs = newCsNamespace("default")
  result.global = defaultNs
  result.nsTables["default"] = defaultNs

proc newCsAccessor*(a, b, c, d: auto): CsAccessor =
  new result
proc newCsAccessorList*(a, b, c, d: auto): CsAccessorList =
  new result
proc newCsAliasQualifiedName*(a, b, c, d: auto): CsAliasQualifiedName =
  new result
proc newCsAnonymousMethodExpression*(a, b, c,
    d: auto): CsAnonymousMethodExpression =
  new result
proc newCsAnonymousObjectCreationExpression*(a, b, c,
    d: auto): CsAnonymousObjectCreationExpression =
  new result
proc newCsAnonymousObjectMemberDeclarator*(a, b, c,
    d: auto): CsAnonymousObjectMemberDeclarator =
  new result
proc newCsArgument*(a, b, c, d: auto): CsArgument =
  new result
proc newCsArrayCreationExpression*(a, b, c,
    d: auto): CsArrayCreationExpression =
  new result
proc newCsArrayRankSpecifier*(a, b, c, d: auto): CsArrayRankSpecifier =
  new result
proc newCsArrayType*(a, b, c, d: auto): CsArrayType =
  new result
proc newCsArrowExpressionClause*(a, b, c, d: auto): CsArrowExpressionClause =
  new result
proc newCsAssignmentExpression*(a, b, c, d: auto): CsAssignmentExpression =
  new result
proc newCsAttribute*(a, b, c, d: auto): CsAttribute =
  new result
proc newCsAttributeArgument*(a, b, c, d: auto): CsAttributeArgument =
  new result
proc newCsAttributeArgumentList*(a, b, c, d: auto): CsAttributeArgumentList =
  new result
proc newCsAttributeList*(a, b, c, d: auto): CsAttributeList =
  new result
proc newCsAttributeTargetSpecifier*(a, b, c,
    d: auto): CsAttributeTargetSpecifier =
  new result
proc newCsAwaitExpression*(a, b, c, d: auto): CsAwaitExpression =
  new result
proc newCsBaseExpression*(a, b, c, d: auto): CsBaseExpression =
  new result
proc newCsBaseList*(a, b, c, d: auto): CsBaseList =
  new result
proc newCsBinaryExpression*(a, b, c, d: auto): CsBinaryExpression =
  new result
proc newCsBracketedArgumentList*(a, b, c, d: auto): CsBracketedArgumentList =
  new result
proc newCsBracketedParameterList*(a, b, c, d: auto): CsBracketedParameterList =
  new result
proc newCsBreakStatement*(a, b, c, d: auto): CsBreakStatement =
  new result
proc newCsCasePatternSwitchLabel*(a, b, c, d: auto): CsCasePatternSwitchLabel =
  new result
proc newCsCaseSwitchLabel*(a, b, c, d: auto): CsCaseSwitchLabel =
  new result
proc newCsCastExpression*(a, b, c, d: auto): CsCastExpression =
  new result
proc newCsCatch*(a, b, c, d: auto): CsCatch =
  new result
proc newCsCatchClause*(a, b, c, d: auto): CsCatchClause =
  new result
proc newCsCatchFilterClause*(a, b, c, d: auto): CsCatchFilterClause =
  new result
proc newCsCheckedExpression*(a, b, c, d: auto): CsCheckedExpression =
  new result
proc newCsCheckedStatement*(a, b, c, d: auto): CsCheckedStatement =
  new result
proc newCsClassOrStructConstraint*(a, b, c,
    d: auto): CsClassOrStructConstraint =
  new result
proc newCsConditionalAccessExpression*(a, b, c,
    d: auto): CsConditionalAccessExpression =
  new result
proc newCsConditionalExpression*(a, b, c, d: auto): CsConditionalExpression =
  new result
proc newCsConstantPattern*(a, b, c, d: auto): CsConstantPattern =
  new result
proc newCsConstructor*(a, b, c, d: auto): CsConstructor =
  new result
proc newCsConstructorConstraint*(a, b, c, d: auto): CsConstructorConstraint =
  new result
proc newCsConstructorInitializer*(a, b, c, d: auto): CsConstructorInitializer =
  new result
proc newCsContinueStatement*(a, b, c, d: auto): CsContinueStatement =
  new result
proc newCsConversionOperator*(a, b, c, d: auto): CsConversionOperator =
  new result
proc newCsDeclarationExpression*(a, b, c, d: auto): CsDeclarationExpression =
  new result
proc newCsDeclarationPattern*(a, b, c, d: auto): CsDeclarationPattern =
  new result
proc newCsDefaultExpression*(a, b, c, d: auto): CsDefaultExpression =
  new result
proc newCsDefaultSwitchLabel*(a, b, c, d: auto): CsDefaultSwitchLabel =
  new result
proc newCsDelegate*(a, b, c, d: auto): CsDelegate =
  new result
proc newCsDestructor*(a, b, c, d: auto): CsDestructor =
  new result
proc newCsDiscardDesignation*(a, b, c, d: auto): CsDiscardDesignation =
  new result
proc newCsDoStatement*(a, b, c, d: auto): CsDoStatement =
  new result
proc newCsElementAccessExpression*(a, b, c,
    d: auto): CsElementAccessExpression =
  new result
proc newCsElementBindingExpression*(a, b, c,
    d: auto): CsElementBindingExpression =
  new result
proc newCsElseClause*(a, b, c, d: auto): CsElseClause =
  new result
proc newCsEmptyStatement*(a, b, c, d: auto): CsEmptyStatement =
  new result
proc newCsEnum*(a, b, c, d: auto): CsEnum =
  new result
proc newCsEnumMember*(a, b, c, d: auto): CsEnumMember =
  new result
proc newCsEqualsValueClause*(a, b, c, d: auto): CsEqualsValueClause =
  new result
proc newCsEvent*(a, b, c, d: auto): CsEvent =
  new result
proc newCsEventField*(a, b, c, d: auto): CsEventField =
  new result
proc newCsExplicitInterfaceSpecifier*(a, b, c,
    d: auto): CsExplicitInterfaceSpecifier =
  new result
proc newCsExpressionStatement*(a, b, c, d: auto): CsExpressionStatement =
  new result
proc newCsExternAliasDirective*(a, b, c, d: auto): CsExternAliasDirective =
  new result
proc newCsField*(a, b, c, d: auto): CsField =
  new result
proc newCsFinallyClause*(a, b, c, d: auto): CsFinallyClause =
  new result
proc newCsFixedStatement*(a, b, c, d: auto): CsFixedStatement =
  new result
proc newCsForEachStatement*(a, b, c, d: auto): CsForEachStatement =
  new result
proc newCsForEachVariableStatement*(a, b, c,
    d: auto): CsForEachVariableStatement =
  new result
proc newCsForStatement*(a, b, c, d: auto): CsForStatement =
  new result
proc newCsFromClause*(a, b, c, d: auto): CsFromClause =
  new result
proc newCsGenericName*(a, b, c, d: auto): CsGenericName =
  new result
proc newCsGlobalStatement*(a, b, c, d: auto): CsGlobalStatement =
  new result
proc newCsGotoStatement*(a, b, c, d: auto): CsGotoStatement =
  new result
proc newCsGroupClause*(a, b, c, d: auto): CsGroupClause =
  new result
proc newCsIfStatement*(a, b, c, d: auto): CsIfStatement =
  new result
proc newCsImplicitArrayCreationExpression*(a, b, c,
    d: auto): CsImplicitArrayCreationExpression =
  new result
proc newCsImplicitElementAccess*(a, b, c, d: auto): CsImplicitElementAccess =
  new result
proc newCsIncompleteMember*(a, b, c, d: auto): CsIncompleteMember =
  new result
proc newCsIndexer*(a, b, c, d: auto): CsIndexer =
  new result
proc newCsInitializerExpression*(a, b, c, d: auto): CsInitializerExpression =
  new result
proc newCsInterface*(a, b, c, d: auto): CsInterface =
  new result
proc newCsInterpolatedStringExpression*(a, b, c,
    d: auto): CsInterpolatedStringExpression =
  new result
proc newCsInterpolatedStringText*(a, b, c, d: auto): CsInterpolatedStringText =
  new result
proc newCsInterpolation*(a, b, c, d: auto): CsInterpolation =
  new result
proc newCsInterpolationAlignmentClause*(a, b, c,
    d: auto): CsInterpolationAlignmentClause =
  new result
proc newCsInterpolationFormatClause*(a, b, c,
    d: auto): CsInterpolationFormatClause =
  new result
proc newCsIsPatternExpression*(a, b, c, d: auto): CsIsPatternExpression =
  new result
proc newCsJoinClause*(a, b, c, d: auto): CsJoinClause =
  new result
proc newCsJoinIntoClause*(a, b, c, d: auto): CsJoinIntoClause =
  new result
proc newCsLabeledStatement*(a, b, c, d: auto): CsLabeledStatement =
  new result
proc newCsLetClause*(a, b, c, d: auto): CsLetClause =
  new result
proc newCsLocalDeclarationStatement*(a, b, c,
    d: auto): CsLocalDeclarationStatement =
  new result
proc newCsLocalFunctionStatement*(a, b, c, d: auto): CsLocalFunctionStatement =
  new result
proc newCsLockStatement*(a, b, c, d: auto): CsLockStatement =
  new result
proc newCsMakeRefExpression*(a, b, c, d: auto): CsMakeRefExpression =
  new result
proc newCsMemberBindingExpression*(a, b, c,
    d: auto): CsMemberBindingExpression =
  new result
proc newCsNameColon*(a, b, c, d: auto): CsNameColon =
  new result
proc newCsNameEquals*(a, b, c, d: auto): CsNameEquals =
  new result
proc newCsNullableType*(a, b, c, d: auto): CsNullableType =
  new result
proc newCsObjectCreationExpression*(a, b, c,
    d: auto): CsObjectCreationExpression =
  new result
proc newCsOmittedArraySizeExpression*(a, b, c,
    d: auto): CsOmittedArraySizeExpression =
  new result
proc newCsOmittedTypeArgument*(a, b, c, d: auto): CsOmittedTypeArgument =
  new result
proc newCsOperator*(a, b, c, d: auto): CsOperator =
  new result
proc newCsOrderByClause*(a, b, c, d: auto): CsOrderByClause =
  new result
proc newCsOrdering*(a, b, c, d: auto): CsOrdering =
  new result
proc newCsParameter*(a, b, c, d: auto): CsParameter =
  new result
proc newCsParameterList*(a, b, c, d: auto): CsParameterList =
  new result
proc newCsParenthesizedExpression*(a, b, c,
    d: auto): CsParenthesizedExpression =
  new result
proc newCsParenthesizedLambdaExpression*(a, b, c,
    d: auto): CsParenthesizedLambdaExpression =
  new result
proc newCsParenthesizedVariableDesignation*(a, b, c,
    d: auto): CsParenthesizedVariableDesignation =
  new result
proc newCsPointerType*(a, b, c, d: auto): CsPointerType =
  new result
proc newCsPostfixUnaryExpression*(a, b, c, d: auto): CsPostfixUnaryExpression =
  new result
proc newCsPrefixUnaryExpression*(a, b, c, d: auto): CsPrefixUnaryExpression =
  new result
proc newCsProperty*(a, b, c, d: auto): CsProperty =
  new result
proc newCsQueryBody*(a, b, c, d: auto): CsQueryBody =
  new result
proc newCsQueryContinuation*(a, b, c, d: auto): CsQueryContinuation =
  new result
proc newCsQueryExpression*(a, b, c, d: auto): CsQueryExpression =
  new result
proc newCsRefExpression*(a, b, c, d: auto): CsRefExpression =
  new result
proc newCsRefType*(a, b, c, d: auto): CsRefType =
  new result
proc newCsRefTypeExpression*(a, b, c, d: auto): CsRefTypeExpression =
  new result
proc newCsRefValueExpression*(a, b, c, d: auto): CsRefValueExpression =
  new result
proc newCsReturnStatement*(a, b, c, d: auto): CsReturnStatement =
  new result
proc newCsSelectClause*(a, b, c, d: auto): CsSelectClause =
  new result
proc newCsSimpleBaseType*(a, b, c, d: auto): CsSimpleBaseType =
  new result
proc newCsSimpleLambdaExpression*(a, b, c, d: auto): CsSimpleLambdaExpression =
  new result
proc newCsSingleVariableDesignation*(a, b, c,
    d: auto): CsSingleVariableDesignation =
  new result
proc newCsSizeOfExpression*(a, b, c, d: auto): CsSizeOfExpression =
  new result
proc newCsStackAllocArrayCreationExpression*(a, b, c,
    d: auto): CsStackAllocArrayCreationExpression =
  new result
proc newCsStruct*(a, b, c, d: auto): CsStruct =
  new result
proc newCsSwitchSection*(a, b, c, d: auto): CsSwitchSection =
  new result
proc newCsSwitchStatement*(a, b, c, d: auto): CsSwitchStatement =
  new result
proc newCsThisExpression*(a, b, c, d: auto): CsThisExpression =
  new result
proc newCsThrowExpression*(a, b, c, d: auto): CsThrowExpression =
  new result
proc newCsThrowStatement*(a, b, c, d: auto): CsThrowStatement =
  new result
proc newCsTryStatement*(a, b, c, d: auto): CsTryStatement =
  new result
proc newCsTupleElement*(a, b, c, d: auto): CsTupleElement =
  new result
proc newCsTupleExpression*(a, b, c, d: auto): CsTupleExpression =
  new result
proc newCsTupleType*(a, b, c, d: auto): CsTupleType =
  new result
proc newCsTypeArgumentList*(a, b, c, d: auto): CsTypeArgumentList =
  new result
proc newCsTypeConstraint*(a, b, c, d: auto): CsTypeConstraint =
  new result
proc newCsTypeOfExpression*(a, b, c, d: auto): CsTypeOfExpression =
  new result
proc newCsTypeParameter*(a, b, c, d: auto): CsTypeParameter =
  new result
proc newCsTypeParameterConstraintClause*(a, b, c,
    d: auto): CsTypeParameterConstraintClause =
  new result
proc newCsTypeParameterList*(a, b, c, d: auto): CsTypeParameterList =
  new result
proc newCsUnsafeStatement*(a, b, c, d: auto): CsUnsafeStatement =
  new result
proc newCsUsingStatement*(a, b, c, d: auto): CsUsingStatement =
  new result
proc newCsWhenClause*(a, b, c, d: auto): CsWhenClause =
  new result
proc newCsWhereClause*(a, b, c, d: auto): CsWhereClause =
  new result
proc newCsWhileStatement*(a, b, c, d: auto): CsWhileStatement =
  new result
proc newCsYieldStatement*(a, b, c, d: auto): CsYieldStatement =
  new result
