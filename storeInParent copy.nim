import constructs/[cs_all_constructs, justtypes]
import types, construct
import options

proc add*(parent, child: Construct; data: AllNeededData) =
  echo "in add <Construct>"
  let couple: string = $parent.kind & " -> " & $child.kind
  echo couple
  case parent.kind
  of ckNamespace:
    var p = parent.namespace
    case child.kind
    of ckClass: # ns, class
      var c = child.class
      c.parentId = p.id; p.add c
    of ckEnum:
      var c = child.cenum
      c.parentId = p.id; p.add c
    of ckUsingDirective:
      var c = child.usingDirective
      c.parentId = p.id; p.add c
    of ckMethod:
      var c = child.cmethod
      c.parentId = p.id; p.add c
    of ckExternAliasDirective:
      var c = child.externAliasDirective
      c.parentId = p.id; p.add c
    of ckDelegate:
      var c = child.delegate
      c.parentId = p.id; p.add c
    of ckInterface:
      var c = child.cinterface
      c.parentId = p.id; p.add c
    of ckProperty:
      var c = child.property
      c.parentId = p.id; p.add c
    of ckStruct:
      var c = child.struct
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind

  of ckClass:
    var c = parent.class
    case child.kind
    of ckMethod: # class, method
      var m = child.cmethod
      m.parentId = c.id; c.add m
    of ckConstructor:
      var m = child.constructor
      m.parentId = c.id; c.add m
    of ckBaseList:
      var b = child.baselist
      b.parentId = c.id; c.add b

    of [ckSimpleBaseType]: discard
    of ckIndexer:
      var i = child.indexer
      i.parentId = c.id; c.add i
    of ckProperty:
      var pr = child.property
      pr.parentId = c.id; c.add pr
    of ckField:
      var cf = child.field
      cf.parentId = c.id; c.add cf
    of ckEnum:
      var c1 = child.cenum
      c1.parentId = c.id; c.add c1
    of ckClass:
      var c1 = child.class
      c1.parentId = c.id; c.add c1
    of ckTypeParameterList:
      var c1 = child.typeParameterList
      c1.parentId = c.id; c.add c1
    of ckTypeParameterConstraintClause:
      var c1 = child.typeParameterConstraintClause
      c1.parentId = c.id; c.add c1
    of ckInterface:
      var c1 = child.cinterface
      c1.parentId = c.id; c.add c1
    of ckStruct:
      var c1 = child.struct
      c1.parentId = c.id; c.add c1
    else: assert false, couple & " plz impl for child: " & $child.kind

  of ckMethod:
    var p = parent.cmethod
    case child.kind
    of ckPredefinedType:
      var pt = child.predefinedType
      pt.parentId = p.id; p.add pt
    of ckParameterList:
      var c = child.parameterlist
      c.parentId = p.id; p.add c
    of ckLocalDeclarationStatement:
      var c = child.localDeclarationStatement
      c.parentId = p.id; p.add c
    of ckReturnStatement:
      var c = child.returnStatement
      c.parentId = p.id; p.add c
    of ckExpressionStatement:
      var c = child.expressionStatement
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckVariableDeclarator: # just add to method body.
      var c = child.variableDeclarator
      c.parentId = p.id; p.add c
    # of ckMemberAccessExpression:
    #   var c = child.memberAccessExpression
    #   c.parentId = p.id; p.add c

    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckIfStatement:
      var c = child.ifStatement
      c.parentId = p.id; p.add c
    of ckArrowExpressionClause:
      var c = child.arrowExpressionClause
      c.parentId = p.id; p.add c
    of ckForStatement:
      var c = child.forStatement
      c.parentId = p.id; p.add c
    of ckDoStatement:
      var c = child.doStatement
      c.parentId = p.id; p.add c
    of ckWhileStatement:
      var c = child.whileStatement
      c.parentId = p.id; p.add c
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckUsingStatement:
      var c = child.usingStatement
      c.parentId = p.id; p.add c
    of ckTryStatement:
      var c = child.tryStatement
      c.parentId = p.id; p.add c
    of ckThrowStatement:
      var c = child.throwStatement
      c.parentId = p.id; p.add c

    of ckTypeParameterList:
      var c = child.typeParameterList
      c.parentId = p.id; p.add c
    of ckExplicitInterfaceSpecifier:
      var c = child.explicitInterfaceSpecifier
      c.parentId = p.id; p.add c
    of ckTypeParameterConstraintClause:
      var c = child.typeParameterConstraintClause
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckYieldStatement:
      var c = child.yieldStatement
      c.parentId = p.id; p.add c
    of ckTupleType:
      var c = child.tupleType
      c.parentId = p.id; p.add c
    of ckSwitchStatement:
      var c = child.switchStatement
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    of ckLockStatement:
      var c = child.lockStatement
      c.parentId = p.id; p.add c
    of ckForEachStatement:
      var c = child.forEachStatement
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckEnum:
    var m = parent.cenum
    case child.kind
    of ckEnumMember:
      var c = child.enumMember
      c.parentId = m.id; m.add c
    of ckBaseList:
      var c = child.baseList
      c.parentId = m.id; m.add c
    else: assert false, couple & " plz impl for child: " & $child.kind

  of ckEnumMember:
    var p = parent.enumMember
    case child.kind
    of ckEqualsValueClause: # the only possibility i think
      var c = child.equalsValueClause
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckParameterList:
    var p = parent.parameterList
    case child.kind
    of ckParameter:
      var c = child.parameter
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckReturnStatement:
    var p = parent.returnStatement
    case child.kind
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckArgumentList:
      var c = child.argumentList
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c

    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c

    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c

    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c

    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c

    of ckSimpleLambdaExpression:
      var c = child.simpleLambdaExpression
      c.parentId = p.id; p.add c

    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c

    of ckParenthesizedLambdaExpression:
      var c = child.parenthesizedLambdaExpression
      c.parentId = p.id; p.add c

    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c

    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckImplicitArrayCreationExpression:
      var c = child.implicitArrayCreationExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckConstructor:
    var p = parent.constructor
    case child.kind
    of ckParameterList:
      var c = child.parameterlist
      c.parentId = p.id; p.add c
    of ckExpressionStatement:
      var c = child.expressionStatement
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckConstructorInitializer:
      var c = child.constructorInitializer
      c.parentId = p.id; p.add c
    of ckArgumentList:
      var c = child.argumentList
      c.parentId = p.id; p.add c

    of ckLocalDeclarationStatement:
      var c = child.localDeclarationStatement
      c.parentId = p.id; p.add c
    of ckArrowExpressionClause:
      var c = child.arrowExpressionClause
      c.parentId = p.id; p.add c
    of ckReturnStatement:
      var c = child.returnStatement
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckIndexer:
    var p = parent.indexer
    case child.kind
    of ckPredefinedType:
      var c = child.predefinedtype
      c.parentId = p.id; p.add c
    of ckExplicitInterfaceSpecifier:
      var c = child.explicitInterfaceSpecifier
      c.parentId = p.id; p.add c
    of ckBracketedParameterList:
      var c = child.bracketedParameterList
      c.parentId = p.id; p.add c
    of ckParameter:
      var c = child.parameter
      c.parentId = p.id; p.add c
    of ckAccessorList:
      var c = child.accessorlist
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind

  of ckAccessorList:
    var p = parent.accessorlist
    case child.kind
    of ckAccessor:
      var c = child.accessor
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckProperty:
    var p = parent.property
    case child.kind
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckAccessorList:
      var c = child.accessorList
      c.parentId = p.id; p.add c
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c

    of ckArrowExpressionClause:
      var c = child.arrowExpressionClause
      c.parentId = p.id; p.add c
    of ckEqualsValueClause:
      var c = child.equalsValueClause
      c.parentId = p.id; p.add c
    of ckExplicitInterfaceSpecifier:
      var c = child.explicitInterfaceSpecifier
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckLocalDeclarationStatement:
      var c = child.localDeclarationStatement
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c

    else: assert false, couple & " plz impl for child: " & $child.kind

  of ckExpressionStatement:
    var p = parent.expressionStatement
    case child.kind
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckArgumentList:
      var c = child.argumentList
      c.parentId = p.id; p.add c
    of ckArgument:
      var c = child.argument
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckLocalDeclarationStatement:
    var p = parent.localDeclarationStatement
    case child.kind
    of ckVariable:
      let c = child.variable
      c.parentId = p.id; p.add c
    of ckGenericName:
      let c = child.genericName
      c.parentId = p.id; p.add c
    of ckTypeArgumentList:
      let c = child.typeArgumentList
      c.parentId = p.id; p.add c
    of ckVariableDeclarator:
      let c = child.variableDeclarator
      c.parentId = p.id; p.add c
    of ckArgumentList: # TODO CONTINUE HERE... add needs to drill until reaching rhs, maybe add field arglist. annoying.
      let c = child.argumentList
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      let c = child.literalExpression
      c.parentId = p.id; p.add c

    else: assert false, couple & " plz impl for child: " & $child.kind

  of ckVariableDeclarator:
    var p = parent.variableDeclarator
    case child.kind
    of ckEqualsValueClause:
      let c = child.equalsValueClause
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      let c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      let c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression: # this would be the rhs
      let c = child.memberAccessExpression
      c.parentId = p.id; p.add c

    else: assert false, couple & " plz impl for child: " & $child.kind

  of ckAssignmentExpression:
    var p = parent.assignmentExpression
    case child.kind
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c

    of ckTypeArgumentList:
      var c = child.typeArgumentList
      c.parentId = p.id; p.add c

    of ckArgumentList:
      var c = child.argumentList
      c.parentId = p.id; p.add c

    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckInitializerExpression:
      var c = child.initializerExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedLambdaExpression:
      var c = child.parenthesizedLambdaExpression
      c.parentId = p.id; p.add c
    of ckSimpleLambdaExpression:
      var c = child.simpleLambdaExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckDeclarationExpression:
      var c = child.declarationExpression
      c.parentId = p.id; p.add c
    of ckImplicitElementAccess:
      var c = child.implicitElementAccess
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckObjectCreationExpression:
    var p = parent.objectCreationExpression
    case child.kind
    of ckInitializerExpression:
      var c = child.initializerExpression
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckArgumentList:
      var c = child.argumentList
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c

    else: assert false, couple & " plz impl for child: " & $child.kind

  of ckInitializerExpression:
    var p = parent.initializerExpression
    case child.kind
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckInitializerExpression:
      var c = child.initializerExpression
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedLambdaExpression:
      var c = child.parenthesizedLambdaExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckSimpleLambdaExpression:
      var c = child.simpleLambdaExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind

  of ckLiteralExpression:
    var p = parent.literalExpression
    case child.kind
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckVariable:
    var p = parent.variable
    case child.kind
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckVariableDeclarator:
      var c = child.variableDeclarator
      c.parentId = p.id; p.add c
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    of ckPointerType:
      var c = child.pointerType
      c.parentId = p.id; p.add c
    of ckRefType:
      var c = child.refType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckGenericName:
    var p = parent.genericName
    case child.kind
    of ckTypeArgumentList:
      var c = child.typeArgumentList
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind

  of ckUsingDirective:
    var p = parent.usingDirective
    case child.kind
    of ckNameEquals:
      var c = child.nameEquals
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c

    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckNameEquals:
    var p = parent.nameEquals
    case child.kind
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind

  of ckParameter:
    var p = parent.parameter
    case child.kind
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckEqualsValueClause:
      var c = child.equalsValueClause
      c.parentId = p.id; p.add c

    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckField:
    var p = parent.field
    case child.kind
    of ckVariable:
      var c = child.variable
      c.parentId = p.id; p.add c
    of ckVariableDeclarator:
      var c = child.variableDeclarator
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckInvocationExpression:
    var p = parent.invocationExpression
    case child.kind
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckArgumentList:
      var c = child.argumentList
      c.parentId = p.id; p.add c


    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckEqualsValueClause:
    var p = parent.equalsValueClause
    case child.kind
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c

    of ckInitializerExpression:
      var c = child.initializerExpression
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedLambdaExpression:
      var c = child.parenthesizedLambdaExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckSimpleLambdaExpression:
      var c = child.simpleLambdaExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckImplicitArrayCreationExpression:
      var c = child.implicitArrayCreationExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckCheckedExpression:
      var c = child.checkedExpression
      c.parentId = p.id; p.add c
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckAnonymousMethodExpression:
      var c = child.anonymousMethodExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind

  of ckArgumentList:
    var p = parent.argumentList
    case child.kind
    of ckArgument:
      var c = child.argument
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckArgument:
    var p = parent.argument
    case child.kind
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckSimpleLambdaExpression:
      var c = child.simpleLambdaExpression
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedLambdaExpression:
      var c = child.parenthesizedLambdaExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckNameColon:
      var c = child.nameColon
      c.parentId = p.id; p.add c
    of ckImplicitArrayCreationExpression:
      var c = child.implicitArrayCreationExpression
      c.parentId = p.id; p.add c
    of ckDefaultExpression:
      var c = child.defaultExpression
      c.parentId = p.id; p.add c
    of ckDeclarationExpression:
      var c = child.declarationExpression
      c.parentId = p.id; p.add c
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckAnonymousObjectCreationExpression:
      var c = child.anonymousObjectCreationExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind

  of ckTypeArgumentList:
    var p = parent.typeArgumentList
    case child.kind
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckTupleType:
      var c = child.tupleType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckPrefixUnaryExpression:
    var p = parent.prefixUnaryExpression
    case child.kind
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c

    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckBracketedParameterList:
    var p = parent.bracketedParameterList
    case child.kind
    of ckParameter:
      var c = child.parameter
      c.parentId = p.id; p.add c

    else: assert false, couple & " plz impl for child: " & $child.kind

  of ckBaseList:
    var p = parent.baseList
    case child.kind
    of ckSimpleBaseType:
      var c = child.simpleBaseType
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckConstructorInitializer:
      var c = child.constructorInitializer
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckMemberAccessExpression:
    var p = parent.memberAccessExpression
    case child.kind
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckBaseExpression:
      var c = child.baseExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckBinaryExpression:
    var p = parent.binaryExpression
    case child.kind
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c

    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c

    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckCheckedExpression:
      var c = child.checkedExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckTypeParameterList:
    var p = parent.typeParameterList
    case child.kind
    of ckTypeParameter:
      var c = child.typeParameter
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckTypeParameterConstraintClause:
    var p = parent.typeParameterConstraintClause
    case child.kind
    of ckTypeConstraint:
      var c = child.typeConstraint
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckTypeConstraint:
    var p = parent.typeConstraint
    case child.kind
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckIfStatement:
    var p = parent.ifStatement
    case child.kind
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckThrowStatement:
      var c = child.throwStatement
      c.parentId = p.id; p.add c
    of ckExpressionStatement:
      var c = child.expressionStatement
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c

    of ckReturnStatement:
      var c = child.returnStatement
      c.parentId = p.id; p.add c
    of ckBreakStatement:
      var c = child.breakStatement
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckIfStatement:
      var c = child.ifStatement
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckThrowExpression:
      var c = child.throwExpression
      c.parentId = p.id; p.add c
    of ckElseClause:
      var c = child.elseClause
      c.parentId = p.id; p.add c
    of ckIsPatternExpression:
      var c = child.isPatternExpression
      c.parentId = p.id; p.add c
    of ckYieldStatement:
      var c = child.yieldStatement
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckCastExpression:
    var p = parent.castExpression
    case child.kind
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckArrayType:
    var p = parent.arrayType
    case child.kind
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckArrayRankSpecifier:
      var c = child.arrayRankSpecifier
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckArrayRankSpecifier:
    var p = parent.arrayRankSpecifier
    case child.kind
    of ckOmittedArraySizeExpression:
      var c = child.omittedArraySizeExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckArrowExpressionClause:
    var p = parent.arrowExpressionClause
    case child.kind
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression

      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedLambdaExpression:
      var c = child.parenthesizedLambdaExpression
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckSimpleLambdaExpression:
      var c = child.simpleLambdaExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckSimpleLambdaExpression:
    var p = parent.simpleLambdaExpression
    case child.kind
    of ckParameter:
      var c = child.parameter
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckSimpleLambdaExpression:
      var c = child.simpleLambdaExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckAnonymousObjectCreationExpression:
      var c = child.anonymousObjectCreationExpression
      c.parentId = p.id; p.add c
    of ckQueryExpression:
      var c = child.queryExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckForStatement:
    var p = parent.forStatement
    case child.kind
    of ckVariable:
      var c = child.variable
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckForStatement:
      var c = child.forStatement
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckExpressionStatement:
      var c = child.expressionStatement
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckIfStatement:
      var c = child.ifStatement
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckElementAccessExpression:
    var p = parent.elementAccessExpression
    case child.kind
    of ckBracketedArgumentList:
      var c = child.bracketedArgumentList
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckBaseExpression:
      var c = child.baseExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckBracketedArgumentList:
    var p = parent.bracketedArgumentList
    case child.kind
    of ckArgument:
      var c = child.argument
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckSimpleBaseType:
    var p = parent.simpleBaseType
    case child.kind
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckWhileStatement:
    var p = parent.whileStatement
    case child.kind
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckExpressionStatement:
      var c = child.expressionStatement
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckParenthesizedExpression:
    var p = parent.parenthesizedExpression
    case child.kind
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedLambdaExpression:
      var c = child.parenthesizedLambdaExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckSimpleLambdaExpression:
      var c = child.simpleLambdaExpression
      c.parentId = p.id; p.add c
    of ckIsPatternExpression:
      var c = child.isPatternExpression
      c.parentId = p.id; p.add c
    of ckQueryExpression:
      var c = child.queryExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckInterpolatedStringExpression:
    var p = parent.interpolatedStringExpression
    case child.kind
    of ckInterpolatedStringText:
      var c = child.interpolatedStringText
      c.parentId = p.id; p.add c
    of ckInterpolation:
      var c = child.interpolation
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckThrowStatement:
    var p = parent.throwStatement
    case child.kind
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckConditionalExpression:
    var p = parent.conditionalExpression
    case child.kind
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckArrayCreationExpression:
    var p = parent.arrayCreationExpression
    case child.kind
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckInitializerExpression:
      var c = child.initializerExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckUsingStatement:
    var p = parent.usingStatement
    case child.kind
    of ckVariable:
      var c = child.variable
      c.parentId = p.id; p.add c
    of ckUsingStatement:
      var c = child.usingStatement
      c.parentId = p.id; p.add c
    of ckExpressionStatement:
      var c = child.expressionStatement
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckIfStatement:
      var c = child.ifStatement
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckParenthesizedLambdaExpression:
    var p = parent.parenthesizedLambdaExpression
    case child.kind
    of ckParameterList:
      var c = child.parameterList
      c.parentId = p.id; p.add c

    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedLambdaExpression:
      var c = child.parenthesizedLambdaExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckTryStatement:
    var p = parent.tryStatement
    case child.kind
    of ckCatchClause:
      var c = child.catchClause
      c.parentId = p.id; p.add c
    of ckFinallyClause:
      var c = child.finallyClause
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckCatchClause:
    var p = parent.catchClause
    case child.kind
    of ckCatch:
      var c = child.catch
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckAccessor:
    var p = parent.accessor
    case child.kind
    of ckReturnStatement:
      var c = child.returnStatement
      c.parentId = p.id; p.add c
    of ckArrowExpressionClause:
      var c = child.arrowExpressionClause
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckConstructorInitializer:
    var p = parent.constructorInitializer
    case child.kind
    of ckArgumentList:
      var c = child.argumentList
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind

  of ckInterpolation:
    var p = parent.interpolation
    case child.kind
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckPostfixUnaryExpression:
    var p = parent.postfixUnaryExpression
    case child.kind
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckTypeOfExpression:
    var p = parent.typeOfExpression
    case child.kind
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c

    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c

    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckExplicitInterfaceSpecifier:
    var p = parent.explicitInterfaceSpecifier
    case child.kind
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckPredefinedType:
    var p = parent.predefinedType

    case child.kind
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckDoStatement:
    var p = parent.doStatement
    case child.kind
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckDelegate:
    var p = parent.delegate
    case child.kind
    else: assert false, couple & " plz impl for child: " & $child.kind
  else: assert false, couple & " plz impl for parent: " & $parent.kind
