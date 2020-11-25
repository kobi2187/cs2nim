# create.nim
{.experimental: "codeReordering".}

import types
import json

# with the idea of adding the json input or C# code as Nim comments.
proc jsonWithoutSource*(n: JsonNode): JsonNode =
  var p = n.deepCopy
  p.delete("Source")
  result = p


# put here all the newCsType procs
import tables
proc newCs*(t: typedesc[CsNamespace]; name: string): CsNamespace =
  new result
  result.name = name
  result.classes = @[]
  result.classTable = newTable[string, CsClass]()
  result.enums = @[]
  result.enumTable = newTable[string, CsEnum]()
import sets

proc newCs*(t: typedesc[CsRoot]): CsRoot =
  result.ns = initHashSet[CsNamespace]()
  result.nsTables = newTable[string, CsNamespace]()

  let defaultNs = newCs(CsNamespace, "default")
  result.global = defaultNs
  result.nsTables["default"] = defaultNs

proc newCs*(t: typedesc[CsMethod]; name: string): CsMethod =
  new result
  result.name = name
proc newCs*(t: typedesc[CsPredefinedType]; name: string): CsPredefinedType =
  new result
  result.name = name

proc newCs*(t: typedesc[CsParameterList]): CsParameterList =
  new result # start empty.

proc newCs*(t: typedesc[CsParameter]; a, b: string): CsParameter =
  new result
  result.name = a
  result.ptype = b

proc newCs*(t: typedesc[CsAccessor]; a, b, c, d: auto): CsAccessor =
  new result
proc newCs*(t: typedesc[CsAccessorList]; a, b, c, d: auto): CsAccessorList =
  new result
proc newCs*(t: typedesc[CsAliasQualifiedName]; a, b, c, d: auto): CsAliasQualifiedName =
  new result
proc newCs*(t: typedesc[CsAnonymousMethodExpression]; a, b, c, d: auto): CsAnonymousMethodExpression =
  new result
proc newCs*(t: typedesc[CsAnonymousObjectCreationExpression]; a, b, c, d: auto): CsAnonymousObjectCreationExpression =
  new result
proc newCs*(t: typedesc[CsAnonymousObjectMemberDeclarator]; a, b, c, d: auto): CsAnonymousObjectMemberDeclarator =
  new result
proc newCs*(t: typedesc[CsArgument]; a, b, c, d: auto): CsArgument =
  new result
proc newCs*(t: typedesc[CsArrayCreationExpression]; a, b, c, d: auto): CsArrayCreationExpression =
  new result
proc newCs*(t: typedesc[CsArrayRankSpecifier]; a, b, c, d: auto): CsArrayRankSpecifier =
  new result
proc newCs*(t: typedesc[CsArrayType]; a, b, c, d: auto): CsArrayType =
  new result
proc newCs*(t: typedesc[CsArrowExpressionClause]; a, b, c, d: auto): CsArrowExpressionClause =
  new result
proc newCs*(t: typedesc[CsAssignmentExpression]; a, b, c, d: auto): CsAssignmentExpression =
  new result
proc newCs*(t: typedesc[CsAttribute]; a, b, c, d: auto): CsAttribute =
  new result
proc newCs*(t: typedesc[CsAttributeArgument]; a, b, c, d: auto): CsAttributeArgument =
  new result
proc newCs*(t: typedesc[CsAttributeArgumentList]; a, b, c, d: auto): CsAttributeArgumentList =
  new result
proc newCs*(t: typedesc[CsAttributeList]; a, b, c, d: auto): CsAttributeList =
  new result
proc newCs*(t: typedesc[CsAttributeTargetSpecifier]; a, b, c, d: auto): CsAttributeTargetSpecifier =
  new result
proc newCs*(t: typedesc[CsAwaitExpression]; a, b, c, d: auto): CsAwaitExpression =
  new result
proc newCs*(t: typedesc[CsBaseExpression]; a, b, c, d: auto): CsBaseExpression =
  new result
proc newCs*(t: typedesc[CsBaseList]; a, b, c, d: auto): CsBaseList =
  new result
proc newCs*(t: typedesc[CsBinaryExpression]; a, b, c, d: auto): CsBinaryExpression =
  new result
proc newCs*(t: typedesc[CsBracketedArgumentList]; a, b, c, d: auto): CsBracketedArgumentList =
  new result
proc newCs*(t: typedesc[CsBracketedParameterList]; a, b, c, d: auto): CsBracketedParameterList =
  new result
proc newCs*(t: typedesc[CsBreakStatement]; a, b, c, d: auto): CsBreakStatement =
  new result
proc newCs*(t: typedesc[CsCasePatternSwitchLabel]; a, b, c, d: auto): CsCasePatternSwitchLabel =
  new result
proc newCs*(t: typedesc[CsCaseSwitchLabel]; a, b, c, d: auto): CsCaseSwitchLabel =
  new result
proc newCs*(t: typedesc[CsCastExpression]; a, b, c, d: auto): CsCastExpression =
  new result
proc newCs*(t: typedesc[CsCatch]; a, b, c, d: auto): CsCatch =
  new result
proc newCs*(t: typedesc[CsCatchClause]; a, b, c, d: auto): CsCatchClause =
  new result
proc newCs*(t: typedesc[CsCatchFilterClause]; a, b, c, d: auto): CsCatchFilterClause =
  new result
proc newCs*(t: typedesc[CsCheckedExpression]; a, b, c, d: auto): CsCheckedExpression =
  new result
proc newCs*(t: typedesc[CsCheckedStatement]; a, b, c, d: auto): CsCheckedStatement =
  new result
proc newCs*(t: typedesc[CsClassOrStructConstraint]; a, b, c, d: auto): CsClassOrStructConstraint =
  new result
proc newCs*(t: typedesc[CsConditionalAccessExpression]; a, b, c, d: auto): CsConditionalAccessExpression =
  new result
proc newCs*(t: typedesc[CsConditionalExpression]; a, b, c, d: auto): CsConditionalExpression =
  new result
proc newCs*(t: typedesc[CsConstantPattern]; a, b, c, d: auto): CsConstantPattern =
  new result
proc newCs*(t: typedesc[CsConstructor]; a, b, c, d: auto): CsConstructor =
  new result
proc newCs*(t: typedesc[CsConstructorConstraint]; a, b, c, d: auto): CsConstructorConstraint =
  new result
proc newCs*(t: typedesc[CsConstructorInitializer]; a, b, c, d: auto): CsConstructorInitializer =
  new result
proc newCs*(t: typedesc[CsContinueStatement]; a, b, c, d: auto): CsContinueStatement =
  new result
proc newCs*(t: typedesc[CsConversionOperator]; a, b, c, d: auto): CsConversionOperator =
  new result
proc newCs*(t: typedesc[CsDeclarationExpression]; a, b, c, d: auto): CsDeclarationExpression =
  new result
proc newCs*(t: typedesc[CsDeclarationPattern]; a, b, c, d: auto): CsDeclarationPattern =
  new result
proc newCs*(t: typedesc[CsDefaultExpression]; a, b, c, d: auto): CsDefaultExpression =
  new result
proc newCs*(t: typedesc[CsDefaultSwitchLabel]; a, b, c, d: auto): CsDefaultSwitchLabel =
  new result
proc newCs*(t: typedesc[CsDelegate]; a, b, c, d: auto): CsDelegate =
  new result
proc newCs*(t: typedesc[CsDestructor]; a, b, c, d: auto): CsDestructor =
  new result
proc newCs*(t: typedesc[CsDiscardDesignation]; a, b, c, d: auto): CsDiscardDesignation =
  new result
proc newCs*(t: typedesc[CsDoStatement]; a, b, c, d: auto): CsDoStatement =
  new result
proc newCs*(t: typedesc[CsElementAccessExpression]; a, b, c, d: auto): CsElementAccessExpression =
  new result
proc newCs*(t: typedesc[CsElementBindingExpression]; a, b, c, d: auto): CsElementBindingExpression =
  new result
proc newCs*(t: typedesc[CsElseClause]; a, b, c, d: auto): CsElseClause =
  new result
proc newCs*(t: typedesc[CsEmptyStatement]; a, b, c, d: auto): CsEmptyStatement =
  new result

proc newCs*(t: typedesc[CsEnum]; name: auto): CsEnum =
  new result
  result.name = name

proc newCs*(t: typedesc[CsEnumMember]; name, value: auto): CsEnumMember =
  new result
  result.name = name
  result.value = value


proc newCs*(t: typedesc[CsEqualsValueClause]; a, b, c, d: auto): CsEqualsValueClause =
  new result
proc newCs*(t: typedesc[CsEvent]; a, b, c, d: auto): CsEvent =
  new result
proc newCs*(t: typedesc[CsEventField]; a, b, c, d: auto): CsEventField =
  new result
proc newCs*(t: typedesc[CsExplicitInterfaceSpecifier]; a, b, c, d: auto): CsExplicitInterfaceSpecifier =
  new result
proc newCs*(t: typedesc[CsExpressionStatement]; a, b, c, d: auto): CsExpressionStatement =
  new result
proc newCs*(t: typedesc[CsExternAliasDirective]; a, b, c, d: auto): CsExternAliasDirective =
  new result
proc newCs*(t: typedesc[CsField]; a, b, c, d: auto): CsField =
  new result
proc newCs*(t: typedesc[CsFinallyClause]; a, b, c, d: auto): CsFinallyClause =
  new result
proc newCs*(t: typedesc[CsFixedStatement]; a, b, c, d: auto): CsFixedStatement =
  new result
proc newCs*(t: typedesc[CsForEachStatement]; a, b, c, d: auto): CsForEachStatement =
  new result
proc newCs*(t: typedesc[CsForEachVariableStatement]; a, b, c, d: auto): CsForEachVariableStatement =
  new result
proc newCs*(t: typedesc[CsForStatement]; a, b, c, d: auto): CsForStatement =
  new result
proc newCs*(t: typedesc[CsFromClause]; a, b, c, d: auto): CsFromClause =
  new result
proc newCs*(t: typedesc[CsGenericName]; a, b, c, d: auto): CsGenericName =
  new result
proc newCs*(t: typedesc[CsGlobalStatement]; a, b, c, d: auto): CsGlobalStatement =
  new result
proc newCs*(t: typedesc[CsGotoStatement]; a, b, c, d: auto): CsGotoStatement =
  new result
proc newCs*(t: typedesc[CsGroupClause]; a, b, c, d: auto): CsGroupClause =
  new result
proc newCs*(t: typedesc[CsIfStatement]; a, b, c, d: auto): CsIfStatement =
  new result
proc newCs*(t: typedesc[CsImplicitArrayCreationExpression]; a, b, c, d: auto): CsImplicitArrayCreationExpression =
  new result
proc newCs*(t: typedesc[CsImplicitElementAccess]; a, b, c, d: auto): CsImplicitElementAccess =
  new result
proc newCs*(t: typedesc[CsIncompleteMember]; a, b, c, d: auto): CsIncompleteMember =
  new result
proc newCs*(t: typedesc[CsIndexer]; a, b, c, d: auto): CsIndexer =
  new result
proc newCs*(t: typedesc[CsInitializerExpression]; a, b, c, d: auto): CsInitializerExpression =
  new result
proc newCs*(t: typedesc[CsInterface]; a, b, c, d: auto): CsInterface =
  new result
proc newCs*(t: typedesc[CsInterpolatedStringExpression]; a, b, c, d: auto): CsInterpolatedStringExpression =
  new result
proc newCs*(t: typedesc[CsInterpolatedStringText]; a, b, c, d: auto): CsInterpolatedStringText =
  new result
proc newCs*(t: typedesc[CsInterpolation]; a, b, c, d: auto): CsInterpolation =
  new result
proc newCs*(t: typedesc[CsInterpolationAlignmentClause]; a, b, c, d: auto): CsInterpolationAlignmentClause =
  new result
proc newCs*(t: typedesc[CsInterpolationFormatClause]; a, b, c, d: auto): CsInterpolationFormatClause =
  new result
proc newCs*(t: typedesc[CsIsPatternExpression]; a, b, c, d: auto): CsIsPatternExpression =
  new result
proc newCs*(t: typedesc[CsJoinClause]; a, b, c, d: auto): CsJoinClause =
  new result
proc newCs*(t: typedesc[CsJoinIntoClause]; a, b, c, d: auto): CsJoinIntoClause =
  new result
proc newCs*(t: typedesc[CsLabeledStatement]; a, b, c, d: auto): CsLabeledStatement =
  new result
proc newCs*(t: typedesc[CsLetClause]; a, b, c, d: auto): CsLetClause =
  new result
proc newCs*(t: typedesc[CsLocalDeclarationStatement]; a, b, c, d: auto): CsLocalDeclarationStatement =
  new result
proc newCs*(t: typedesc[CsLocalFunctionStatement]; a, b, c, d: auto): CsLocalFunctionStatement =
  new result
proc newCs*(t: typedesc[CsLockStatement]; a, b, c, d: auto): CsLockStatement =
  new result
proc newCs*(t: typedesc[CsMakeRefExpression]; a, b, c, d: auto): CsMakeRefExpression =
  new result
proc newCs*(t: typedesc[CsMemberBindingExpression]; a, b, c, d: auto): CsMemberBindingExpression =
  new result
proc newCs*(t: typedesc[CsNameColon]; a, b, c, d: auto): CsNameColon =
  new result
proc newCs*(t: typedesc[CsNameEquals]; a, b, c, d: auto): CsNameEquals =
  new result
proc newCs*(t: typedesc[CsNullableType]; a, b, c, d: auto): CsNullableType =
  new result
proc newCs*(t: typedesc[CsObjectCreationExpression]; a, b, c, d: auto): CsObjectCreationExpression =
  new result
proc newCs*(t: typedesc[CsOmittedArraySizeExpression]; a, b, c, d: auto): CsOmittedArraySizeExpression =
  new result
proc newCs*(t: typedesc[CsOmittedTypeArgument]; a, b, c, d: auto): CsOmittedTypeArgument =
  new result
proc newCs*(t: typedesc[CsOperator]; a, b, c, d: auto): CsOperator =
  new result
proc newCs*(t: typedesc[CsOrderByClause]; a, b, c, d: auto): CsOrderByClause =
  new result
proc newCs*(t: typedesc[CsOrdering]; a, b, c, d: auto): CsOrdering =
  new result


proc newCs*(t: typedesc[CsParenthesizedExpression]; a, b, c, d: auto): CsParenthesizedExpression =
  new result
proc newCs*(t: typedesc[CsParenthesizedLambdaExpression]; a, b, c, d: auto): CsParenthesizedLambdaExpression =
  new result
proc newCs*(t: typedesc[CsParenthesizedVariableDesignation]; a, b, c, d: auto): CsParenthesizedVariableDesignation =
  new result
proc newCs*(t: typedesc[CsPointerType]; a, b, c, d: auto): CsPointerType =
  new result
proc newCs*(t: typedesc[CsPostfixUnaryExpression]; a, b, c, d: auto): CsPostfixUnaryExpression =
  new result
proc newCs*(t: typedesc[CsPrefixUnaryExpression]; a, b, c, d: auto): CsPrefixUnaryExpression =
  new result
proc newCs*(t: typedesc[CsProperty]; a, b, c, d: auto): CsProperty =
  new result
proc newCs*(t: typedesc[CsQueryBody]; a, b, c, d: auto): CsQueryBody =
  new result
proc newCs*(t: typedesc[CsQueryContinuation]; a, b, c, d: auto): CsQueryContinuation =
  new result
proc newCs*(t: typedesc[CsQueryExpression]; a, b, c, d: auto): CsQueryExpression =
  new result
proc newCs*(t: typedesc[CsRefExpression]; a, b, c, d: auto): CsRefExpression =
  new result
proc newCs*(t: typedesc[CsRefType]; a, b, c, d: auto): CsRefType =
  new result
proc newCs*(t: typedesc[CsRefTypeExpression]; a, b, c, d: auto): CsRefTypeExpression =
  new result
proc newCs*(t: typedesc[CsRefValueExpression]; a, b, c, d: auto): CsRefValueExpression =
  new result
proc newCs*(t: typedesc[CsReturnStatement]; a, b, c, d: auto): CsReturnStatement =
  new result
proc newCs*(t: typedesc[CsSelectClause]; a, b, c, d: auto): CsSelectClause =
  new result
proc newCs*(t: typedesc[CsSimpleBaseType]; a, b, c, d: auto): CsSimpleBaseType =
  new result
proc newCs*(t: typedesc[CsSimpleLambdaExpression]; a, b, c, d: auto): CsSimpleLambdaExpression =
  new result
proc newCs*(t: typedesc[CsSingleVariableDesignation]; a, b, c, d: auto): CsSingleVariableDesignation =
  new result
proc newCs*(t: typedesc[CsSizeOfExpression]; a, b, c, d: auto): CsSizeOfExpression =
  new result
proc newCs*(t: typedesc[CsStackAllocArrayCreationExpression]; a, b, c, d: auto): CsStackAllocArrayCreationExpression =
  new result
proc newCs*(t: typedesc[CsStruct]; a, b, c, d: auto): CsStruct =
  new result
proc newCs*(t: typedesc[CsSwitchSection]; a, b, c, d: auto): CsSwitchSection =
  new result
proc newCs*(t: typedesc[CsSwitchStatement]; a, b, c, d: auto): CsSwitchStatement =
  new result
proc newCs*(t: typedesc[CsThisExpression]; a, b, c, d: auto): CsThisExpression =
  new result
proc newCs*(t: typedesc[CsThrowExpression]; a, b, c, d: auto): CsThrowExpression =
  new result
proc newCs*(t: typedesc[CsThrowStatement]; a, b, c, d: auto): CsThrowStatement =
  new result
proc newCs*(t: typedesc[CsTryStatement]; a, b, c, d: auto): CsTryStatement =
  new result
proc newCs*(t: typedesc[CsTupleElement]; a, b, c, d: auto): CsTupleElement =
  new result
proc newCs*(t: typedesc[CsTupleExpression]; a, b, c, d: auto): CsTupleExpression =
  new result
proc newCs*(t: typedesc[CsTupleType]; a, b, c, d: auto): CsTupleType =
  new result
proc newCs*(t: typedesc[CsTypeArgumentList]; a, b, c, d: auto): CsTypeArgumentList =
  new result
proc newCs*(t: typedesc[CsTypeConstraint]; a, b, c, d: auto): CsTypeConstraint =
  new result
proc newCs*(t: typedesc[CsTypeOfExpression]; a, b, c, d: auto): CsTypeOfExpression =
  new result
proc newCs*(t: typedesc[CsTypeParameter]; a, b, c, d: auto): CsTypeParameter =
  new result
proc newCs*(t: typedesc[CsTypeParameterConstraintClause]; a, b, c, d: auto): CsTypeParameterConstraintClause =
  new result
proc newCs*(t: typedesc[CsTypeParameterList]; a, b, c, d: auto): CsTypeParameterList =
  new result
proc newCs*(t: typedesc[CsUnsafeStatement]; a, b, c, d: auto): CsUnsafeStatement =
  new result
proc newCs*(t: typedesc[CsUsingStatement]; a, b, c, d: auto): CsUsingStatement =
  new result
proc newCs*(t: typedesc[CsWhenClause]; a, b, c, d: auto): CsWhenClause =
  new result
proc newCs*(t: typedesc[CsWhereClause]; a, b, c, d: auto): CsWhereClause =
  new result
proc newCs*(t: typedesc[CsWhileStatement]; a, b, c, d: auto): CsWhileStatement =
  new result
proc newCs*(t: typedesc[CsYieldStatement]; a, b, c, d: auto): CsYieldStatement =
  new result
