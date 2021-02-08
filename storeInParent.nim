import constructs/[cs_all_constructs, justtypes]
import types, construct
import  options

proc add*(parent, child: Construct; data: AllNeededData) =
  echo "in add <Construct>"
  let couple : string = $parent.kind & " -> " & $child.kind
  echo couple
  case parent.kind
  of ckTypeParameterList:
    var p = parent.typeParameterList
    case child.kind
    of ckTypeParameter:
      var c = child.typeParameter
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckArrayRankSpecifier:
    var p = parent.arrayRankSpecifier
    case child.kind
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckCheckedExpression:
      var c = child.checkedExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
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
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckOmittedArraySizeExpression:
      var c = child.omittedArraySizeExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckFixedStatement:
    var p = parent.fixedStatement
    case child.kind
    of ckVariable:
      var c = child.variable
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckInterpolation:
    var p = parent.interpolation
    case child.kind
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckInterpolationAlignmentClause:
      var c = child.interpolationAlignmentClause
      c.parentId = p.id; p.add c
    of ckInterpolationFormatClause:
      var c = child.interpolationFormatClause
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckNameEquals:
    var p = parent.nameEquals
    case child.kind
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckCatch:
    var p = parent.catch
    case child.kind
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckBaseList:
    var p = parent.baseList
    case child.kind
    of ckConstructorInitializer:
      var c = child.constructorInitializer
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckSimpleBaseType:
      var c = child.simpleBaseType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckPointerType:
    var p = parent.pointerType
    case child.kind
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckPointerType:
      var c = child.pointerType
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckField:
    var p = parent.field
    case child.kind
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckVariable:
      var c = child.variable
      c.parentId = p.id; p.add c
    of ckVariableDeclarator:
      var c = child.variableDeclarator
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckDeclarationExpression:
    var p = parent.declarationExpression
    case child.kind
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckDiscardDesignation:
      var c = child.discardDesignation
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    of ckParenthesizedVariableDesignation:
      var c = child.parenthesizedVariableDesignation
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckSingleVariableDesignation:
      var c = child.singleVariableDesignation
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckOmittedTypeArgument:
    var p = parent.omittedTypeArgument
    case child.kind
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckIsPatternExpression:
    var p = parent.isPatternExpression
    case child.kind
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckConstantPattern:
      var c = child.constantPattern
      c.parentId = p.id; p.add c
    of ckDeclarationPattern:
      var c = child.declarationPattern
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
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckRecursivePattern:
      var c = child.recursivePattern
      c.parentId = p.id; p.add c
    of ckUnaryPattern:
      var c = child.unaryPattern
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckImplicitObjectCreationExpression:
    var p = parent.implicitObjectCreationExpression
    case child.kind
    of ckArgumentList:
      var c = child.argumentList
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckPositionalPatternClause:
    var p = parent.positionalPatternClause
    case child.kind
    of ckSubpattern:
      var c = child.subpattern
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckBracketedArgumentList:
    var p = parent.bracketedArgumentList
    case child.kind
    of ckArgument:
      var c = child.argument
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckGotoStatement:
    var p = parent.gotoStatement
    case child.kind
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckBracketedParameterList:
    var p = parent.bracketedParameterList
    case child.kind
    of ckParameter:
      var c = child.parameter
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckLetClause:
    var p = parent.letClause
    case child.kind
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckQueryExpression:
      var c = child.queryExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckEqualsValueClause:
    var p = parent.equalsValueClause
    case child.kind
    of ckAnonymousMethodExpression:
      var c = child.anonymousMethodExpression
      c.parentId = p.id; p.add c
    of ckAnonymousObjectCreationExpression:
      var c = child.anonymousObjectCreationExpression
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckCheckedExpression:
      var c = child.checkedExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckDefaultExpression:
      var c = child.defaultExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckImplicitArrayCreationExpression:
      var c = child.implicitArrayCreationExpression
      c.parentId = p.id; p.add c
    of ckImplicitObjectCreationExpression:
      var c = child.implicitObjectCreationExpression
      c.parentId = p.id; p.add c
    of ckInitializerExpression:
      var c = child.initializerExpression
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckIsPatternExpression:
      var c = child.isPatternExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMakeRefExpression:
      var c = child.makeRefExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedLambdaExpression:
      var c = child.parenthesizedLambdaExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckQueryExpression:
      var c = child.queryExpression
      c.parentId = p.id; p.add c
    of ckRefExpression:
      var c = child.refExpression
      c.parentId = p.id; p.add c
    of ckRefTypeExpression:
      var c = child.refTypeExpression
      c.parentId = p.id; p.add c
    of ckRefValueExpression:
      var c = child.refValueExpression
      c.parentId = p.id; p.add c
    of ckSimpleLambdaExpression:
      var c = child.simpleLambdaExpression
      c.parentId = p.id; p.add c
    of ckStackAllocArrayCreationExpression:
      var c = child.stackAllocArrayCreationExpression
      c.parentId = p.id; p.add c
    of ckSwitchExpression:
      var c = child.switchExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckTupleExpression:
      var c = child.tupleExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckRefExpression:
    var p = parent.refExpression
    case child.kind
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
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
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckParenthesizedLambdaExpression:
    var p = parent.parenthesizedLambdaExpression
    case child.kind
    of ckAnonymousMethodExpression:
      var c = child.anonymousMethodExpression
      c.parentId = p.id; p.add c
    of ckAnonymousObjectCreationExpression:
      var c = child.anonymousObjectCreationExpression
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckDefaultExpression:
      var c = child.defaultExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckIsPatternExpression:
      var c = child.isPatternExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckParameterList:
      var c = child.parameterList
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedLambdaExpression:
      var c = child.parenthesizedLambdaExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckQueryExpression:
      var c = child.queryExpression
      c.parentId = p.id; p.add c
    of ckRefExpression:
      var c = child.refExpression
      c.parentId = p.id; p.add c
    of ckThrowExpression:
      var c = child.throwExpression
      c.parentId = p.id; p.add c
    of ckTupleExpression:
      var c = child.tupleExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckSwitchExpressionArm:
    var p = parent.switchExpressionArm
    case child.kind
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckBinaryPattern:
      var c = child.binaryPattern
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckConstantPattern:
      var c = child.constantPattern
      c.parentId = p.id; p.add c
    of ckDeclarationPattern:
      var c = child.declarationPattern
      c.parentId = p.id; p.add c
    of ckDiscardPattern:
      var c = child.discardPattern
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckRecursivePattern:
      var c = child.recursivePattern
      c.parentId = p.id; p.add c
    of ckThrowExpression:
      var c = child.throwExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckTypeArgumentList:
    var p = parent.typeArgumentList
    case child.kind
    of ckAliasQualifiedName:
      var c = child.aliasQualifiedName
      c.parentId = p.id; p.add c
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    of ckOmittedTypeArgument:
      var c = child.omittedTypeArgument
      c.parentId = p.id; p.add c
    of ckPointerType:
      var c = child.pointerType
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckTupleType:
      var c = child.tupleType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckYieldStatement:
    var p = parent.yieldStatement
    case child.kind
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
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
    of ckDefaultExpression:
      var c = child.defaultExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckImplicitArrayCreationExpression:
      var c = child.implicitArrayCreationExpression
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckTupleExpression:
      var c = child.tupleExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckTupleElement:
    var p = parent.tupleElement
    case child.kind
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckTupleType:
      var c = child.tupleType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckTupleExpression:
    var p = parent.tupleExpression
    case child.kind
    of ckArgument:
      var c = child.argument
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckRefValueExpression:
    var p = parent.refValueExpression
    case child.kind
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckSwitchExpression:
    var p = parent.switchExpression
    case child.kind
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckSwitchExpressionArm:
      var c = child.switchExpressionArm
      c.parentId = p.id; p.add c
    of ckTupleExpression:
      var c = child.tupleExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckElementAccessExpression:
    var p = parent.elementAccessExpression
    case child.kind
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckBaseExpression:
      var c = child.baseExpression
      c.parentId = p.id; p.add c
    of ckBracketedArgumentList:
      var c = child.bracketedArgumentList
      c.parentId = p.id; p.add c
    of ckDefaultExpression:
      var c = child.defaultExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckImplicitArrayCreationExpression:
      var c = child.implicitArrayCreationExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckMemberBindingExpression:
      var c = child.memberBindingExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckArrayType:
    var p = parent.arrayType
    case child.kind
    of ckArrayRankSpecifier:
      var c = child.arrayRankSpecifier
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    of ckPointerType:
      var c = child.pointerType
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckTupleType:
      var c = child.tupleType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckDoStatement:
    var p = parent.doStatement
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
    of ckIsPatternExpression:
      var c = child.isPatternExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckAwaitExpression:
    var p = parent.awaitExpression
    case child.kind
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckCheckedExpression:
      var c = child.checkedExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckDefaultExpression:
      var c = child.defaultExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckCatchClause:
    var p = parent.catchClause
    case child.kind
    of ckCatch:
      var c = child.catch
      c.parentId = p.id; p.add c
    of ckCatchFilterClause:
      var c = child.catchFilterClause
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckArrowExpressionClause:
    var p = parent.arrowExpressionClause
    case child.kind
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckCheckedExpression:
      var c = child.checkedExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckDefaultExpression:
      var c = child.defaultExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckImplicitArrayCreationExpression:
      var c = child.implicitArrayCreationExpression
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckIsPatternExpression:
      var c = child.isPatternExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedLambdaExpression:
      var c = child.parenthesizedLambdaExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckQueryExpression:
      var c = child.queryExpression
      c.parentId = p.id; p.add c
    of ckRefExpression:
      var c = child.refExpression
      c.parentId = p.id; p.add c
    of ckSimpleLambdaExpression:
      var c = child.simpleLambdaExpression
      c.parentId = p.id; p.add c
    of ckSwitchExpression:
      var c = child.switchExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckThrowExpression:
      var c = child.throwExpression
      c.parentId = p.id; p.add c
    of ckTupleExpression:
      var c = child.tupleExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    of ckWithExpression:
      var c = child.withExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckTupleType:
    var p = parent.tupleType
    case child.kind
    of ckTupleElement:
      var c = child.tupleElement
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckLocalDeclarationStatement:
    var p = parent.localDeclarationStatement
    case child.kind
    of ckArgumentList:
      var c = child.argumentList
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckTypeArgumentList:
      var c = child.typeArgumentList
      c.parentId = p.id; p.add c
    of ckVariable:
      var c = child.variable
      c.parentId = p.id; p.add c
    of ckVariableDeclarator:
      var c = child.variableDeclarator
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckAnonymousMethodExpression:
    var p = parent.anonymousMethodExpression
    case child.kind
    of ckParameterList:
      var c = child.parameterList
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckMemberAccessExpression:
    var p = parent.memberAccessExpression
    case child.kind
    of ckAliasQualifiedName:
      var c = child.aliasQualifiedName
      c.parentId = p.id; p.add c
    of ckAnonymousObjectCreationExpression:
      var c = child.anonymousObjectCreationExpression
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckBaseExpression:
      var c = child.baseExpression
      c.parentId = p.id; p.add c
    of ckDefaultExpression:
      var c = child.defaultExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckElementBindingExpression:
      var c = child.elementBindingExpression
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckImplicitArrayCreationExpression:
      var c = child.implicitArrayCreationExpression
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckMemberBindingExpression:
      var c = child.memberBindingExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckRefTypeExpression:
      var c = child.refTypeExpression
      c.parentId = p.id; p.add c
    of ckRefValueExpression:
      var c = child.refValueExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckTupleExpression:
      var c = child.tupleExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckInitializerExpression:
    var p = parent.initializerExpression
    case child.kind
    of ckAnonymousMethodExpression:
      var c = child.anonymousMethodExpression
      c.parentId = p.id; p.add c
    of ckAnonymousObjectCreationExpression:
      var c = child.anonymousObjectCreationExpression
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckCheckedExpression:
      var c = child.checkedExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckDefaultExpression:
      var c = child.defaultExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckImplicitArrayCreationExpression:
      var c = child.implicitArrayCreationExpression
      c.parentId = p.id; p.add c
    of ckInitializerExpression:
      var c = child.initializerExpression
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedLambdaExpression:
      var c = child.parenthesizedLambdaExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckSimpleLambdaExpression:
      var c = child.simpleLambdaExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckThrowExpression:
      var c = child.throwExpression
      c.parentId = p.id; p.add c
    of ckTupleExpression:
      var c = child.tupleExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckAliasQualifiedName:
    var p = parent.aliasQualifiedName
    case child.kind
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckParenthesizedVariableDesignation:
    var p = parent.parenthesizedVariableDesignation
    case child.kind
    of ckDiscardDesignation:
      var c = child.discardDesignation
      c.parentId = p.id; p.add c
    of ckSingleVariableDesignation:
      var c = child.singleVariableDesignation
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckAccessorList:
    var p = parent.accessorList
    case child.kind
    of ckAccessor:
      var c = child.accessor
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckConstantPattern:
    var p = parent.constantPattern
    case child.kind
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckDefaultExpression:
      var c = child.defaultExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckArgumentList:
    var p = parent.argumentList
    case child.kind
    of ckArgument:
      var c = child.argument
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckPrefixUnaryExpression:
    var p = parent.prefixUnaryExpression
    case child.kind
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
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
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckTypeOfExpression:
    var p = parent.typeOfExpression
    case child.kind
    of ckAliasQualifiedName:
      var c = child.aliasQualifiedName
      c.parentId = p.id; p.add c
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    of ckPointerType:
      var c = child.pointerType
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckLabeledStatement:
    var p = parent.labeledStatement
    case child.kind
    of ckBreakStatement:
      var c = child.breakStatement
      c.parentId = p.id; p.add c
    of ckExpressionStatement:
      var c = child.expressionStatement
      c.parentId = p.id; p.add c
    of ckGotoStatement:
      var c = child.gotoStatement
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckImplicitArrayCreationExpression:
    var p = parent.implicitArrayCreationExpression
    case child.kind
    of ckInitializerExpression:
      var c = child.initializerExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckDestructor:
    var p = parent.destructor
    case child.kind
    of ckParameterList:
      var c = child.parameterList
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckExpressionStatement:
    var p = parent.expressionStatement
    case child.kind
    of ckArgument:
      var c = child.argument
      c.parentId = p.id; p.add c
    of ckArgumentList:
      var c = child.argumentList
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
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
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckQueryExpression:
      var c = child.queryExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckLockStatement:
    var p = parent.lockStatement
    case child.kind
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckEmptyStatement:
      var c = child.emptyStatement
      c.parentId = p.id; p.add c
    of ckExpressionStatement:
      var c = child.expressionStatement
      c.parentId = p.id; p.add c
    of ckIfStatement:
      var c = child.ifStatement
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckLockStatement:
      var c = child.lockStatement
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckReturnStatement:
      var c = child.returnStatement
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckRecursivePattern:
    var p = parent.recursivePattern
    case child.kind
    of ckPositionalPatternClause:
      var c = child.positionalPatternClause
      c.parentId = p.id; p.add c
    of ckPropertyPatternClause:
      var c = child.propertyPatternClause
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckConversionOperator:
    var p = parent.conversionOperator
    case child.kind
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckArrowExpressionClause:
      var c = child.arrowExpressionClause
      c.parentId = p.id; p.add c
    of ckParameterList:
      var c = child.parameterList
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckEnum:
    var p = parent.cenum
    case child.kind
    of ckBaseList:
      var c = child.baseList
      c.parentId = p.id; p.add c
    of ckEnumMember:
      var c = child.enumMember
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckClass:
    var p = parent.class
    case child.kind
    of ckBaseList:
      var c = child.baseList
      c.parentId = p.id; p.add c
    of ckClass:
      var c = child.class
      c.parentId = p.id; p.add c
    of ckConstructor:
      var c = child.constructor
      c.parentId = p.id; p.add c
    of ckConversionOperator:
      var c = child.conversionOperator
      c.parentId = p.id; p.add c
    of ckDelegate:
      var c = child.delegate
      c.parentId = p.id; p.add c
    of ckDestructor:
      var c = child.destructor
      c.parentId = p.id; p.add c
    of ckEnum:
      var c = child.cenum
      c.parentId = p.id; p.add c
    of ckEvent:
      var c = child.event
      c.parentId = p.id; p.add c
    of ckEventField:
      var c = child.eventField
      c.parentId = p.id; p.add c
    of ckField:
      var c = child.field
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckIncompleteMember:
      var c = child.incompleteMember
      c.parentId = p.id; p.add c
    of ckIndexer:
      var c = child.indexer
      c.parentId = p.id; p.add c
    of ckInterface:
      var c = child.cinterface
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMethod:
      var c = child.cmethod
      c.parentId = p.id; p.add c
    of ckOperator:
      var c = child.operator
      c.parentId = p.id; p.add c
    of ckProperty:
      var c = child.property
      c.parentId = p.id; p.add c
    of ckStruct:
      var c = child.struct
      c.parentId = p.id; p.add c
    of ckTypeParameterConstraintClause:
      var c = child.typeParameterConstraintClause
      c.parentId = p.id; p.add c
    of ckTypeParameterList:
      var c = child.typeParameterList
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckSwitchStatement:
    var p = parent.switchStatement
    case child.kind
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckDefaultExpression:
      var c = child.defaultExpression
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
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckSwitchSection:
      var c = child.switchSection
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckParenthesizedExpression:
    var p = parent.parenthesizedExpression
    case child.kind
    of ckAnonymousMethodExpression:
      var c = child.anonymousMethodExpression
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckCheckedExpression:
      var c = child.checkedExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckImplicitArrayCreationExpression:
      var c = child.implicitArrayCreationExpression
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckIsPatternExpression:
      var c = child.isPatternExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedLambdaExpression:
      var c = child.parenthesizedLambdaExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckQueryExpression:
      var c = child.queryExpression
      c.parentId = p.id; p.add c
    of ckSimpleLambdaExpression:
      var c = child.simpleLambdaExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckCasePatternSwitchLabel:
    var p = parent.casePatternSwitchLabel
    case child.kind
    of ckConstantPattern:
      var c = child.constantPattern
      c.parentId = p.id; p.add c
    of ckDeclarationPattern:
      var c = child.declarationPattern
      c.parentId = p.id; p.add c
    of ckWhenClause:
      var c = child.whenClause
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckSwitchSection:
    var p = parent.switchSection
    case child.kind
    of ckBreakStatement:
      var c = child.breakStatement
      c.parentId = p.id; p.add c
    of ckCasePatternSwitchLabel:
      var c = child.casePatternSwitchLabel
      c.parentId = p.id; p.add c
    of ckCaseSwitchLabel:
      var c = child.caseSwitchLabel
      c.parentId = p.id; p.add c
    of ckContinueStatement:
      var c = child.continueStatement
      c.parentId = p.id; p.add c
    of ckDefaultSwitchLabel:
      var c = child.defaultSwitchLabel
      c.parentId = p.id; p.add c
    of ckEmptyStatement:
      var c = child.emptyStatement
      c.parentId = p.id; p.add c
    of ckExpressionStatement:
      var c = child.expressionStatement
      c.parentId = p.id; p.add c
    of ckForEachStatement:
      var c = child.forEachStatement
      c.parentId = p.id; p.add c
    of ckForStatement:
      var c = child.forStatement
      c.parentId = p.id; p.add c
    of ckGotoStatement:
      var c = child.gotoStatement
      c.parentId = p.id; p.add c
    of ckIfStatement:
      var c = child.ifStatement
      c.parentId = p.id; p.add c
    of ckLabeledStatement:
      var c = child.labeledStatement
      c.parentId = p.id; p.add c
    of ckLocalDeclarationStatement:
      var c = child.localDeclarationStatement
      c.parentId = p.id; p.add c
    of ckReturnStatement:
      var c = child.returnStatement
      c.parentId = p.id; p.add c
    of ckSwitchStatement:
      var c = child.switchStatement
      c.parentId = p.id; p.add c
    of ckThrowStatement:
      var c = child.throwStatement
      c.parentId = p.id; p.add c
    of ckTryStatement:
      var c = child.tryStatement
      c.parentId = p.id; p.add c
    of ckUsingStatement:
      var c = child.usingStatement
      c.parentId = p.id; p.add c
    of ckWhileStatement:
      var c = child.whileStatement
      c.parentId = p.id; p.add c
    of ckYieldStatement:
      var c = child.yieldStatement
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckQueryExpression:
    var p = parent.queryExpression
    case child.kind
    of ckQueryBody:
      var c = child.queryBody
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckProperty:
    var p = parent.property
    case child.kind
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
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckLocalDeclarationStatement:
      var c = child.localDeclarationStatement
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    of ckPointerType:
      var c = child.pointerType
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckRefType:
      var c = child.refType
      c.parentId = p.id; p.add c
    of ckTupleType:
      var c = child.tupleType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckCastExpression:
    var p = parent.castExpression
    case child.kind
    of ckAnonymousMethodExpression:
      var c = child.anonymousMethodExpression
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckBaseExpression:
      var c = child.baseExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckCheckedExpression:
      var c = child.checkedExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckDefaultExpression:
      var c = child.defaultExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckImplicitArrayCreationExpression:
      var c = child.implicitArrayCreationExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckPointerType:
      var c = child.pointerType
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckTupleExpression:
      var c = child.tupleExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckBinaryExpression:
    var p = parent.binaryExpression
    case child.kind
    of ckAnonymousMethodExpression:
      var c = child.anonymousMethodExpression
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckBaseExpression:
      var c = child.baseExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckCheckedExpression:
      var c = child.checkedExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckDefaultExpression:
      var c = child.defaultExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckImplicitArrayCreationExpression:
      var c = child.implicitArrayCreationExpression
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckIsPatternExpression:
      var c = child.isPatternExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckRangeExpression:
      var c = child.rangeExpression
      c.parentId = p.id; p.add c
    of ckSizeOfExpression:
      var c = child.sizeOfExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckThrowExpression:
      var c = child.throwExpression
      c.parentId = p.id; p.add c
    of ckTupleExpression:
      var c = child.tupleExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckAnonymousObjectMemberDeclarator:
    var p = parent.anonymousObjectMemberDeclarator
    case child.kind
    of ckAnonymousMethodExpression:
      var c = child.anonymousMethodExpression
      c.parentId = p.id; p.add c
    of ckAnonymousObjectCreationExpression:
      var c = child.anonymousObjectCreationExpression
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
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
    of ckDefaultExpression:
      var c = child.defaultExpression
      c.parentId = p.id; p.add c
    of ckImplicitArrayCreationExpression:
      var c = child.implicitArrayCreationExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckNameEquals:
      var c = child.nameEquals
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckSimpleLambdaExpression:
      var c = child.simpleLambdaExpression
      c.parentId = p.id; p.add c
    of ckTupleExpression:
      var c = child.tupleExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckSimpleBaseType:
    var p = parent.simpleBaseType
    case child.kind
    of ckAliasQualifiedName:
      var c = child.aliasQualifiedName
      c.parentId = p.id; p.add c
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    of ckPointerType:
      var c = child.pointerType
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckInterface:
    var p = parent.cinterface
    case child.kind
    of ckBaseList:
      var c = child.baseList
      c.parentId = p.id; p.add c
    of ckClass:
      var c = child.class
      c.parentId = p.id; p.add c
    of ckConstructor:
      var c = child.constructor
      c.parentId = p.id; p.add c
    of ckDelegate:
      var c = child.delegate
      c.parentId = p.id; p.add c
    of ckEnum:
      var c = child.cenum
      c.parentId = p.id; p.add c
    of ckEventField:
      var c = child.eventField
      c.parentId = p.id; p.add c
    of ckField:
      var c = child.field
      c.parentId = p.id; p.add c
    of ckIncompleteMember:
      var c = child.incompleteMember
      c.parentId = p.id; p.add c
    of ckIndexer:
      var c = child.indexer
      c.parentId = p.id; p.add c
    of ckInterface:
      var c = child.cinterface
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMethod:
      var c = child.cmethod
      c.parentId = p.id; p.add c
    of ckProperty:
      var c = child.property
      c.parentId = p.id; p.add c
    of ckStruct:
      var c = child.struct
      c.parentId = p.id; p.add c
    of ckTypeParameterConstraintClause:
      var c = child.typeParameterConstraintClause
      c.parentId = p.id; p.add c
    of ckTypeParameterList:
      var c = child.typeParameterList
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckAccessor:
    var p = parent.accessor
    case child.kind
    of ckArrowExpressionClause:
      var c = child.arrowExpressionClause
      c.parentId = p.id; p.add c
    of ckForEachStatement:
      var c = child.forEachStatement
      c.parentId = p.id; p.add c
    of ckForStatement:
      var c = child.forStatement
      c.parentId = p.id; p.add c
    of ckIfStatement:
      var c = child.ifStatement
      c.parentId = p.id; p.add c
    of ckLockStatement:
      var c = child.lockStatement
      c.parentId = p.id; p.add c
    of ckReturnStatement:
      var c = child.returnStatement
      c.parentId = p.id; p.add c
    of ckThrowStatement:
      var c = child.throwStatement
      c.parentId = p.id; p.add c
    of ckTryStatement:
      var c = child.tryStatement
      c.parentId = p.id; p.add c
    of ckUsingStatement:
      var c = child.usingStatement
      c.parentId = p.id; p.add c
    of ckWhileStatement:
      var c = child.whileStatement
      c.parentId = p.id; p.add c
    of ckYieldStatement:
      var c = child.yieldStatement
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckObjectCreationExpression:
    var p = parent.objectCreationExpression
    case child.kind
    of ckAliasQualifiedName:
      var c = child.aliasQualifiedName
      c.parentId = p.id; p.add c
    of ckArgumentList:
      var c = child.argumentList
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckInitializerExpression:
      var c = child.initializerExpression
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckTupleType:
      var c = child.tupleType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckQueryBody:
    var p = parent.queryBody
    case child.kind
    of ckLetClause:
      var c = child.letClause
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckCatchFilterClause:
    var p = parent.catchFilterClause
    case child.kind
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
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
  of ckEnumMember:
    var p = parent.enumMember
    case child.kind
    of ckEqualsValueClause:
      var c = child.equalsValueClause
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckPostfixUnaryExpression:
    var p = parent.postfixUnaryExpression
    case child.kind
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckDefaultExpression:
      var c = child.defaultExpression
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
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckTupleExpression:
      var c = child.tupleExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckOperator:
    var p = parent.operator
    case child.kind
    of ckArrowExpressionClause:
      var c = child.arrowExpressionClause
      c.parentId = p.id; p.add c
    of ckParameterList:
      var c = child.parameterList
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckParameter:
    var p = parent.parameter
    case child.kind
    of ckAliasQualifiedName:
      var c = child.aliasQualifiedName
      c.parentId = p.id; p.add c
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckEqualsValueClause:
      var c = child.equalsValueClause
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    of ckPointerType:
      var c = child.pointerType
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckTupleType:
      var c = child.tupleType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckAssignmentExpression:
    var p = parent.assignmentExpression
    case child.kind
    of ckAnonymousMethodExpression:
      var c = child.anonymousMethodExpression
      c.parentId = p.id; p.add c
    of ckAnonymousObjectCreationExpression:
      var c = child.anonymousObjectCreationExpression
      c.parentId = p.id; p.add c
    of ckArgumentList:
      var c = child.argumentList
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckBaseExpression:
      var c = child.baseExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckCheckedExpression:
      var c = child.checkedExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckDeclarationExpression:
      var c = child.declarationExpression
      c.parentId = p.id; p.add c
    of ckDefaultExpression:
      var c = child.defaultExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckImplicitArrayCreationExpression:
      var c = child.implicitArrayCreationExpression
      c.parentId = p.id; p.add c
    of ckImplicitElementAccess:
      var c = child.implicitElementAccess
      c.parentId = p.id; p.add c
    of ckImplicitObjectCreationExpression:
      var c = child.implicitObjectCreationExpression
      c.parentId = p.id; p.add c
    of ckInitializerExpression:
      var c = child.initializerExpression
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckIsPatternExpression:
      var c = child.isPatternExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedLambdaExpression:
      var c = child.parenthesizedLambdaExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckQueryExpression:
      var c = child.queryExpression
      c.parentId = p.id; p.add c
    of ckRefValueExpression:
      var c = child.refValueExpression
      c.parentId = p.id; p.add c
    of ckSimpleLambdaExpression:
      var c = child.simpleLambdaExpression
      c.parentId = p.id; p.add c
    of ckSwitchExpression:
      var c = child.switchExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckTupleExpression:
      var c = child.tupleExpression
      c.parentId = p.id; p.add c
    of ckTypeArgumentList:
      var c = child.typeArgumentList
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckMethod:
    var p = parent.cmethod
    case child.kind
    of ckAliasQualifiedName:
      var c = child.aliasQualifiedName
      c.parentId = p.id; p.add c
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckArrowExpressionClause:
      var c = child.arrowExpressionClause
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckContinueStatement:
      var c = child.continueStatement
      c.parentId = p.id; p.add c
    of ckDoStatement:
      var c = child.doStatement
      c.parentId = p.id; p.add c
    of ckExplicitInterfaceSpecifier:
      var c = child.explicitInterfaceSpecifier
      c.parentId = p.id; p.add c
    of ckExpressionStatement:
      var c = child.expressionStatement
      c.parentId = p.id; p.add c
    of ckForEachStatement:
      var c = child.forEachStatement
      c.parentId = p.id; p.add c
    of ckForStatement:
      var c = child.forStatement
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckGotoStatement:
      var c = child.gotoStatement
      c.parentId = p.id; p.add c
    of ckIfStatement:
      var c = child.ifStatement
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckLocalDeclarationStatement:
      var c = child.localDeclarationStatement
      c.parentId = p.id; p.add c
    of ckLockStatement:
      var c = child.lockStatement
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    of ckParameterList:
      var c = child.parameterList
      c.parentId = p.id; p.add c
    of ckPointerType:
      var c = child.pointerType
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckRefType:
      var c = child.refType
      c.parentId = p.id; p.add c
    of ckReturnStatement:
      var c = child.returnStatement
      c.parentId = p.id; p.add c
    of ckSwitchStatement:
      var c = child.switchStatement
      c.parentId = p.id; p.add c
    of ckThrowStatement:
      var c = child.throwStatement
      c.parentId = p.id; p.add c
    of ckTryStatement:
      var c = child.tryStatement
      c.parentId = p.id; p.add c
    of ckTupleType:
      var c = child.tupleType
      c.parentId = p.id; p.add c
    of ckTypeParameterConstraintClause:
      var c = child.typeParameterConstraintClause
      c.parentId = p.id; p.add c
    of ckTypeParameterList:
      var c = child.typeParameterList
      c.parentId = p.id; p.add c
    of ckUsingStatement:
      var c = child.usingStatement
      c.parentId = p.id; p.add c
    of ckVariableDeclarator:
      var c = child.variableDeclarator
      c.parentId = p.id; p.add c
    of ckWhileStatement:
      var c = child.whileStatement
      c.parentId = p.id; p.add c
    of ckYieldStatement:
      var c = child.yieldStatement
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckLiteralExpression:
    var p = parent.literalExpression
    case child.kind
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
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
  of ckNullableType:
    var p = parent.nullableType
    case child.kind
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckTupleType:
      var c = child.tupleType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckUnaryPattern:
    var p = parent.unaryPattern
    case child.kind
    of ckConstantPattern:
      var c = child.constantPattern
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckEvent:
    var p = parent.event
    case child.kind
    of ckAccessorList:
      var c = child.accessorList
      c.parentId = p.id; p.add c
    of ckExplicitInterfaceSpecifier:
      var c = child.explicitInterfaceSpecifier
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckEventField:
    var p = parent.eventField
    case child.kind
    of ckVariable:
      var c = child.variable
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckVariable:
    var p = parent.variable
    case child.kind
    of ckAliasQualifiedName:
      var c = child.aliasQualifiedName
      c.parentId = p.id; p.add c
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    of ckPointerType:
      var c = child.pointerType
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckRefType:
      var c = child.refType
      c.parentId = p.id; p.add c
    of ckTupleType:
      var c = child.tupleType
      c.parentId = p.id; p.add c
    of ckVariableDeclarator:
      var c = child.variableDeclarator
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckUsingDirective:
    var p = parent.usingDirective
    case child.kind
    of ckAliasQualifiedName:
      var c = child.aliasQualifiedName
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckNameEquals:
      var c = child.nameEquals
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckNamespace:
    var p = parent.namespace
    case child.kind
    of ckAliasQualifiedName:
      var c = child.aliasQualifiedName
      c.parentId = p.id; p.add c
    of ckClass:
      var c = child.class
      c.parentId = p.id; p.add c
    of ckConstructor:
      var c = child.constructor
      c.parentId = p.id; p.add c
    of ckDelegate:
      var c = child.delegate
      c.parentId = p.id; p.add c
    of ckEnum:
      var c = child.cenum
      c.parentId = p.id; p.add c
    of ckExternAliasDirective:
      var c = child.externAliasDirective
      c.parentId = p.id; p.add c
    of ckField:
      var c = child.field
      c.parentId = p.id; p.add c
    of ckIncompleteMember:
      var c = child.incompleteMember
      c.parentId = p.id; p.add c
    of ckIndexer:
      var c = child.indexer
      c.parentId = p.id; p.add c
    of ckInterface:
      var c = child.cinterface
      c.parentId = p.id; p.add c
    of ckMethod:
      var c = child.cmethod
      c.parentId = p.id; p.add c
    of ckProperty:
      var c = child.property
      c.parentId = p.id; p.add c
    of ckStruct:
      var c = child.struct
      c.parentId = p.id; p.add c
    of ckUsingDirective:
      var c = child.usingDirective
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckUsingStatement:
    var p = parent.usingStatement
    case child.kind
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckEmptyStatement:
      var c = child.emptyStatement
      c.parentId = p.id; p.add c
    of ckExpressionStatement:
      var c = child.expressionStatement
      c.parentId = p.id; p.add c
    of ckFixedStatement:
      var c = child.fixedStatement
      c.parentId = p.id; p.add c
    of ckIfStatement:
      var c = child.ifStatement
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
    of ckReturnStatement:
      var c = child.returnStatement
      c.parentId = p.id; p.add c
    of ckTryStatement:
      var c = child.tryStatement
      c.parentId = p.id; p.add c
    of ckUsingStatement:
      var c = child.usingStatement
      c.parentId = p.id; p.add c
    of ckVariable:
      var c = child.variable
      c.parentId = p.id; p.add c
    of ckWhileStatement:
      var c = child.whileStatement
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckConditionalAccessExpression:
    var p = parent.conditionalAccessExpression
    case child.kind
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckElementBindingExpression:
      var c = child.elementBindingExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckMemberBindingExpression:
      var c = child.memberBindingExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckMemberBindingExpression:
    var p = parent.memberBindingExpression
    case child.kind
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckBinaryPattern:
    var p = parent.binaryPattern
    case child.kind
    of ckBinaryPattern:
      var c = child.binaryPattern
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckSizeOfExpression:
    var p = parent.sizeOfExpression
    case child.kind
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckInterpolationAlignmentClause:
    var p = parent.interpolationAlignmentClause
    case child.kind
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckDefaultExpression:
    var p = parent.defaultExpression
    case child.kind
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckStruct:
    var p = parent.struct
    case child.kind
    of ckBaseList:
      var c = child.baseList
      c.parentId = p.id; p.add c
    of ckClass:
      var c = child.class
      c.parentId = p.id; p.add c
    of ckConstructor:
      var c = child.constructor
      c.parentId = p.id; p.add c
    of ckConversionOperator:
      var c = child.conversionOperator
      c.parentId = p.id; p.add c
    of ckDelegate:
      var c = child.delegate
      c.parentId = p.id; p.add c
    of ckEnum:
      var c = child.cenum
      c.parentId = p.id; p.add c
    of ckEventField:
      var c = child.eventField
      c.parentId = p.id; p.add c
    of ckField:
      var c = child.field
      c.parentId = p.id; p.add c
    of ckIncompleteMember:
      var c = child.incompleteMember
      c.parentId = p.id; p.add c
    of ckIndexer:
      var c = child.indexer
      c.parentId = p.id; p.add c
    of ckMethod:
      var c = child.cmethod
      c.parentId = p.id; p.add c
    of ckOperator:
      var c = child.operator
      c.parentId = p.id; p.add c
    of ckProperty:
      var c = child.property
      c.parentId = p.id; p.add c
    of ckStruct:
      var c = child.struct
      c.parentId = p.id; p.add c
    of ckTypeParameterConstraintClause:
      var c = child.typeParameterConstraintClause
      c.parentId = p.id; p.add c
    of ckTypeParameterList:
      var c = child.typeParameterList
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckPredefinedType:
    var p = parent.predefinedType
    case child.kind
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckIfStatement:
    var p = parent.ifStatement
    case child.kind
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckBreakStatement:
      var c = child.breakStatement
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckCheckedExpression:
      var c = child.checkedExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckContinueStatement:
      var c = child.continueStatement
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckElseClause:
      var c = child.elseClause
      c.parentId = p.id; p.add c
    of ckEmptyStatement:
      var c = child.emptyStatement
      c.parentId = p.id; p.add c
    of ckExpressionStatement:
      var c = child.expressionStatement
      c.parentId = p.id; p.add c
    of ckForEachStatement:
      var c = child.forEachStatement
      c.parentId = p.id; p.add c
    of ckForStatement:
      var c = child.forStatement
      c.parentId = p.id; p.add c
    of ckGotoStatement:
      var c = child.gotoStatement
      c.parentId = p.id; p.add c
    of ckIfStatement:
      var c = child.ifStatement
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckIsPatternExpression:
      var c = child.isPatternExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckLocalDeclarationStatement:
      var c = child.localDeclarationStatement
      c.parentId = p.id; p.add c
    of ckLockStatement:
      var c = child.lockStatement
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckReturnStatement:
      var c = child.returnStatement
      c.parentId = p.id; p.add c
    of ckSwitchStatement:
      var c = child.switchStatement
      c.parentId = p.id; p.add c
    of ckThrowExpression:
      var c = child.throwExpression
      c.parentId = p.id; p.add c
    of ckThrowStatement:
      var c = child.throwStatement
      c.parentId = p.id; p.add c
    of ckTryStatement:
      var c = child.tryStatement
      c.parentId = p.id; p.add c
    of ckUsingStatement:
      var c = child.usingStatement
      c.parentId = p.id; p.add c
    of ckYieldStatement:
      var c = child.yieldStatement
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckPropertyPatternClause:
    var p = parent.propertyPatternClause
    case child.kind
    of ckSubpattern:
      var c = child.subpattern
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckForStatement:
    var p = parent.forStatement
    case child.kind
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCheckedStatement:
      var c = child.checkedStatement
      c.parentId = p.id; p.add c
    of ckEmptyStatement:
      var c = child.emptyStatement
      c.parentId = p.id; p.add c
    of ckExpressionStatement:
      var c = child.expressionStatement
      c.parentId = p.id; p.add c
    of ckForStatement:
      var c = child.forStatement
      c.parentId = p.id; p.add c
    of ckIfStatement:
      var c = child.ifStatement
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckIsPatternExpression:
      var c = child.isPatternExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckLocalDeclarationStatement:
      var c = child.localDeclarationStatement
      c.parentId = p.id; p.add c
    of ckLockStatement:
      var c = child.lockStatement
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckSwitchStatement:
      var c = child.switchStatement
      c.parentId = p.id; p.add c
    of ckVariable:
      var c = child.variable
      c.parentId = p.id; p.add c
    of ckWhileStatement:
      var c = child.whileStatement
      c.parentId = p.id; p.add c
    of ckYieldStatement:
      var c = child.yieldStatement
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
  of ckElseClause:
    var p = parent.elseClause
    case child.kind
    of ckBreakStatement:
      var c = child.breakStatement
      c.parentId = p.id; p.add c
    of ckContinueStatement:
      var c = child.continueStatement
      c.parentId = p.id; p.add c
    of ckEmptyStatement:
      var c = child.emptyStatement
      c.parentId = p.id; p.add c
    of ckExpressionStatement:
      var c = child.expressionStatement
      c.parentId = p.id; p.add c
    of ckGotoStatement:
      var c = child.gotoStatement
      c.parentId = p.id; p.add c
    of ckIfStatement:
      var c = child.ifStatement
      c.parentId = p.id; p.add c
    of ckLocalDeclarationStatement:
      var c = child.localDeclarationStatement
      c.parentId = p.id; p.add c
    of ckReturnStatement:
      var c = child.returnStatement
      c.parentId = p.id; p.add c
    of ckSwitchStatement:
      var c = child.switchStatement
      c.parentId = p.id; p.add c
    of ckThrowStatement:
      var c = child.throwStatement
      c.parentId = p.id; p.add c
    of ckYieldStatement:
      var c = child.yieldStatement
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckInvocationExpression:
    var p = parent.invocationExpression
    case child.kind
    of ckAliasQualifiedName:
      var c = child.aliasQualifiedName
      c.parentId = p.id; p.add c
    of ckArgumentList:
      var c = child.argumentList
      c.parentId = p.id; p.add c
    of ckBaseExpression:
      var c = child.baseExpression
      c.parentId = p.id; p.add c
    of ckCheckedExpression:
      var c = child.checkedExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckMemberBindingExpression:
      var c = child.memberBindingExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedLambdaExpression:
      var c = child.parenthesizedLambdaExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckParameterList:
    var p = parent.parameterList
    case child.kind
    of ckParameter:
      var c = child.parameter
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckWhileStatement:
    var p = parent.whileStatement
    case child.kind
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckEmptyStatement:
      var c = child.emptyStatement
      c.parentId = p.id; p.add c
    of ckExpressionStatement:
      var c = child.expressionStatement
      c.parentId = p.id; p.add c
    of ckForStatement:
      var c = child.forStatement
      c.parentId = p.id; p.add c
    of ckIfStatement:
      var c = child.ifStatement
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckIsPatternExpression:
      var c = child.isPatternExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckYieldStatement:
      var c = child.yieldStatement
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckGenericName:
    var p = parent.genericName
    case child.kind
    of ckTypeArgumentList:
      var c = child.typeArgumentList
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckThrowStatement:
    var p = parent.throwStatement
    case child.kind
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckIndexer:
    var p = parent.indexer
    case child.kind
    of ckAccessorList:
      var c = child.accessorList
      c.parentId = p.id; p.add c
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckArrowExpressionClause:
      var c = child.arrowExpressionClause
      c.parentId = p.id; p.add c
    of ckBracketedParameterList:
      var c = child.bracketedParameterList
      c.parentId = p.id; p.add c
    of ckExplicitInterfaceSpecifier:
      var c = child.explicitInterfaceSpecifier
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    of ckParameter:
      var c = child.parameter
      c.parentId = p.id; p.add c
    of ckPointerType:
      var c = child.pointerType
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckRefType:
      var c = child.refType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckCaseSwitchLabel:
    var p = parent.caseSwitchLabel
    case child.kind
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckCheckedExpression:
      var c = child.checkedExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckWithExpression:
    var p = parent.withExpression
    case child.kind
    of ckInitializerExpression:
      var c = child.initializerExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckSubpattern:
    var p = parent.subpattern
    case child.kind
    of ckConstantPattern:
      var c = child.constantPattern
      c.parentId = p.id; p.add c
    of ckDiscardPattern:
      var c = child.discardPattern
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckConditionalExpression:
    var p = parent.conditionalExpression
    case child.kind
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckCheckedExpression:
      var c = child.checkedExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckDefaultExpression:
      var c = child.defaultExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckImplicitArrayCreationExpression:
      var c = child.implicitArrayCreationExpression
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckIsPatternExpression:
      var c = child.isPatternExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedLambdaExpression:
      var c = child.parenthesizedLambdaExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckRefExpression:
      var c = child.refExpression
      c.parentId = p.id; p.add c
    of ckSimpleLambdaExpression:
      var c = child.simpleLambdaExpression
      c.parentId = p.id; p.add c
    of ckStackAllocArrayCreationExpression:
      var c = child.stackAllocArrayCreationExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckThrowExpression:
      var c = child.throwExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckConstructor:
    var p = parent.constructor
    case child.kind
    of ckArgumentList:
      var c = child.argumentList
      c.parentId = p.id; p.add c
    of ckArrowExpressionClause:
      var c = child.arrowExpressionClause
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckConstructorInitializer:
      var c = child.constructorInitializer
      c.parentId = p.id; p.add c
    of ckContinueStatement:
      var c = child.continueStatement
      c.parentId = p.id; p.add c
    of ckDoStatement:
      var c = child.doStatement
      c.parentId = p.id; p.add c
    of ckExpressionStatement:
      var c = child.expressionStatement
      c.parentId = p.id; p.add c
    of ckForEachStatement:
      var c = child.forEachStatement
      c.parentId = p.id; p.add c
    of ckForStatement:
      var c = child.forStatement
      c.parentId = p.id; p.add c
    of ckIfStatement:
      var c = child.ifStatement
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckLocalDeclarationStatement:
      var c = child.localDeclarationStatement
      c.parentId = p.id; p.add c
    of ckLockStatement:
      var c = child.lockStatement
      c.parentId = p.id; p.add c
    of ckParameterList:
      var c = child.parameterList
      c.parentId = p.id; p.add c
    of ckReturnStatement:
      var c = child.returnStatement
      c.parentId = p.id; p.add c
    of ckThrowStatement:
      var c = child.throwStatement
      c.parentId = p.id; p.add c
    of ckTryStatement:
      var c = child.tryStatement
      c.parentId = p.id; p.add c
    of ckUsingStatement:
      var c = child.usingStatement
      c.parentId = p.id; p.add c
    of ckWhileStatement:
      var c = child.whileStatement
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckTypeParameterConstraintClause:
    var p = parent.typeParameterConstraintClause
    case child.kind
    of ckClassOrStructConstraint:
      var c = child.classOrStructConstraint
      c.parentId = p.id; p.add c
    of ckConstructorConstraint:
      var c = child.constructorConstraint
      c.parentId = p.id; p.add c
    of ckTypeConstraint:
      var c = child.typeConstraint
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckVariableDeclarator:
    var p = parent.variableDeclarator
    case child.kind
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckBracketedArgumentList:
      var c = child.bracketedArgumentList
      c.parentId = p.id; p.add c
    of ckEqualsValueClause:
      var c = child.equalsValueClause
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckTypeConstraint:
    var p = parent.typeConstraint
    case child.kind
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckSimpleLambdaExpression:
    var p = parent.simpleLambdaExpression
    case child.kind
    of ckAnonymousObjectCreationExpression:
      var c = child.anonymousObjectCreationExpression
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckDefaultExpression:
      var c = child.defaultExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckImplicitArrayCreationExpression:
      var c = child.implicitArrayCreationExpression
      c.parentId = p.id; p.add c
    of ckImplicitObjectCreationExpression:
      var c = child.implicitObjectCreationExpression
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckIsPatternExpression:
      var c = child.isPatternExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckParameter:
      var c = child.parameter
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckQueryExpression:
      var c = child.queryExpression
      c.parentId = p.id; p.add c
    of ckSimpleLambdaExpression:
      var c = child.simpleLambdaExpression
      c.parentId = p.id; p.add c
    of ckSwitchExpression:
      var c = child.switchExpression
      c.parentId = p.id; p.add c
    of ckThrowExpression:
      var c = child.throwExpression
      c.parentId = p.id; p.add c
    of ckTupleExpression:
      var c = child.tupleExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckStackAllocArrayCreationExpression:
    var p = parent.stackAllocArrayCreationExpression
    case child.kind
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckInitializerExpression:
      var c = child.initializerExpression
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckIncompleteMember:
    var p = parent.incompleteMember
    case child.kind
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckPointerType:
      var c = child.pointerType
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckRefType:
      var c = child.refType
      c.parentId = p.id; p.add c
    of ckTupleType:
      var c = child.tupleType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckArgument:
    var p = parent.argument
    case child.kind
    of ckAliasQualifiedName:
      var c = child.aliasQualifiedName
      c.parentId = p.id; p.add c
    of ckAnonymousMethodExpression:
      var c = child.anonymousMethodExpression
      c.parentId = p.id; p.add c
    of ckAnonymousObjectCreationExpression:
      var c = child.anonymousObjectCreationExpression
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckBaseExpression:
      var c = child.baseExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckCheckedExpression:
      var c = child.checkedExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckDeclarationExpression:
      var c = child.declarationExpression
      c.parentId = p.id; p.add c
    of ckDefaultExpression:
      var c = child.defaultExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckImplicitArrayCreationExpression:
      var c = child.implicitArrayCreationExpression
      c.parentId = p.id; p.add c
    of ckImplicitObjectCreationExpression:
      var c = child.implicitObjectCreationExpression
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckIsPatternExpression:
      var c = child.isPatternExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMakeRefExpression:
      var c = child.makeRefExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckNameColon:
      var c = child.nameColon
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckOmittedArraySizeExpression:
      var c = child.omittedArraySizeExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedLambdaExpression:
      var c = child.parenthesizedLambdaExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckQueryExpression:
      var c = child.queryExpression
      c.parentId = p.id; p.add c
    of ckRangeExpression:
      var c = child.rangeExpression
      c.parentId = p.id; p.add c
    of ckRefValueExpression:
      var c = child.refValueExpression
      c.parentId = p.id; p.add c
    of ckSimpleLambdaExpression:
      var c = child.simpleLambdaExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckTupleExpression:
      var c = child.tupleExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    of ckWithExpression:
      var c = child.withExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckElementBindingExpression:
    var p = parent.elementBindingExpression
    case child.kind
    of ckBracketedArgumentList:
      var c = child.bracketedArgumentList
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckRefType:
    var p = parent.refType
    case child.kind
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckPointerType:
      var c = child.pointerType
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckExplicitInterfaceSpecifier:
    var p = parent.explicitInterfaceSpecifier
    case child.kind
    of ckAliasQualifiedName:
      var c = child.aliasQualifiedName
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckReturnStatement:
    var p = parent.returnStatement
    case child.kind
    of ckAnonymousMethodExpression:
      var c = child.anonymousMethodExpression
      c.parentId = p.id; p.add c
    of ckAnonymousObjectCreationExpression:
      var c = child.anonymousObjectCreationExpression
      c.parentId = p.id; p.add c
    of ckArgumentList:
      var c = child.argumentList
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = p.id; p.add c
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckCheckedExpression:
      var c = child.checkedExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckConditionalExpression:
      var c = child.conditionalExpression
      c.parentId = p.id; p.add c
    of ckDefaultExpression:
      var c = child.defaultExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckImplicitArrayCreationExpression:
      var c = child.implicitArrayCreationExpression
      c.parentId = p.id; p.add c
    of ckInterpolatedStringExpression:
      var c = child.interpolatedStringExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckIsPatternExpression:
      var c = child.isPatternExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedLambdaExpression:
      var c = child.parenthesizedLambdaExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id; p.add c
    of ckQueryExpression:
      var c = child.queryExpression
      c.parentId = p.id; p.add c
    of ckRefExpression:
      var c = child.refExpression
      c.parentId = p.id; p.add c
    of ckSimpleLambdaExpression:
      var c = child.simpleLambdaExpression
      c.parentId = p.id; p.add c
    of ckSwitchExpression:
      var c = child.switchExpression
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckTupleExpression:
      var c = child.tupleExpression
      c.parentId = p.id; p.add c
    of ckTypeOfExpression:
      var c = child.typeOfExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckCheckedExpression:
    var p = parent.checkedExpression
    case child.kind
    of ckAnonymousMethodExpression:
      var c = child.anonymousMethodExpression
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
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
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckThrowExpression:
    var p = parent.throwExpression
    case child.kind
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckConstructorInitializer:
    var p = parent.constructorInitializer
    case child.kind
    of ckArgumentList:
      var c = child.argumentList
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
  of ckImplicitElementAccess:
    var p = parent.implicitElementAccess
    case child.kind
    of ckBracketedArgumentList:
      var c = child.bracketedArgumentList
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckAnonymousObjectCreationExpression:
    var p = parent.anonymousObjectCreationExpression
    case child.kind
    of ckAnonymousObjectMemberDeclarator:
      var c = child.anonymousObjectMemberDeclarator
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckDelegate:
    var p = parent.delegate
    case child.kind
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    of ckParameterList:
      var c = child.parameterList
      c.parentId = p.id; p.add c
    of ckPointerType:
      var c = child.pointerType
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckRefType:
      var c = child.refType
      c.parentId = p.id; p.add c
    of ckTupleType:
      var c = child.tupleType
      c.parentId = p.id; p.add c
    of ckTypeParameterConstraintClause:
      var c = child.typeParameterConstraintClause
      c.parentId = p.id; p.add c
    of ckTypeParameterList:
      var c = child.typeParameterList
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckForEachStatement:
    var p = parent.forEachStatement
    case child.kind
    of ckAnonymousMethodExpression:
      var c = child.anonymousMethodExpression
      c.parentId = p.id; p.add c
    of ckArrayCreationExpression:
      var c = child.arrayCreationExpression
      c.parentId = p.id; p.add c
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckAwaitExpression:
      var c = child.awaitExpression
      c.parentId = p.id; p.add c
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckCastExpression:
      var c = child.castExpression
      c.parentId = p.id; p.add c
    of ckConditionalAccessExpression:
      var c = child.conditionalAccessExpression
      c.parentId = p.id; p.add c
    of ckElementAccessExpression:
      var c = child.elementAccessExpression
      c.parentId = p.id; p.add c
    of ckEmptyStatement:
      var c = child.emptyStatement
      c.parentId = p.id; p.add c
    of ckExpressionStatement:
      var c = child.expressionStatement
      c.parentId = p.id; p.add c
    of ckForEachStatement:
      var c = child.forEachStatement
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckIfStatement:
      var c = child.ifStatement
      c.parentId = p.id; p.add c
    of ckImplicitArrayCreationExpression:
      var c = child.implicitArrayCreationExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    of ckNullableType:
      var c = child.nullableType
      c.parentId = p.id; p.add c
    of ckObjectCreationExpression:
      var c = child.objectCreationExpression
      c.parentId = p.id; p.add c
    of ckParenthesizedExpression:
      var c = child.parenthesizedExpression
      c.parentId = p.id; p.add c
    of ckPostfixUnaryExpression:
      var c = child.postfixUnaryExpression
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckQueryExpression:
      var c = child.queryExpression
      c.parentId = p.id; p.add c
    of ckReturnStatement:
      var c = child.returnStatement
      c.parentId = p.id; p.add c
    of ckSwitchStatement:
      var c = child.switchStatement
      c.parentId = p.id; p.add c
    of ckThisExpression:
      var c = child.thisExpression
      c.parentId = p.id; p.add c
    of ckTupleType:
      var c = child.tupleType
      c.parentId = p.id; p.add c
    of ckUsingStatement:
      var c = child.usingStatement
      c.parentId = p.id; p.add c
    of ckYieldStatement:
      var c = child.yieldStatement
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckRangeExpression:
    var p = parent.rangeExpression
    case child.kind
    of ckCastExpression:
      var c = child.castExpression
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
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckDeclarationPattern:
    var p = parent.declarationPattern
    case child.kind
    of ckArrayType:
      var c = child.arrayType
      c.parentId = p.id; p.add c
    of ckDiscardDesignation:
      var c = child.discardDesignation
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckSingleVariableDesignation:
      var c = child.singleVariableDesignation
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  of ckWhenClause:
    var p = parent.whenClause
    case child.kind
    of ckBinaryExpression:
      var c = child.binaryExpression
      c.parentId = p.id; p.add c
    of ckInvocationExpression:
      var c = child.invocationExpression
      c.parentId = p.id; p.add c
    of ckIsPatternExpression:
      var c = child.isPatternExpression
      c.parentId = p.id; p.add c
    else: assert false, couple & " plz impl for child: " & $child.kind
  else: assert false, couple & " plz impl for parent: " & $parent.kind