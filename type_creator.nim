import uuids, options
import types
import construct
import constructs/[cs_all_constructs, justtypes]
import strutils
proc createType*(info: Info; id: UUID; data: AllNeededData): Construct =
  case info.declName #theType

  # ## unsupported by choice, or implement last.
  # not interested in supporting attributes
  # not interested in supporting xml attributes comments etc.
  # not interested in supporting Trivia at the moment, some have nim equivalents though.
  # hmmm, what is Cref ?
  # linq stuff, we should support it, but perhaps there are shortcuts. (program that replaces linq with normal c#) or we'll make equivalent nim procs to handle it.
  of ["AttributeTargetSpecifier", "Attribute", "AttributeList", "AttributeArgument", "AttributeArgumentList"
  , "XmlCDataSection", "XmlComment", "XmlCrefAttribute", "XmlElement", "XmlElementEndTag", "XmlElementStartTag", "XmlEmptyElement`", "XmlName", "XmlNameAttribute", "XmlPrefix", "XmlProcessingInstruction", "XmlText", "XmlTextAttribute"
  , "BadDirectiveTrivia", "DefineDirectiveTrivia", "DocumentationCommentTrivia", "ElifDirectiveTrivia", "ElseDirectiveTrivia", "EndIfDirectiveTrivia", "EndRegionDirectiveTrivia", "ErrorDirectiveTrivia", "NullableDirectiveTrivia", "RegionDirectiveTrivia", "IfDirectiveTrivia", "LineDirectiveTrivia", "LoadDirectiveTrivia", "PragmaChecksumDirectiveTrivia", "PragmaWarningDirectiveTrivia",
  "ReferenceDirectiveTrivia", "ShebangDirectiveTrivia", "SkippedTokensTrivia", "UndefDirectiveTrivia", "WarningDirectiveTrivia", "ConversionOperatorMemberCref", "CrefBracketedParameterList", "CrefParameter", "CrefParameterList", "IndexerMemberCref", "NameMemberCref", "OperatorMemberCref", "QualifiedCref", "TypeCref", "OrderByClause", "GroupClause", "JoinClause", "FromClause", "SelectClause",
      "WhereClause", "JoinIntoClause"]:
    discard

  of "NamespaceDeclaration": # etc etc
    var a = extract(CsNamespace, info, data)
    if data.currentNamespace.name != "default":
      # modifyNameToGlobal:
      a.name = data.currentNamespace.name & "." & a.name
    a.id = some(id); assert not a.typ.isEmptyOrWhitespace
    result = Construct(kind: ckNamespace, namespace: a)
  of "ClassDeclaration":
    var a = extract(CsClass, info, data)
    a.id = some(id); assert not a.typ.isEmptyOrWhitespace
    result = Construct(kind: ckClass, class: a)
    # Construct(t: ckNamespace, namespace: a) #.wrap(ckNamespace)
  of "MethodDeclaration":
    var a = extract(CsMethod, info, data)
    a.id = some(id); assert not a.typ.isEmptyOrWhitespace
    result = Construct(kind: ckMethod, cmethod: a)
  # still unsupported
  of "PredefinedType":
    var a = extract(CsPredefinedType, info, data)
    a.id = some(id); assert not a.typ.isEmptyOrWhitespace
    result = Construct(kind: ckPredefinedType, predefinedType: a)
  of "ParameterList":
    var a = extract(CsParameterList, info,data)
    a.id = some(id); assert not a.typ.isEmptyOrWhitespace
    result = Construct(kind:ckParameterList, parameterlist: a)
  of "LocalDeclarationStatement":
    var a = extract(CsLocalDeclarationStatement, info,data)
    a.id = some(id); assert not a.typ.isEmptyOrWhitespace
    result = Construct(kind: ckLocalDeclarationStatement, localDeclarationStatement: a)
  of "EnumDeclaration":
    var a = extract(CsEnum, info)
    a.id = some(id); assert not a.typ.isEmptyOrWhitespace
    result = Construct(kind: ckEnum, cenum: a)
  of "EnumMemberDeclaration":
    var a = extract(CsEnumMember, info)
    a.id = some(id); assert not a.typ.isEmptyOrWhitespace
    result = Construct(kind: ckEnumMember, enumMember: a)
  of "EqualsValueClause": # assignment.
    var a = extract(CsEqualsValueClause, info) #, data);
    a.id = some(id); assert not a.typ.isEmptyOrWhitespace
    result = Construct(kind: ckEqualsValueClause, equalsValueClause: a)

  of "LiteralExpression":
    var a = extract(CsLiteralExpression, info) #, data);
    a.id = some(id); assert not a.typ.isEmptyOrWhitespace
    result = Construct(kind: ckLiteralExpression, literalExpression: a)
  of "IdentifierName":discard
  of "Parameter":
    var a = extract(CsParameter, info) #, data);
    a.id = some(id); assert not a.typ.isEmptyOrWhitespace
    result = Construct(kind: ckParameter, parameter: a)

  # ## some regex magic
  of "ArgumentList":
      var a = extract(CsArgumentList, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckArgumentList, argumentList: a)
  of "ObjectCreationExpression":
      var a = extract(CsObjectCreationExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckObjectCreationExpression, objectCreationExpression: a)
  of "UsingDirective":
      var a = extract(CsUsingDirective, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckUsingDirective, usingDirective: a)
  of "Indexer":
      var a = extract(CsIndexer, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckIndexer, indexer: a)

  of "Argument":
      var a = extract(CsArgument, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckArgument, argument: a)
  of "Constructor":
      var a = extract(CsConstructor, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckConstructor, constructor: a)
  of "ReturnStatement":
      var a = extract(CsReturnStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckReturnStatement, returnStatement: a)
  of "SimpleBaseType":
      var a = extract(CsSimpleBaseType, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckSimpleBaseType, simpleBaseType: a)
  of "BaseList":
      var a = extract(CsBaseList, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckBaseList, baseList: a)
  of "Property":
      var a = extract(CsProperty, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckProperty, property: a)
  of "ExplicitInterfaceSpecifier":
      var a = extract(CsExplicitInterfaceSpecifier, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckExplicitInterfaceSpecifier, explicitInterfaceSpecifier: a)
  of "ExpressionStatement":
      var a = extract(CsExpressionStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckExpressionStatement, expressionStatement: a)
  of "InvocationExpression":
      var a = extract(CsInvocationExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckInvocationExpression, invocationExpression: a)

  of "BinaryExpression":
      var a = extract(CsBinaryExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckBinaryExpression, binaryExpression: a)
  of "AssignmentExpression":
      var a = extract(CsAssignmentExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckAssignmentExpression, assignmentExpression: a)
  of "IfStatement":
      var a = extract(CsIfStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckIfStatement, ifStatement: a)
  of "ThisExpression":
      var a = extract(CsThisExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckThisExpression, thisExpression: a)
  of "TypeArgumentList":
      var a = extract(CsTypeArgumentList, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckTypeArgumentList, typeArgumentList: a)
  of "GenericName":
      var a = extract(CsGenericName, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckGenericName, genericName: a)
  of "Accessor":
      var a = extract(CsAccessor, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckAccessor, accessor: a)
  of "BracketedArgumentList":
      var a = extract(CsBracketedArgumentList, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckBracketedArgumentList, bracketedArgumentList: a)
  of "ElementAccessExpression":
      var a = extract(CsElementAccessExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckElementAccessExpression, elementAccessExpression: a)
  of "AccessorList":
      var a = extract(CsAccessorList, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckAccessorList, accessorList: a)
  of "ParenthesizedExpression":
      var a = extract(CsParenthesizedExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckParenthesizedExpression, parenthesizedExpression: a)
  of "CastExpression":
      var a = extract(CsCastExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckCastExpression, castExpression: a)
  of "ArrayRankSpecifier":
      var a = extract(CsArrayRankSpecifier, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckArrayRankSpecifier, arrayRankSpecifier: a)
  of "ArrayType":
      var a = extract(CsArrayType, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckArrayType, arrayType: a)
  of "PrefixUnaryExpression":
      var a = extract(CsPrefixUnaryExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckPrefixUnaryExpression, prefixUnaryExpression: a)
  of "OmittedArraySizeExpression":
      var a = extract(CsOmittedArraySizeExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckOmittedArraySizeExpression, omittedArraySizeExpression: a)

  of "InitializerExpression":
      var a = extract(CsInitializerExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckInitializerExpression, initializerExpression: a)
  of "NameEquals":
      var a = extract(CsNameEquals, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckNameEquals, nameEquals: a)
  of "ThrowStatement":
      var a = extract(CsThrowStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckThrowStatement, throwStatement: a)
  of "TypeofExpression":
      var a = extract(CsTypeofExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckTypeofExpression, typeofExpression: a)
  of "ElseClause":
      var a = extract(CsElseClause, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckElseClause, elseClause: a)
  of "CaseSwitchLabel":
      var a = extract(CsCaseSwitchLabel, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckCaseSwitchLabel, caseSwitchLabel: a)
  of "SwitchSection":
      var a = extract(CsSwitchSection, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckSwitchSection, switchSection: a)
  of "SimpleLambdaExpression":
      var a = extract(CsSimpleLambdaExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckSimpleLambdaExpression, simpleLambdaExpression: a)
  of "PostfixUnaryExpression":
      var a = extract(CsPostfixUnaryExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckPostfixUnaryExpression, postfixUnaryExpression: a)
  of "ArrayCreationExpression":
      var a = extract(CsArrayCreationExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckArrayCreationExpression, arrayCreationExpression: a)
  of "ArrowExpressionClause":
      var a = extract(CsArrowExpressionClause, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckArrowExpressionClause, arrowExpressionClause: a)
  of "BreakStatement":
      var a = extract(CsBreakStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckBreakStatement, breakStatement: a)

  of "AliasQualifiedName":
      var a = extract(CsAliasQualifiedName, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckAliasQualifiedName, aliasQualifiedName: a)
  of "TypeParameter":
      var a = extract(CsTypeParameter, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckTypeParameter, typeParameter: a)
  of "AwaitExpression":
      var a = extract(CsAwaitExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckAwaitExpression, awaitExpression: a)
  of "ConditionalExpression":
      var a = extract(CsConditionalExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckConditionalExpression, conditionalExpression: a)
  of "TypeParameterList":
      var a = extract(CsTypeParameterList, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckTypeParameterList, typeParameterList: a)
  of "ForEachStatement":
      var a = extract(CsForEachStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckForEachStatement, forEachStatement: a)
  of "ForStatement":
      var a = extract(CsForStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckForStatement, forStatement: a)

  of "InterpolatedStringText":
      var a = extract(CsInterpolatedStringText, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckInterpolatedStringText, interpolatedStringText: a)
  of "ParenthesizedLambdaExpression":
      var a = extract(CsParenthesizedLambdaExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckParenthesizedLambdaExpression, parenthesizedLambdaExpression: a)
  of "TryStatement":
      var a = extract(CsTryStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckTryStatement, tryStatement: a)
  of "NullableType":
      var a = extract(CsNullableType, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckNullableType, nullableType: a)
  of "BaseExpression":
      var a = extract(CsBaseExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckBaseExpression, baseExpression: a)
  of "CatchClause":
      var a = extract(CsCatchClause, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckCatchClause, catchClause: a)
  of "ConstructorInitializer":
      var a = extract(CsConstructorInitializer, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckConstructorInitializer, constructorInitializer: a)
  of "Interpolation":
      var a = extract(CsInterpolation, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckInterpolation, interpolation: a)
  of "Catch":
      var a = extract(CsCatch, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckCatch, catch: a)
  of "NameColon":
      var a = extract(CsNameColon, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckNameColon, nameColon: a)
  of "UsingStatement":
      var a = extract(CsUsingStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckUsingStatement, usingStatement: a)
  of "TypeParameterConstraintClause":
      var a = extract(CsTypeParameterConstraintClause, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckTypeParameterConstraintClause, typeParameterConstraintClause: a)
  of "TypeConstraint":
      var a = extract(CsTypeConstraint, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckTypeConstraint, typeConstraint: a)
  of "SingleVariableDesignation":
      var a = extract(CsSingleVariableDesignation, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckSingleVariableDesignation, singleVariableDesignation: a)
  of "InterpolatedStringExpression":
      var a = extract(CsInterpolatedStringExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckInterpolatedStringExpression, interpolatedStringExpression: a)
  of "ImplicitArrayCreationExpression":
      var a = extract(CsImplicitArrayCreationExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckImplicitArrayCreationExpression, implicitArrayCreationExpression: a)
  of "WhileStatement":
      var a = extract(CsWhileStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckWhileStatement, whileStatement: a)

  of "DeclarationExpression":
      var a = extract(CsDeclarationExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckDeclarationExpression, declarationExpression: a)
  of "ConditionalAccessExpression":
      var a = extract(CsConditionalAccessExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckConditionalAccessExpression, conditionalAccessExpression: a)
  of "SwitchStatement":
      var a = extract(CsSwitchStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckSwitchStatement, switchStatement: a)
  of "MemberBindingExpression":
      var a = extract(CsMemberBindingExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckMemberBindingExpression, memberBindingExpression: a)
  of "DefaultExpression":
      var a = extract(CsDefaultExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckDefaultExpression, defaultExpression: a)
  of "PointerType":
      var a = extract(CsPointerType, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckPointerType, pointerType: a)
  of "Interface":
      var a = extract(CsInterface, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckInterface, cinterface: a)
  of "ContinueStatement":
      var a = extract(CsContinueStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckContinueStatement, continueStatement: a)
  of "FinallyClause":
      var a = extract(CsFinallyClause, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckFinallyClause, finallyClause: a)
  of "DefaultSwitchLabel":
      var a = extract(CsDefaultSwitchLabel, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckDefaultSwitchLabel, defaultSwitchLabel: a)
  of "YieldStatement":
      var a = extract(CsYieldStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckYieldStatement, yieldStatement: a)
  of "AnonymousObjectMemberDeclarator":
      var a = extract(CsAnonymousObjectMemberDeclarator, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckAnonymousObjectMemberDeclarator, anonymousObjectMemberDeclarator: a)
  of "CheckedExpression":
      var a = extract(CsCheckedExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckCheckedExpression, checkedExpression: a)
  of "Struct":
      var a = extract(CsStruct, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckStruct, struct: a)
  of "IsPatternExpression":
      var a = extract(CsIsPatternExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckIsPatternExpression, isPatternExpression: a)
  of "LockStatement":
      var a = extract(CsLockStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckLockStatement, lockStatement: a)
  of "DeclarationPattern":
      var a = extract(CsDeclarationPattern, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckDeclarationPattern, declarationPattern: a)
  of "ThrowExpression":
      var a = extract(CsThrowExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckThrowExpression, throwExpression: a)
  of "ConstantPattern":
      var a = extract(CsConstantPattern, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckConstantPattern, constantPattern: a)

  of "RefType":
      var a = extract(CsRefType, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckRefType, refType: a)
  of "RefExpression":
      var a = extract(CsRefExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckRefExpression, refExpression: a)
  of "ClassOrStructConstraint":
      var a = extract(CsClassOrStructConstraint, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckClassOrStructConstraint, classOrStructConstraint: a)
  of "OmittedTypeArgument":
      var a = extract(CsOmittedTypeArgument, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckOmittedTypeArgument, omittedTypeArgument: a)
  of "TupleElement":
      var a = extract(CsTupleElement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckTupleElement, tupleElement: a)
  of "Operator":
      var a = extract(CsOperator, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckOperator, operator: a)
  of "EventField":
      var a = extract(CsEventField, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckEventField, eventField: a)
  of "Delegate":
      var a = extract(CsDelegate, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckDelegate, delegate: a)
  of "ImplicitElementAccess":
      var a = extract(CsImplicitElementAccess, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckImplicitElementAccess, implicitElementAccess: a)
  of "AnonymousMethodExpression":
      var a = extract(CsAnonymousMethodExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckAnonymousMethodExpression, anonymousMethodExpression: a)
  of "TupleExpression":
      var a = extract(CsTupleExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckTupleExpression, tupleExpression: a)
  of "AnonymousObjectCreationExpression":
      var a = extract(CsAnonymousObjectCreationExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckAnonymousObjectCreationExpression, anonymousObjectCreationExpression: a)
  of "BracketedParameterList":
      var a = extract(CsBracketedParameterList, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckBracketedParameterList, bracketedParameterList: a)
  of "Event":
      var a = extract(CsEvent, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckEvent, event: a)
  of "GotoStatement":
      var a = extract(CsGotoStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckGotoStatement, gotoStatement: a)
  of "DoStatement":
      var a = extract(CsDoStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckDoStatement, doStatement: a)
  of "GlobalStatement":
      var a = extract(CsGlobalStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckGlobalStatement, globalStatement: a)
  of "IncompleteMember":
      var a = extract(CsIncompleteMember, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckIncompleteMember, incompleteMember: a)
  of "LocalFunctionStatement":
      var a = extract(CsLocalFunctionStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckLocalFunctionStatement, localFunctionStatement: a)

  of "ConversionOperator":
      var a = extract(CsConversionOperator, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckConversionOperator, conversionOperator: a)
  of "TupleType":
      var a = extract(CsTupleType, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckTupleType, tupleType: a)
  of "FixedStatement":
      var a = extract(CsFixedStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckFixedStatement, fixedStatement: a)
  of "EmptyStatement":
      var a = extract(CsEmptyStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckEmptyStatement, emptyStatement: a)
  of "SizeofExpression":
      var a = extract(CsSizeofExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckSizeofExpression, sizeofExpression: a)
  of "QueryBody":
      var a = extract(CsQueryBody, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckQueryBody, queryBody: a)
  of "CheckedStatement":
      var a = extract(CsCheckedStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckCheckedStatement, checkedStatement: a)
  of "QueryExpression":
      var a = extract(CsQueryExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckQueryExpression, queryExpression: a)
  of "CasePatternSwitchLabel":
      var a = extract(CsCasePatternSwitchLabel, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckCasePatternSwitchLabel, casePatternSwitchLabel: a)
  of "LabeledStatement":
      var a = extract(CsLabeledStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckLabeledStatement, labeledStatement: a)
  of "ConstructorConstraint":
      var a = extract(CsConstructorConstraint, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckConstructorConstraint, constructorConstraint: a)
  of "UnsafeStatement":
      var a = extract(CsUnsafeStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckUnsafeStatement, unsafeStatement: a)
  of "ParenthesizedVariableDesignation":
      var a = extract(CsParenthesizedVariableDesignation, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckParenthesizedVariableDesignation, parenthesizedVariableDesignation: a)
  of "InterpolationFormatClause":
      var a = extract(CsInterpolationFormatClause, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckInterpolationFormatClause, interpolationFormatClause: a)
  of "Destructor":
      var a = extract(CsDestructor, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckDestructor, destructor: a)
  of "DiscardDesignation":
      var a = extract(CsDiscardDesignation, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckDiscardDesignation, discardDesignation: a)
  of "StackAllocArrayCreationExpression":
      var a = extract(CsStackAllocArrayCreationExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckStackAllocArrayCreationExpression, stackAllocArrayCreationExpression: a)
  of "WhenClause":
      var a = extract(CsWhenClause, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckWhenClause, whenClause: a)

  of "ForEachVariableStatement":
      var a = extract(CsForEachVariableStatement, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckForEachVariableStatement, forEachVariableStatement: a)
  of "LetClause":
      var a = extract(CsLetClause, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckLetClause, letClause: a)
  of "ElementBindingExpression":
      var a = extract(CsElementBindingExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckElementBindingExpression, elementBindingExpression: a)
  of "CatchFilterClause":
      var a = extract(CsCatchFilterClause, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckCatchFilterClause, catchFilterClause: a)
  of "Ordering":
      var a = extract(CsOrdering, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckOrdering, ordering: a)
  of "InterpolationAlignmentClause":
      var a = extract(CsInterpolationAlignmentClause, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckInterpolationAlignmentClause, interpolationAlignmentClause: a)
  of "QueryContinuation":
      var a = extract(CsQueryContinuation, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckQueryContinuation, queryContinuation: a)
  of "ExternAliasDirective":
      var a = extract(CsExternAliasDirective, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckExternAliasDirective, externAliasDirective: a)
  of "MakeRefExpression":
      var a = extract(CsMakeRefExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckMakeRefExpression, makeRefExpression: a)
  of "RefValueExpression":
      var a = extract(CsRefValueExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckRefValueExpression, refValueExpression: a)
  of "RefTypeExpression":
      var a = extract(CsRefTypeExpression, info)#, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckRefTypeExpression, refTypeExpression: a)
  of "Block":
      var a = extract(CsBlock, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckBlock, cblock: a)
  of "Variable":
      var a = extract(CsVariable, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckVariable, variable: a)
  of "BinaryPattern":
      var a = extract(CsBinaryPattern, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckBinaryPattern, binaryPattern: a)
  of "DiscardPattern":
      var a = extract(CsDiscardPattern, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckDiscardPattern, discardPattern: a)
  of "FunctionPointerType":
      var a = extract(CsFunctionPointerType, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckFunctionPointerType, functionPointerType: a)
  of "ImplicitObjectCreationExpression":
      var a = extract(CsImplicitObjectCreationExpression, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckImplicitObjectCreationExpression, implicitObjectCreationExpression: a)
  of "MemberAccessExpression":
      var a = extract(CsMemberAccessExpression, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckMemberAccessExpression, memberAccessExpression: a)

  of "ParenthesizedPattern":
      var a = extract(CsParenthesizedPattern, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckParenthesizedPattern, parenthesizedPattern: a)
  of "PositionalPatternClause":
      var a = extract(CsPositionalPatternClause, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckPositionalPatternClause, positionalPatternClause: a)
  of "PrimaryConstructorBaseType":
      var a = extract(CsPrimaryConstructorBaseType, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckPrimaryConstructorBaseType, primaryConstructorBaseType: a)
  of "PropertyPatternClause":
      var a = extract(CsPropertyPatternClause, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckPropertyPatternClause, propertyPatternClause: a)
  of "RangeExpression":
      var a = extract(CsRangeExpression, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckRangeExpression, rangeExpression: a)
  of "Record":
      var a = extract(CsRecord, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckRecord, record: a)
  of "RecursivePattern":
      var a = extract(CsRecursivePattern, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckRecursivePattern, recursivePattern: a)
  of "RelationalPattern":
      var a = extract(CsRelationalPattern, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckRelationalPattern, relationalPattern: a)
  of "Subpattern":
      var a = extract(CsSubpattern, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckSubpattern, subpattern: a)
  of "SwitchExpression":
      var a = extract(CsSwitchExpression, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckSwitchExpression, switchExpression: a)
  of "SwitchExpressionArm":
      var a = extract(CsSwitchExpressionArm, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckSwitchExpressionArm, switchExpressionArm: a)
  of "TypePattern":
      var a = extract(CsTypePattern, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckTypePattern, typePattern: a)
  of "UnaryPattern":
      var a = extract(CsUnaryPattern, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckUnaryPattern, unaryPattern: a)
  of "VarPattern":
      var a = extract(CsVarPattern, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckVarPattern, varPattern: a)
  of "WithExpression":
      var a = extract(CsWithExpression, info, data);
      a.id = some(id); assert not a.typ.isEmptyOrWhitespace
      result = Construct(kind: ckWithExpression, withExpression: a)

# ## end of some regex magic
  of "ConstructorDeclaration":
    var a = extract(CsConstructor,info)
    a.id = some(id); assert not a.typ.isEmptyOrWhitespace
    result = Construct(kind:ckConstructor, constructor: a)
  of "IndexerDeclaration":
    var a = extract(CsIndexer,info)
    a.id = some(id); assert not a.typ.isEmptyOrWhitespace
    result = Construct(kind: ckIndexer, indexer:a)
  of "AccessorDeclaration":
    var a = extract(CsAccessor,info)
    a.id = some(id); assert not a.typ.isEmptyOrWhitespace
    result = Construct(kind:ckAccessor, accessor:a)
  of "PropertyDeclaration":
    var a = extract(CsProperty,info); a.id = some(id); assert not a.typ.isEmptyOrWhitespace
    result = Construct(kind:ckProperty, property:a)
  of "FieldDeclaration":
    var a = extract(CsField, info); a.id = some(id); assert not a.typ.isEmptyOrWhitespace
    result = Construct(kind:ckField, field:a)
  of "VariableDeclaration":
    var a = extract(CsVariable, info, data);
    a.id = some(id); assert not a.typ.isEmptyOrWhitespace
    result = Construct(kind: ckVariable, variable: a)
  of "VariableDeclarator":
    var a = extract(CsVariableDeclarator, info);
    a.id = some(id); assert not a.typ.isEmptyOrWhitespace
    result = Construct(kind: ckVariableDeclarator, variableDeclarator: a)

  # parts that should have no objects, but instead are part of fields or even unneeded.
  of [ "QualifiedName"]: discard

  else: assert false, "still unsupported: of \"" & info.declName & "\" : maybe in handle_construct.nim"
  if not result.isNil:  result.id = some(id)