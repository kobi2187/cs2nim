# extract.nim

import types, state, create
import tables, options

func extractCsNamespace*(info: Info): CsNamespace =
  result = newCs(CsNamespace, info.essentials[0], "", "", "")
import strutils
proc addNamespace*(root: var CsRoot; csn: CsNamespace) =
  root.ns.add(csn)
  let name = csn.name #.toLowerAscii
  echo name
  root.nsTables[name] = csn

proc addNamespace*(root: var CsRoot; ns: string) =
  let csn = newCs(CsNamespace, ns)
  root.addNamespace(csn)

proc extractClass*(info: Info): CsClass =
  # new result
  let name = info.essentials[0]
  result = CsClass(name: name)

proc addClass*(ns: CsNamespace; class: CsClass) =
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
proc extract*(t: typedesc[CsEnum]; info: Info): CsEnum =
  let name = info.essentials[0]
  result = newCsEnum(name)

proc extract*(t: typedesc[CsEnumMember]; info: Info): CsEnumMember =
  let name = info.essentials[0]
  let value =
    if info.essentials.len < 2: none(int)
    else:
      let it = info.essentials[1]
      some(parseInt(it))

  result = newCsEnumMember(name, value)

# proc extract*[T](t: typedesc[T]; info: Info): T = discard

proc extract*(t: typedesc[CsArgument]; info: Info): CsArgument = discard
proc extract*(t: typedesc[CsExpressionStatement];
    info: Info): CsExpressionStatement = discard #TODO
proc extract*(t: typedesc[CsBinaryExpression]; info: Info): CsBinaryExpression = discard #TODO
proc extract*(t: typedesc[CsParameter]; info: Info): CsParameter = discard #TODO
proc extract*(t: typedesc[CsAssignmentExpression];
    info: Info): CsAssignmentExpression = discard #TODO
proc extract*(t: typedesc[CsEqualsValueClause];
    info: Info): CsEqualsValueClause = discard #TODO
proc extract*(t: typedesc[CsParameterList]; info: Info): CsParameterList = discard #TODO
proc extract*(t: typedesc[CsLocalDeclarationStatement];
    info: Info): CsLocalDeclarationStatement = discard #TODO
proc extract*(t: typedesc[CsObjectCreationExpression];
    info: Info): CsObjectCreationExpression = discard #TODO
proc extract*(t: typedesc[CsReturnStatement]; info: Info): CsReturnStatement = discard #TODO
proc extract*(t: typedesc[CsIfStatement]; info: Info): CsIfStatement = discard #TODO
proc extract*(t: typedesc[CsAttribute]; info: Info): CsAttribute = discard #TODO
proc extract*(t: typedesc[CsAttributeList]; info: Info): CsAttributeList = discard #TODO
proc extract*(t: typedesc[CsThisExpression]; info: Info): CsThisExpression = discard #TODO
proc extract*(t: typedesc[CsTypeArgumentList]; info: Info): CsTypeArgumentList = discard #TODO
proc extract*(t: typedesc[CsGenericName]; info: Info): CsGenericName = discard #TODO
proc extract*(t: typedesc[CsAttributeArgument];
    info: Info): CsAttributeArgument = discard #TODO
proc extract*(t: typedesc[CsAccessor]; info: Info): CsAccessor = discard #TODO
proc extract*(t: typedesc[CsField]; info: Info): CsField = discard #TODO
proc extract*(t: typedesc[CsBracketedArgumentList];
    info: Info): CsBracketedArgumentList = discard #TODO
proc extract*(t: typedesc[CsElementAccessExpression];
    info: Info): CsElementAccessExpression = discard #TODO
proc extract*(t: typedesc[CsProperty]; info: Info): CsProperty = discard #TODO
proc extract*(t: typedesc[CsAccessorList]; info: Info): CsAccessorList = discard #TODO
proc extract*(t: typedesc[CsAttributeArgumentList];
    info: Info): CsAttributeArgumentList = discard #TODO
proc extract*(t: typedesc[CsParenthesizedExpression];
    info: Info): CsParenthesizedExpression = discard #TODO
proc extract*(t: typedesc[CsCastExpression]; info: Info): CsCastExpression = discard #TODO
proc extract*(t: typedesc[CsArrayRankSpecifier];
    info: Info): CsArrayRankSpecifier = discard #TODO
proc extract*(t: typedesc[CsArrayType]; info: Info): CsArrayType = discard #TODO
proc extract*(t: typedesc[CsPrefixUnaryExpression];
    info: Info): CsPrefixUnaryExpression = discard #TODO
proc extract*(t: typedesc[CsOmittedArraySizeExpression];
    info: Info): CsOmittedArraySizeExpression = discard #TODO
proc extract*(t: typedesc[CsInitializerExpression];
    info: Info): CsInitializerExpression = discard #TODO
proc extract*(t: typedesc[CsNameEquals]; info: Info): CsNameEquals = discard #TODO
proc extract*(t: typedesc[CsThrowStatement]; info: Info): CsThrowStatement = discard #TODO
proc extract*(t: typedesc[CsTypeOfExpression]; info: Info): CsTypeOfExpression = discard #TODO
proc extract*(t: typedesc[CsElseClause]; info: Info): CsElseClause = discard #TODO
proc extract*(t: typedesc[CsCaseSwitchLabel]; info: Info): CsCaseSwitchLabel = discard #TODO
proc extract*(t: typedesc[CsSimpleBaseType]; info: Info): CsSimpleBaseType = discard #TODO
proc extract*(t: typedesc[CsConstructor]; info: Info): CsConstructor = discard #TODO
proc extract*(t: typedesc[CsBaseList]; info: Info): CsBaseList = discard #TODO
proc extract*(t: typedesc[CsSwitchSection]; info: Info): CsSwitchSection = discard #TODO
proc extract*(t: typedesc[CsSimpleLambdaExpression];
    info: Info): CsSimpleLambdaExpression = discard #TODO
proc extract*(t: typedesc[CsPostfixUnaryExpression];
    info: Info): CsPostfixUnaryExpression = discard #TODO
proc extract*(t: typedesc[CsArrayCreationExpression];
    info: Info): CsArrayCreationExpression = discard #TODO
proc extract*(t: typedesc[CsArrowExpressionClause];
    info: Info): CsArrowExpressionClause = discard #TODO
proc extract*(t: typedesc[CsBreakStatement]; info: Info): CsBreakStatement = discard #TODO
proc extract*(t: typedesc[CsAliasQualifiedName];
    info: Info): CsAliasQualifiedName = discard #TODO
proc extract*(t: typedesc[CsTypeParameter]; info: Info): CsTypeParameter = discard #TODO
proc extract*(t: typedesc[CsAwaitExpression]; info: Info): CsAwaitExpression = discard #TODO
proc extract*(t: typedesc[CsConditionalExpression];
    info: Info): CsConditionalExpression = discard #TODO
proc extract*(t: typedesc[CsAttributeTargetSpecifier];
    info: Info): CsAttributeTargetSpecifier = discard #TODO
proc extract*(t: typedesc[CsTypeParameterList];
    info: Info): CsTypeParameterList = discard #TODO
proc extract*(t: typedesc[CsForEachStatement]; info: Info): CsForEachStatement = discard #TODO
proc extract*(t: typedesc[CsForStatement]; info: Info): CsForStatement = discard #TODO
proc extract*(t: typedesc[CsInterpolatedStringText];
    info: Info): CsInterpolatedStringText = discard #TODO
proc extract*(t: typedesc[CsParenthesizedLambdaExpression];
    info: Info): CsParenthesizedLambdaExpression = discard #TODO
proc extract*(t: typedesc[CsTryStatement]; info: Info): CsTryStatement = discard #TODO
proc extract*(t: typedesc[CsNullableType]; info: Info): CsNullableType = discard #TODO
proc extract*(t: typedesc[CsBaseExpression]; info: Info): CsBaseExpression = discard #TODO
proc extract*(t: typedesc[CsCatchClause]; info: Info): CsCatchClause = discard #TODO
proc extract*(t: typedesc[CsConstructorInitializer];
    info: Info): CsConstructorInitializer = discard #TODO
proc extract*(t: typedesc[CsInterpolation]; info: Info): CsInterpolation = discard #TODO
proc extract*(t: typedesc[CsCatch]; info: Info): CsCatch = discard #TODO
proc extract*(t: typedesc[CsNameColon]; info: Info): CsNameColon = discard #TODO
proc extract*(t: typedesc[CsUsingStatement]; info: Info): CsUsingStatement = discard #TODO
proc extract*(t: typedesc[CsTypeParameterConstraintClause];
    info: Info): CsTypeParameterConstraintClause = discard #TODO
proc extract*(t: typedesc[CsTypeConstraint]; info: Info): CsTypeConstraint = discard #TODO
proc extract*(t: typedesc[CsSingleVariableDesignation];
    info: Info): CsSingleVariableDesignation = discard #TODO
proc extract*(t: typedesc[CsInterpolatedStringExpression];
    info: Info): CsInterpolatedStringExpression = discard #TODO
proc extract*(t: typedesc[CsImplicitArrayCreationExpression];
    info: Info): CsImplicitArrayCreationExpression = discard #TODO
proc extract*(t: typedesc[CsWhileStatement]; info: Info): CsWhileStatement = discard #TODO
proc extract*(t: typedesc[CsDeclarationExpression];
    info: Info): CsDeclarationExpression = discard #TODO
proc extract*(t: typedesc[CsExplicitInterfaceSpecifier];
    info: Info): CsExplicitInterfaceSpecifier = discard #TODO
proc extract*(t: typedesc[CsConditionalAccessExpression];
    info: Info): CsConditionalAccessExpression = discard #TODO
proc extract*(t: typedesc[CsSwitchStatement]; info: Info): CsSwitchStatement = discard #TODO
proc extract*(t: typedesc[CsMemberBindingExpression];
    info: Info): CsMemberBindingExpression = discard #TODO
proc extract*(t: typedesc[CsDefaultExpression];
    info: Info): CsDefaultExpression = discard #TODO
proc extract*(t: typedesc[CsPointerType]; info: Info): CsPointerType = discard #TODO
proc extract*(t: typedesc[CsInterface]; info: Info): CsInterface = discard #TODO
proc extract*(t: typedesc[CsContinueStatement];
    info: Info): CsContinueStatement = discard #TODO
proc extract*(t: typedesc[CsFinallyClause]; info: Info): CsFinallyClause = discard #TODO
proc extract*(t: typedesc[CsDefaultSwitchLabel];
    info: Info): CsDefaultSwitchLabel = discard #TODO
proc extract*(t: typedesc[CsYieldStatement]; info: Info): CsYieldStatement = discard #TODO
proc extract*(t: typedesc[CsAnonymousObjectMemberDeclarator];
    info: Info): CsAnonymousObjectMemberDeclarator = discard #TODO
proc extract*(t: typedesc[CsCheckedExpression];
    info: Info): CsCheckedExpression = discard #TODO
proc extract*(t: typedesc[CsStruct]; info: Info): CsStruct = discard #TODO
proc extract*(t: typedesc[CsIsPatternExpression];
    info: Info): CsIsPatternExpression = discard #TODO
proc extract*(t: typedesc[CsLockStatement]; info: Info): CsLockStatement = discard #TODO
proc extract*(t: typedesc[CsDeclarationPattern];
    info: Info): CsDeclarationPattern = discard #TODO
proc extract*(t: typedesc[CsThrowExpression]; info: Info): CsThrowExpression = discard #TODO
proc extract*(t: typedesc[CsConstantPattern]; info: Info): CsConstantPattern = discard #TODO
proc extract*(t: typedesc[CsRefType]; info: Info): CsRefType = discard #TODO
proc extract*(t: typedesc[CsRefExpression]; info: Info): CsRefExpression = discard #TODO
proc extract*(t: typedesc[CsClassOrStructConstraint];
    info: Info): CsClassOrStructConstraint = discard #TODO
proc extract*(t: typedesc[CsOmittedTypeArgument];
    info: Info): CsOmittedTypeArgument = discard #TODO
proc extract*(t: typedesc[CsTupleElement]; info: Info): CsTupleElement = discard #TODO
proc extract*(t: typedesc[CsOperator]; info: Info): CsOperator = discard #TODO
proc extract*(t: typedesc[CsEventField]; info: Info): CsEventField = discard #TODO
proc extract*(t: typedesc[CsDelegate]; info: Info): CsDelegate = discard #TODO
proc extract*(t: typedesc[CsImplicitElementAccess];
    info: Info): CsImplicitElementAccess = discard #TODO
proc extract*(t: typedesc[CsAnonymousMethodExpression];
    info: Info): CsAnonymousMethodExpression = discard #TODO
proc extract*(t: typedesc[CsTupleExpression]; info: Info): CsTupleExpression = discard #TODO
proc extract*(t: typedesc[CsAnonymousObjectCreationExpression];
    info: Info): CsAnonymousObjectCreationExpression = discard #TODO
proc extract*(t: typedesc[CsIndexer]; info: Info): CsIndexer = discard #TODO
proc extract*(t: typedesc[CsBracketedParameterList];
    info: Info): CsBracketedParameterList = discard #TODO
proc extract*(t: typedesc[CsEvent]; info: Info): CsEvent = discard #TODO
proc extract*(t: typedesc[CsGotoStatement]; info: Info): CsGotoStatement = discard #TODO
proc extract*(t: typedesc[CsDoStatement]; info: Info): CsDoStatement = discard #TODO
proc extract*(t: typedesc[CsGlobalStatement]; info: Info): CsGlobalStatement = discard #TODO
proc extract*(t: typedesc[CsIncompleteMember]; info: Info): CsIncompleteMember = discard #TODO
proc extract*(t: typedesc[CsLocalFunctionStatement];
    info: Info): CsLocalFunctionStatement = discard #TODO
proc extract*(t: typedesc[CsConversionOperator];
    info: Info): CsConversionOperator = discard #TODO
proc extract*(t: typedesc[CsTupleType]; info: Info): CsTupleType = discard #TODO
proc extract*(t: typedesc[CsFixedStatement]; info: Info): CsFixedStatement = discard #TODO
proc extract*(t: typedesc[CsEmptyStatement]; info: Info): CsEmptyStatement = discard #TODO
proc extract*(t: typedesc[CsFromClause]; info: Info): CsFromClause = discard #TODO
proc extract*(t: typedesc[CsSizeOfExpression]; info: Info): CsSizeOfExpression = discard #TODO
proc extract*(t: typedesc[CsQueryBody]; info: Info): CsQueryBody = discard #TODO
proc extract*(t: typedesc[CsCheckedStatement]; info: Info): CsCheckedStatement = discard #TODO
proc extract*(t: typedesc[CsQueryExpression]; info: Info): CsQueryExpression = discard #TODO
proc extract*(t: typedesc[CsSelectClause]; info: Info): CsSelectClause = discard #TODO
proc extract*(t: typedesc[CsCasePatternSwitchLabel];
    info: Info): CsCasePatternSwitchLabel = discard #TODO
proc extract*(t: typedesc[CsLabeledStatement]; info: Info): CsLabeledStatement = discard #TODO
proc extract*(t: typedesc[CsWhereClause]; info: Info): CsWhereClause = discard #TODO
proc extract*(t: typedesc[CsConstructorConstraint];
    info: Info): CsConstructorConstraint = discard #TODO
proc extract*(t: typedesc[CsUnsafeStatement]; info: Info): CsUnsafeStatement = discard #TODO
proc extract*(t: typedesc[CsParenthesizedVariableDesignation];
    info: Info): CsParenthesizedVariableDesignation = discard #TODO
proc extract*(t: typedesc[CsInterpolationFormatClause];
    info: Info): CsInterpolationFormatClause = discard #TODO
proc extract*(t: typedesc[CsDestructor]; info: Info): CsDestructor = discard #TODO
proc extract*(t: typedesc[CsDiscardDesignation];
    info: Info): CsDiscardDesignation = discard #TODO
proc extract*(t: typedesc[CsStackAllocArrayCreationExpression];
    info: Info): CsStackAllocArrayCreationExpression = discard #TODO
proc extract*(t: typedesc[CsWhenClause]; info: Info): CsWhenClause = discard #TODO
proc extract*(t: typedesc[CsForEachVariableStatement];
    info: Info): CsForEachVariableStatement = discard #TODO
proc extract*(t: typedesc[CsLetClause]; info: Info): CsLetClause = discard #TODO
proc extract*(t: typedesc[CsElementBindingExpression];
    info: Info): CsElementBindingExpression = discard #TODO
proc extract*(t: typedesc[CsCatchFilterClause];
    info: Info): CsCatchFilterClause = discard #TODO
proc extract*(t: typedesc[CsOrdering]; info: Info): CsOrdering = discard #TODO
proc extract*(t: typedesc[CsOrderByClause]; info: Info): CsOrderByClause = discard #TODO
proc extract*(t: typedesc[CsJoinClause]; info: Info): CsJoinClause = discard #TODO
proc extract*(t: typedesc[CsGroupClause]; info: Info): CsGroupClause = discard #TODO
proc extract*(t: typedesc[CsInterpolationAlignmentClause];
    info: Info): CsInterpolationAlignmentClause = discard #TODO
proc extract*(t: typedesc[CsQueryContinuation];
    info: Info): CsQueryContinuation = discard #TODO
proc extract*(t: typedesc[CsExternAliasDirective];
    info: Info): CsExternAliasDirective = discard #TODO
proc extract*(t: typedesc[CsMakeRefExpression];
    info: Info): CsMakeRefExpression = discard #TODO
proc extract*(t: typedesc[CsJoinIntoClause]; info: Info): CsJoinIntoClause = discard #TODO
proc extract*(t: typedesc[CsRefValueExpression];
    info: Info): CsRefValueExpression = discard #TODO
proc extract*(t: typedesc[CsRefTypeExpression];
    info: Info): CsRefTypeExpression = discard #TODO
