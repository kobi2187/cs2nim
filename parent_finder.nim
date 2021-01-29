# parent_finder.nim
import options, sequtils, all_needed_data, block_utils #, strutils
import info_center, state_utils
import types, construct, constructs/[cs_all_constructs, justtypes]
import constructs/cs_root, uuids
import common_utils


proc cfits*(parent, item: Construct; data: AllNeededData): bool = # asks the inner types to implement fits for these type arguments.
  result = case $parent.kind & ", " & $item.kind
  of "ckNamespace, ckClass": true
  of "ckClass, ckField": true
  of "ckParenthesizedExpression, ckSimpleLambdaExpression": true
  of "ckNamespace, ckEnum": true
  of "ckEnum, ckEnumMember": true
  of "ckClass, ckMethod": true
  of "ckMethod, ckParameterList": true
  of "ckMethod, ckPredefinedType": true
  of "ckMethod, ckLocalDeclarationStatement": true
  of "ckMethod, ckReturnStatement": true
  of "ckEnumMember, ckEqualsValueClause": true
  of "ckEnumMember, ckLiteralExpression": true
  of "ckReturnStatement, ckLiteralExpression": true
  of "ckParameterList, ckParameter": true
  of "ckClass, ckBaseList": true
  of "ckClass, ckSimpleBaseType": true
  of "ckConstructor, ckParameterList": true
  of "ckClass, ckConstructor": true
  of "ckClass, ckIndexer": true
  of "ckIndexer, ckPredefinedType": true
  of "ckIndexer, ckExplicitInterfaceSpecifier": true
  of "ckIndexer, ckBracketedParameterList": true
  of "ckIndexer, ckParameter": true
  of "ckIndexer, ckAccessorList": true
  of "ckAccessorList, ckAccessor": true
  of "ckClass, ckProperty": true
  of "ckProperty, ckPredefinedType": true
  of "ckProperty, ckAccessorList": true
  of "ckNamespace, ckUsingDirective": true
  of "ckMethod, ckExpressionStatement": true
  of "ckMethod, ckInvocationExpression": true
  of "ckExpressionStatement, ckInvocationExpression": true
  of "ckExpressionStatement, ckArgumentList": true
  of "ckExpressionStatement, ckArgument": true
  of "ckConstructor, ckExpressionStatement": true
  of "ckConstructor, ckAssignmentExpression": true
  of "ckConstructor, ckConstructorInitializer": true
  of "ckConstructor, ckArgumentList": true # likely for initializer
  of "ckLocalDeclarationStatement, ckVariable": true
  of "ckLocalDeclarationStatement, ckGenericName": true
  of "ckLocalDeclarationStatement, ckTypeArgumentList": true
  of "ckLocalDeclarationStatement, ckVariableDeclarator": true
  of "ckVariableDeclarator, ckEqualsValueClause": true
  of "ckVariableDeclarator, ckObjectCreationExpression": true
  of "ckLocalDeclarationStatement, ckArgumentList": true
  of "ckMethod, ckAssignmentExpression": true
  of "ckAssignmentExpression, ckObjectCreationExpression": true
  of "ckReturnStatement, ckObjectCreationExpression": true
  of "ckReturnStatement, ckArgumentList": true
  of "ckLocalDeclarationStatement, ckLiteralExpression": true
  of "ckAssignmentExpression, ckGenericName": true
  of "ckAssignmentExpression, ckTypeArgumentList": true
  of "ckAssignmentExpression, ckArgumentList": true
  of "ckObjectCreationExpression, ckInitializerExpression": true
  of "ckInitializerExpression, ckLiteralExpression": true
  of "ckLiteralExpression, ckPrefixUnaryExpression": true
  of "ckInitializerExpression, ckPrefixUnaryExpression": true
  of "ckVariableDeclarator, ckBinaryExpression": true
  of "ckVariable, ckGenericName": true
  of "ckObjectCreationExpression, ckGenericName": true
  of "ckGenericName, ckTypeArgumentList": true
  of "ckUsingDirective, ckNameEquals": true
  of "ckNameEquals, ckGenericName": true
  of "ckParameter, ckGenericName": true
  of "ckField, ckVariable": true
  of "ckReturnStatement, ckMemberAccessExpression": true
  of "ckField, ckVariableDeclarator": true
  of "ckMethod, ckVariableDeclarator": true
  of "ckVariableDeclarator, ckMemberAccessExpression": true
  of "ckInvocationExpression, ckMemberAccessExpression": true
  of "ckVariable, ckPredefinedType": true
  of "ckVariable, ckVariableDeclarator": true
  of "ckEqualsValueClause, ckLiteralExpression": true
  of "ckInvocationExpression, ckArgumentList": true
  of "ckConditionalExpression, ckPrefixUnaryExpression": true
  of "ckSimpleLambdaExpression, ckConditionalExpression": true
  of "ckInitializerExpression, ckConditionalExpression": true
  of "ckConditionalExpression, ckThisExpression": true
  of "ckArrayRankSpecifier, ckMemberAccessExpression": true
  of "ckInitializerExpression, ckTypeOfExpression": true
  of "ckEqualsValueClause, ckParenthesizedExpression": true
  of "ckCastExpression, ckElementAccessExpression": true
  of "ckCastExpression, ckObjectCreationExpression": true
  of "ckConstructor, ckReturnStatement": true
  of "ckCastExpression, ckCastExpression": true
  of "ckConditionalExpression, ckObjectCreationExpression": true
  of "ckArgumentList, ckArgument": true
  of "ckPostfixUnaryExpression, ckElementAccessExpression": true
  of "ckIfStatement, ckElementAccessExpression": true
  of "ckElementAccessExpression, ckParenthesizedExpression": true
  of "ckPostfixUnaryExpression, ckInvocationExpression": true
  of "ckParenthesizedLambdaExpression, ckTypeOfExpression": true
  of "ckInitializerExpression, ckSimpleLambdaExpression": true
  of "ckArgument, ckLiteralExpression": true
  of "ckTypeArgumentList, ckPredefinedType": true
  of "ckEqualsValueClause, ckObjectCreationExpression": true
  of "ckObjectCreationExpression, ckArgumentList": true
  of "ckPrefixUnaryExpression, ckLiteralExpression": true
  of "ckParameter, ckPredefinedType": true
  of "ckBracketedParameterList, ckParameter": true
  of "ckEqualsValueClause, ckMemberAccessExpression": true
  of "ckEqualsValueClause, ckBinaryExpression": true
  of "ckBaseList, ckSimpleBaseType": true
  of "ckArgument, ckAssignmentExpression": true
  of "ckArgument, ckBinaryExpression": true
  of "ckArgument, ckInvocationExpression": true
  of "ckArgument, ckMemberAccessExpression": true
  of "ckArgument, ckObjectCreationExpression": true
  of "ckArgument, ckPrefixUnaryExpression": true
  of "ckClass, ckClass": true
  of "ckClass, ckEnum": true
  of "ckConstructor, ckLocalDeclarationStatement": true
  of "ckConstructorInitializer, ckArgumentList": true
  of "ckEqualsValueClause, ckInvocationExpression": true
  of "ckExpressionStatement, ckAssignmentExpression": true
  of "ckInitializerExpression, ckAssignmentExpression": true
  of "ckInitializerExpression, ckInitializerExpression": true
  of "ckInitializerExpression, ckMemberAccessExpression": true
  of "ckInitializerExpression, ckObjectCreationExpression": true
  of "ckMemberAccessExpression, ckGenericName": true
  of "ckMemberAccessExpression, ckInvocationExpression": true
  of "ckMemberAccessExpression, ckMemberAccessExpression": true
  of "ckMemberAccessExpression, ckObjectCreationExpression": true
  of "ckMethod, ckGenericName": true
  of "ckObjectCreationExpression, ckPredefinedType": true
  of "ckParameter, ckEqualsValueClause": true
  of "ckReturnStatement, ckInvocationExpression": true
  of "ckTypeArgumentList, ckGenericName": true
  of "ckUsingDirective, ckGenericName": true
  of "ckBinaryExpression, ckBinaryExpression": true
  of "ckBinaryExpression, ckInvocationExpression": true
  of "ckReturnStatement, ckBinaryExpression": true
  of "ckSimpleBaseType, ckGenericName": true
  of "ckBinaryExpression, ckMemberAccessExpression": true
  of "ckBinaryExpression, ckLiteralExpression": true
  of "ckAssignmentExpression, ckMemberAccessExpression": true
  of "ckClass, ckTypeParameterList": true
  of "ckTypeParameterList, ckTypeParameter": true
  of "ckClass, ckTypeParameterConstraintClause": true
  of "ckTypeParameterConstraintClause, ckTypeConstraint": true
  of "ckTypeConstraint, ckGenericName": true
  of "ckInvocationExpression, ckGenericName": true
  of "ckMethod, ckIfStatement": true
  of "ckIfStatement, ckBinaryExpression": true
  of "ckBinaryExpression, ckTypeOfExpression": true
  of "ckAssignmentExpression, ckCastExpression": true
  of "ckCastExpression, ckThisExpression": true
  of "ckParameter, ckArrayType": true
  of "ckArrayType, ckPredefinedType": true
  of "ckArrayType, ckArrayRankSpecifier": true
  of "ckArrayRankSpecifier, ckOmittedArraySizeExpression": true
  of "ckMethod, ckArrowExpressionClause": true
  of "ckArrowExpressionClause, ckInvocationExpression": true
  of "ckArgument, ckSimpleLambdaExpression": true
  of "ckSimpleLambdaExpression, ckParameter": true
  of "ckIfStatement, ckInvocationExpression": true
  of "ckMethod, ckForStatement": true
  of "ckForStatement, ckVariable": true
  of "ckVariable, ckArrayType": true
  of "ckEqualsValueClause, ckInitializerExpression": true
  of "ckForStatement, ckBinaryExpression": true
  of "ckMethod, ckDoStatement": true
  of "ckForStatement, ckPostfixUnaryExpression": true
  of "ckMemberAccessExpression, ckElementAccessExpression": true
  of "ckElementAccessExpression, ckBracketedArgumentList": true
  of "ckBracketedArgumentList, ckArgument": true
  of "ckIfStatement, ckBreakStatement": true
  of "ckNameEquals, ckPrefixUnaryExpression": true
  of "ckMemberAccessExpression, ckThisExpression": true
  of "ckAssignmentExpression, ckLiteralExpression": true
  of "ckMethod, ckWhileStatement": true
  of "ckWhileStatement, ckBinaryExpression": true
  of "ckExpressionStatement, ckPostfixUnaryExpression": true
  of "ckIfStatement, ckPrefixUnaryExpression": true
  of "ckPrefixUnaryExpression, ckInvocationExpression": true
  of "ckBinaryExpression, ckParenthesizedExpression": true
  of "ckParenthesizedExpression, ckBinaryExpression": true
  of "ckArgument, ckInterpolatedStringExpression": true
  of "ckInterpolatedStringExpression, ckInterpolatedStringText": true
  of "ckMethod, ckArrayType": true
  of "ckIfStatement, ckThrowStatement": true
  of "ckThrowStatement, ckObjectCreationExpression": true
  of "ckArgument, ckConditionalExpression": true
  of "ckConditionalExpression, ckParenthesizedExpression": true
  of "ckConditionalExpression, ckLiteralExpression": true
  of "ckConditionalExpression, ckMemberAccessExpression": true
  of "ckMemberAccessExpression, ckPredefinedType": true
  of "ckEqualsValueClause, ckArrayCreationExpression": true
  of "ckArrayCreationExpression, ckArrayType": true
  of "ckIfStatement, ckExpressionStatement": true
  of "ckAssignmentExpression, ckArrayCreationExpression": true
  of "ckArrayCreationExpression, ckInitializerExpression": true
  of "ckInitializerExpression, ckArrayCreationExpression": true
  of "ckMethod, ckUsingStatement": true
  of "ckUsingStatement, ckVariable": true
  of "ckUsingStatement, ckUsingStatement": true
  of "ckUsingStatement, ckExpressionStatement": true
  of "ckAssignmentExpression, ckInvocationExpression": true
  of "ckElementAccessExpression, ckElementAccessExpression": true
  of "ckArgument, ckParenthesizedLambdaExpression": true
  of "ckParenthesizedLambdaExpression, ckParameterList": true
  of "ckMethod, ckTryStatement": true
  of "ckTryStatement, ckCatchClause": true
  of "ckCatchClause, ckCatch": true
  of "ckAssignmentExpression, ckAssignmentExpression": true
  of "ckAccessor, ckReturnStatement": true
  of "ckReturnStatement, ckElementAccessExpression": true
  of "ckProperty, ckExplicitInterfaceSpecifier": true
  of "ckArrowExpressionClause, ckBinaryExpression": true
  of "ckPrefixUnaryExpression, ckObjectCreationExpression": true
  of "ckMethod, ckThrowStatement": true
  of "ckTypeArgumentList, ckArrayType": true
  of "ckForStatement, ckPrefixUnaryExpression": true
  of "ckParenthesizedLambdaExpression, ckMemberAccessExpression": true
  of "ckSimpleLambdaExpression, ckBinaryExpression": true
  of "ckProperty, ckGenericName": true
  of "ckMemberAccessExpression, ckTypeOfExpression": true
  of "ckSimpleLambdaExpression, ckInvocationExpression": true
  of "ckAssignmentExpression, ckInitializerExpression": true
  of "ckSimpleLambdaExpression, ckAssignmentExpression": true
  of "ckArgument, ckTypeOfExpression": true
  of "ckWhileStatement, ckExpressionStatement": true
  of "ckAccessor, ckArrowExpressionClause": true
  of "ckParenthesizedLambdaExpression, ckCastExpression": true
  of "ckExplicitInterfaceSpecifier, ckGenericName": true
  of "ckReturnStatement, ckPostfixUnaryExpression": true
  of "ckArgument, ckPostfixUnaryExpression": true
  of "ckNamespace, ckExternAliasDirective": true
  of "ckParenthesizedExpression, ckObjectCreationExpression": true
  of "ckSimpleLambdaExpression, ckSimpleLambdaExpression": true
  of "ckParenthesizedExpression, ckArrayCreationExpression": true
  of "ckSimpleBaseType, ckPredefinedType": true
  of "ckSimpleLambdaExpression, ckParenthesizedExpression": true
  of "ckEqualsValueClause, ckAssignmentExpression": true
  of "ckIfStatement, ckParenthesizedExpression": true
  of "ckElementAccessExpression, ckObjectCreationExpression": true
  of "ckInterpolation, ckPrefixUnaryExpression": true
  of "ckBinaryExpression, ckThisExpression": true
  of "ckInvocationExpression, ckLiteralExpression": true
  of "ckSimpleLambdaExpression, ckLiteralExpression": true
  of "ckForStatement, ckIfStatement": true
  of "ckConditionalExpression, ckTypeOfExpression": true
  of "ckAssignmentExpression, ckParenthesizedExpression": true
  of "ckInterpolation, ckLiteralExpression": true
  of "ckIfStatement, ckConditionalExpression": true
  of "ckInterpolation, ckBinaryExpression": true
  of "ckParenthesizedExpression, ckLiteralExpression": true
  of "ckBinaryExpression, ckPostfixUnaryExpression": true
  of "ckTypeOfExpression, ckArrayType": true
  of "ckConditionalExpression, ckInterpolatedStringExpression": true
  of "ckMethod, ckCastExpression": true
  of "ckCastExpression, ckPrefixUnaryExpression": true
  of "ckParenthesizedLambdaExpression, ckParenthesizedLambdaExpression": true
  of "ckPredefinedType, ckGenericName": true
  of "ckMemberAccessExpression, ckArrayCreationExpression": true
  of "ckUsingStatement, ckIfStatement": true
  of "ckElementAccessExpression, ckThisExpression": true
  of "ckParenthesizedLambdaExpression, ckLiteralExpression": true
  of "ckArrowExpressionClause, ckParenthesizedLambdaExpression": true
  of "ckIfStatement, ckIfStatement": true
  of "ckConstructor, ckArrowExpressionClause": true
  of "ckInitializerExpression, ckBinaryExpression": true
  of "ckBinaryExpression, ckArrayType": true
  of "ckThrowStatement, ckLiteralExpression": true
  of "ckUsingStatement, ckAssignmentExpression": true
  of "ckUsingStatement, ckCastExpression": true
  of "ckPrefixUnaryExpression, ckCastExpression": true
  of "ckIfStatement, ckLiteralExpression": true
  of "ckSimpleLambdaExpression, ckPrefixUnaryExpression": true
  of "ckInvocationExpression, ckInvocationExpression": true
  of "ckArgument, ckThisExpression": true
  of "ckEqualsValueClause, ckConditionalExpression": true
  of "ckMemberAccessExpression, ckParenthesizedExpression": true
  of "ckIfStatement, ckMemberAccessExpression": true
  of "ckProperty, ckEqualsValueClause": true
  of "ckProperty, ckLocalDeclarationStatement": true
  of "ckUsingStatement, ckMemberAccessExpression": true
  of "ckInterpolatedStringExpression, ckInterpolation": true
  of "ckInitializerExpression, ckParenthesizedLambdaExpression": true
  of "ckParenthesizedLambdaExpression, ckAssignmentExpression": true
  of "ckEqualsValueClause, ckParenthesizedLambdaExpression": true
  of "ckArgument, ckCastExpression": true
  of "ckArrayRankSpecifier, ckLiteralExpression": true
  of "ckArrowExpressionClause, ckObjectCreationExpression": true
  of "ckAssignmentExpression, ckThisExpression": true
  of "ckBinaryExpression, ckElementAccessExpression": true
  of "ckMethod, ckTypeParameterList": true
  of "ckReturnStatement, ckCastExpression": true
  of "ckAssignmentExpression, ckBinaryExpression": true
  of "ckReturnStatement, ckConditionalExpression": true
  of "ckReturnStatement, ckAssignmentExpression": true
  of "ckParenthesizedLambdaExpression, ckPostfixUnaryExpression": true
  of "ckEqualsValueClause, ckCastExpression": true
  of "ckParenthesizedLambdaExpression, ckObjectCreationExpression": true
  of "ckForStatement, ckForStatement": true
  of "ckAssignmentExpression, ckSimpleLambdaExpression": true
  of "ckBinaryExpression, ckPrefixUnaryExpression": true
  of "ckIfStatement, ckReturnStatement": true
  of "ckParenthesizedLambdaExpression, ckConditionalExpression": true
  of "ckProperty, ckArrayType": true
  of "ckAssignmentExpression, ckParenthesizedLambdaExpression": true
  of "ckCastExpression, ckParenthesizedExpression": true
  of "ckProperty, ckArrowExpressionClause": true
  of "ckBinaryExpression, ckCastExpression": true
  of "ckSimpleLambdaExpression, ckMemberAccessExpression": true
  of "ckConditionalExpression, ckBinaryExpression": true
  of "ckArrowExpressionClause, ckArrayCreationExpression": true
  of "ckCastExpression, ckPredefinedType": true
  of "ckMemberAccessExpression, ckLiteralExpression": true
  of "ckUsingStatement, ckInvocationExpression": true
  of "ckArrowExpressionClause, ckCastExpression": true
  of "ckPrefixUnaryExpression, ckParenthesizedExpression": true
  of "ckExpressionStatement, ckLiteralExpression": true
  of "ckReturnStatement, ckInterpolatedStringExpression": true
  of "ckEnum, ckBaseList": true
  of "ckReturnStatement, ckArrayCreationExpression": true
  of "ckCastExpression, ckInvocationExpression": true
  of "ckMemberAccessExpression, ckInterpolatedStringExpression": true
  of "ckParenthesizedLambdaExpression, ckInvocationExpression": true
  of "ckPostfixUnaryExpression, ckMemberAccessExpression": true
  of "ckMethod, ckExplicitInterfaceSpecifier": true
  of "ckParenthesizedLambdaExpression, ckBinaryExpression": true
  of "ckArgument, ckElementAccessExpression": true
  of "ckArrayType, ckGenericName": true
  of "ckEqualsValueClause, ckPrefixUnaryExpression": true
  of "ckArrowExpressionClause, ckAssignmentExpression": true
  of "ckPrefixUnaryExpression, ckMemberAccessExpression": true
  of "ckArgument, ckArrayCreationExpression": true
  of "ckAssignmentExpression, ckElementAccessExpression": true
  of "ckForStatement, ckExpressionStatement": true
  of "ckArrowExpressionClause, ckMemberAccessExpression": true
  of "ckBinaryExpression, ckGenericName": true
  of "ckWhileStatement, ckInvocationExpression": true
  of "ckEqualsValueClause, ckElementAccessExpression": true
  of "ckAssignmentExpression, ckInterpolatedStringExpression": true
  of "ckParenthesizedExpression, ckPrefixUnaryExpression": true
  of "ckArrowExpressionClause, ckLiteralExpression": true
  of "ckCastExpression, ckMemberAccessExpression": true
  of "ckReturnStatement, ckTypeOfExpression": true
  of "ckInitializerExpression, ckInvocationExpression": true
  of "ckArrowExpressionClause, ckConditionalExpression": true
  of "ckNamespace, ckMethod": true
  of "ckAssignmentExpression, ckConditionalExpression": true
  of "ckEqualsValueClause, ckTypeOfExpression": true
  of "ckForStatement, ckAssignmentExpression": true
  of "ckArrayRankSpecifier, ckBinaryExpression": true
  of "ckAssignmentExpression, ckPrefixUnaryExpression": true
  of "ckSimpleLambdaExpression, ckObjectCreationExpression": true
  of "ckLiteralExpression, ckBinaryExpression": true
  of "ckReturnStatement, ckParenthesizedExpression": true
  of "ckBinaryExpression, ckPredefinedType": true
  of "ckExpressionStatement, ckObjectCreationExpression": true
  of "ckParenthesizedExpression, ckConditionalExpression": true
  of "ckArrowExpressionClause, ckInterpolatedStringExpression": true
  of "ckParenthesizedLambdaExpression, ckPrefixUnaryExpression": true
  of "ckParenthesizedExpression, ckParenthesizedLambdaExpression": true
  of "ckReturnStatement, ckSimpleLambdaExpression": true
  of "ckWhileStatement, ckLiteralExpression": true
  of "ckArrowExpressionClause, ckTypeOfExpression": true
  of "ckReturnStatement, ckPrefixUnaryExpression": true
  of "ckReturnStatement, ckThisExpression": true
  of "ckParenthesizedExpression, ckInvocationExpression": true
  of "ckReturnStatement, ckParenthesizedLambdaExpression": true
  of "ckMethod, ckTypeParameterConstraintClause": true
  of "ckInterpolation, ckMemberAccessExpression": true
  of "ckTypeOfExpression, ckGenericName": true
  of "ckElementAccessExpression, ckInvocationExpression": true
  of "ckCastExpression, ckArrayType": true
  of "ckCastExpression, ckGenericName": true
  of "ckCastExpression, ckLiteralExpression": true
  of "ckConditionalExpression, ckInvocationExpression": true
  of "ckInterpolation, ckInvocationExpression": true
  of "ckBinaryExpression, ckObjectCreationExpression": true
  of "ckElementAccessExpression, ckMemberAccessExpression": true
  of "ckWhileStatement, ckPrefixUnaryExpression": true
  of "ckExpressionStatement, ckPrefixUnaryExpression": true
  of "ckConditionalExpression, ckCastExpression": true
  of "ckEqualsValueClause, ckInterpolatedStringExpression": true
  of "ckParenthesizedExpression, ckAssignmentExpression": true
  of "ckEqualsValueClause, ckSimpleLambdaExpression": true
  of "ckArgument, ckParenthesizedExpression": true
  of "ckParenthesizedExpression, ckMemberAccessExpression": true
  of "ckInvocationExpression, ckElementAccessExpression": true
  of "ckParenthesizedExpression, ckCastExpression": true
  of "ckTypeOfExpression, ckPredefinedType": true
  of "ckInitializerExpression, ckCastExpression": true
  of "ckParenthesizedExpression, ckPostfixUnaryExpression": true
  of "ckElementAccessExpression, ckLiteralExpression": true
  of "ckIfStatement, ckCastExpression": true
  of "ckThrowStatement, ckCastExpression": true
  of "ckConditionalExpression, ckAssignmentExpression": true
  of "ckArrowExpressionClause, ckParenthesizedExpression": true
  of "ckMemberAccessExpression, ckPostfixUnaryExpression": true
  of "ckConditionalExpression, ckParenthesizedLambdaExpression": true
  of "ckConditionalExpression, ckElementAccessExpression": true
  of "ckThrowStatement, ckParenthesizedExpression": true
  of "ckIfStatement, ckTryStatement": true
  of "ckArrowExpressionClause, ckSimpleLambdaExpression": true
  of "ckBinaryExpression, ckArrayCreationExpression": true
  of "ckNamespace, ckConstructor": true
  of "ckArrowExpressionClause, ckElementAccessExpression": true
  of "ckExpressionStatement, ckCastExpression": true
  of "ckNamespace, ckProperty": true
  of "ckSimpleLambdaExpression, ckElementAccessExpression": true
  of "ckParenthesizedExpression, ckElementAccessExpression": true
  of "ckUsingStatement, ckObjectCreationExpression": true
  of "ckForStatement, ckLocalDeclarationStatement": true
  of "ckIndexer, ckArrowExpressionClause": true
  of "ckPrefixUnaryExpression, ckPrefixUnaryExpression": true
  of "ckUsingStatement, ckReturnStatement": true
  of "ckParenthesizedExpression, ckTypeOfExpression": true
  of "ckExpressionStatement, ckElementAccessExpression": true
  of "ckInterpolation, ckParenthesizedExpression": true
  of "ckPrefixUnaryExpression, ckElementAccessExpression": true
  of "ckInitializerExpression, ckElementAccessExpression": true
  of "ckConditionalExpression, ckArrayCreationExpression": true
  of "ckUsingStatement, ckWhileStatement": true
  of "ckInterpolation, ckAssignmentExpression": true
  of "ckCastExpression, ckPostfixUnaryExpression": true
  of "ckUsingStatement, ckConditionalExpression": true
  of "ckDoStatement, ckPrefixUnaryExpression": true
  of "ckParenthesizedLambdaExpression, ckInterpolatedStringExpression": true
  of "ckIfStatement, ckLocalDeclarationStatement": true
  of "ckExpressionStatement, ckMemberAccessExpression": true
  of "ckForStatement, ckMemberAccessExpression": true
  of "ckInterpolation, ckElementAccessExpression": true
  of "ckSimpleLambdaExpression, ckArrayCreationExpression": true
  of "ckUsingStatement, ckBinaryExpression": true
  of "ckCatch, ckGenericName": true
  of "ckPostfixUnaryExpression, ckParenthesizedExpression": true
  of "ckArrayRankSpecifier, ckConditionalExpression": true
  of "ckWhileStatement, ckIfStatement": true
  of "ckParenthesizedLambdaExpression, ckElementAccessExpression": true
  of "ckArrayRankSpecifier, ckInvocationExpression": true
  of "ckParenthesizedExpression, ckInterpolatedStringExpression": true
  of "ckAssignmentExpression, ckPostfixUnaryExpression": true
  of "ckCatch, ckPredefinedType": true
  of "ckInitializerExpression, ckParenthesizedExpression": true
  of "ckSimpleLambdaExpression, ckCastExpression": true
  of "ckParenthesizedExpression, ckParenthesizedExpression": true
  of "ckThrowStatement, ckInvocationExpression": true
  of "ckDoStatement, ckInvocationExpression": true
  of "ckSimpleLambdaExpression, ckInterpolatedStringExpression": true
  of "ckIndexer, ckGenericName": true
  of "ckConditionalExpression, ckConditionalExpression": true
  of "ckArgument, ckPredefinedType": true
  of "ckArgument, ckGenericName": true
  of "ckInitializerExpression, ckInterpolatedStringExpression": true
  of "ckExpressionStatement, ckThisExpression": true
  of "ckForStatement, ckParenthesizedExpression": true
  of "ckArrowExpressionClause, ckPrefixUnaryExpression": true
  of "ckAssignmentExpression, ckTypeOfExpression": true
  of "ckEqualsValueClause, ckPostfixUnaryExpression": true
  of "ckDoStatement, ckBinaryExpression": true
  of "ckIfStatement, ckAssignmentExpression": true
  of "ckInterpolation, ckPostfixUnaryExpression": true
  of "ckWhileStatement, ckForStatement": true
  of "ckForStatement, ckLiteralExpression": true
  of "ckArrayRankSpecifier, ckPrefixUnaryExpression": true
  of "ckVariableDeclarator, ckBracketedArgumentList": true
  of "ckInitializerExpression, ckPostfixUnaryExpression": true
  of "ckWhileStatement, ckElementAccessExpression": true
  of "ckArrayRankSpecifier, ckParenthesizedExpression": true
  of "ckWhileStatement, ckConditionalExpression": true
  of "ckSimpleLambdaExpression, ckPostfixUnaryExpression": true
  of "ckInvocationExpression, ckPredefinedType": true
  of "ckForStatement, ckInvocationExpression": true
  of "ckParenthesizedLambdaExpression, ckArrayCreationExpression": true
  of "ckWhileStatement, ckMemberAccessExpression": true
  of "ckInterpolation, ckTypeOfExpression": true
  of "ckInterpolation, ckCastExpression": true
  of "ckEqualsValueClause, ckThisExpression": true
  of "ckNamespace, ckField": true
  of "ckElementAccessExpression, ckPredefinedType": true
  of "ckArrowExpressionClause, ckPostfixUnaryExpression": true
  of "ckIfStatement, ckUsingStatement": true
  of "ckInterpolation, ckObjectCreationExpression": true
  of "ckInvocationExpression, ckParenthesizedLambdaExpression": true
  of "ckBinaryExpression, ckInterpolatedStringExpression": true
  of "ckPostfixUnaryExpression, ckLiteralExpression": true
  of "ckThrowStatement, ckMemberAccessExpression": true
  of "ckCastExpression, ckArrayCreationExpression": true
  of "ckDoStatement, ckLiteralExpression": true
  of "ckCatch, ckArrayType": true
  of "ckArrayRankSpecifier, ckCastExpression": true
  of "ckClass, ckGenericName": true
  of "ckIfStatement, ckForStatement": true
  of "ckInitializerExpression, ckThisExpression": true
  of "ckInvocationExpression, ckParenthesizedExpression": true
  of "ckExpressionStatement, ckBinaryExpression": true
  of "ckArrowExpressionClause, ckThisExpression": true
  of "ckSimpleBaseType, ckArrayType": true
  else: raise newException(Exception, "cfits is missing:  of \"" &
      $parent.kind & ", " & $item.kind & "\": true")
import state, sugar

proc handleLiteralExpression(data: AllNeededData): Option[UUID] =
  echo "obj is LiteralExpression"
  let prevName = data.previousConstruct.get.name
  case prevName
  of "EqualsValueClause":
    # we'll need to get prevprev construct and assign the value to it.
    let prevprevName = data.previousPreviousConstruct.get.name
    case prevprevName
      of "EnumMemberDeclaration":
        result = data.lastEnumMember.id
      of "VariableDeclarator":
        result = data.lastBodyExprId
      else: assert false, prevprevName

  of ["IdentifierName", "Argument"]: discard # TODO?
  of "ReturnStatement":
    assert data.classLastAdded in [ClassParts.Methods, ClassParts.Properties,
        ClassParts.Ctors]
    result = data.lastBodyExprId
  of "InitializerExpression":
    let ini = data.lastBlockType("InitializerExpression")
    assert ini.isSome
    result = ini

  of ["PrefixUnaryExpression", "LiteralExpression"]:
    let last = state.getLastBlock((c) => c.name notin ["PrefixUnaryExpression",
        "LiteralExpression"])
    assert last.isSome
    echo "LAST:", last
    result = last.get.id.some

  else: assert false, prevName


# get parent checks that the types fit each other, and decides whether parent is a block type or one of its last added items, that expects to store that object. if cannot decide, we'll need to add more information from the C# side.
# figures out path from blocks. blocks now contain id as well.
# the bulk of the work shifts to here.
# this happens before we add to the parent.

import state_utils, state
import tables
proc parentHint(parentRawKind: int): Option[string] =
  let key = parentRawKind
  if parentTable.hasKey(key):
    result = some(parentTable[key])
    echo "found: " & result.get
  else:
    result = none(string)

proc parentHint(c: Construct): Option[string] =
  result = parentHint(c.parentRawKind)

proc determineParentId(obj: Construct; data: AllNeededData): (bool, Option[UUID]) =
  var discarded = false
  var res: Option[UUID]
  echo "source code was: " & data.sourceCode
  echo "all received constructs: ", currentConstruct
  if data.lastMethod != nil:
    echo data.lastMethod.name
    echo data.lastMethod.body.mapIt(it.ttype)

  if obj.parentId.isSome:
    echo "obj already has parent id, returning that."
    return (discarded, obj.parentId)

  let phint = parentHint(obj)
  if phint.isSome():
    if phint.get notin ["IdentifierName","QualifiedName","BlockStarts"]:
      let lastMatch = getLastBlockType(phint.get)
      if lastMatch.isSome:
        let id = lastMatch.get.id.some
        echo "found parent ID thru Roslyn's parent Kind."
        return (false, id)
      else: assert false, "couldn't find it (`" & phint.get & "`) in last blocks even though we should have"

  echo obj.kind
  echo "No parent set from C# side"
  echo "trying to determine parent based on structure, and previous constructs"
  echo data.sourceCode
  case obj.kind
  # of ckVariableDeclarator: # TODO
  #   echo "obj is a variable declarator"
  #   # hmm, can be in multiple parts (instance var, or local var). we have to know the last added construct.
    # I think the local declaration is a wrapper for this object.
    # i think this object can also be wrapped in an instance var. don't know yet.
  #   assert false
  of ckLocalDeclarationStatement:
    echo "obj is a local declaration"
    # exists in methods, ctors, properties.
    assert data.classLastAdded in [Methods, Properties, Ctors]
    res = data.idLastClassPart
  of ckClass:
    echo "obj is a class, returning the current namespace id"
    res = data.currentNamespace.id
    assert res.isSome and not res.get.isZero
  of ckNamespace:
    echo "obj is a namespace, returning None"
    res = none(UUID) # namespaces don't have a parentID, since we have just one root.
  of ckMethod:
    echo "object is a method"
    echo "last added in namespace: ", data.nsLastAdded
    assert data.nsLastAdded != NamespaceParts.Unset
    assert data.nsLastAdded == NamespaceParts.Classes # methods are in classes.
    assert data.lastClass != nil
    echo "last class has id:", data.lastClass.id
    return (discarded, data.lastClass.id)

  of ckPredefinedType:
    echo "object is a predefined type"

    echo data.previousConstruct.get.name

    case data.previousConstruct.get.name
    of "MethodDeclaration":
      echo data.lastClass.name
      echo data.lastClass.methods.mapIt(it.name)
      assert not data.lastMethod.isNil
      assert data.lastMethod.id.isSome
      res = data.lastMethod.id
    of "PropertyDeclaration":
      res = data.lastProp.id
    of "IndexerDeclaration":
      assert data.lastClass.hasIndexer
      res = data.lastClass.indexer.id
    of ["VariableDeclaration", "Parameter", "IdentifierName",
        "TypeArgumentList"]: discarded = true
    # of "VariableDeclaration":
    #   res = data.previousConstruct.get.id.some
      # assert false, "TODO!"
    else:
      echo "in ckPredefinedType: not all cases were matched"
      if discarded == false:
        assert false
      return (discarded, none(UUID))
  of ckParameter:
    echo "object is Parameter"
    case data.classLastAdded:
    of ClassParts.Methods:
      res = data.lastMethod.parameterList.id
    of ClassParts.Ctors:
      res = data.lastCtor.parameterList.id
    of ClassParts.Indexer:
      assert data.lastClass.hasIndexer
      res = data.lastClass.indexer.id
    else: assert false, "not implemented " & $data.classLastAdded

  of ckUsingDirective:
    echo "object is UsingDirective"
    res = data.currentNamespace.id

  of ckEnum:
    echo "object is EnumDeclaration"
    res = data.currentNamespace.id
  of ckEnumMember:
    echo "object is EnumMemberDeclaration"
    res = data.lastEnum.id
    # data.currentNamespace

  of ckReturnStatement:
    echo "obj is ReturnStatement"
    echo "we should be inside ctor, method, indexer, or property"
    # res = data.idLastClassPart()
    let m = getLastBlockTypes(@["AccessorDeclaration", "MethodDeclaration", "IndexerDeclaration","ConstructorDeclaration"])
    assert m.isSome
    res =m.get.id.some

  of ckArgumentList:
    echo "object is ArgumentList"
    echo "we assume we're in method or ctor, or property, but if there are more options change that."
    assert data.classLastAdded in [ClassParts.Methods, ClassParts.Properties,
        ClassParts.Ctors]
    # assert data.lastMethod.body.len > 0
    # res = lastBodyExprId(data.lastMethod)
    # echo data.classLastAdded
    # echo data.lastCtor.name
    # echo data.lastCtor.body.mapIt(it.ttype)
    echo data.classLastAdded
    if data.classLastAdded == Ctors and data.lastCtor.body.isEmpty and
        data.lastCtor.initializer != nil:
      # then it could belong to initializer -- hmmm... we depend here on order (first ctor, then ctor init). a little fishy.
      res = data.lastCtor.id
    else:
      res = data.lastBodyExprId

  of ckExpressionStatement:
    echo "obj is ExpressionStatement"
    # echo "we assume we're in method or ctor, but if there are more options change that."
    assert data.classLastAdded in [ClassParts.Methods, ClassParts.Ctors],
        $data.classLastAdded
    res = data.idLastClassPart

  of ckAssignmentExpression:
    echo "obj is AssignmentExpression"
    assert data.classLastAdded in [ClassParts.Methods, ClassParts.Ctors],
        $data.classLastAdded
    res = data.idLastClassPart

  of ckIndexer:
    echo "obj is IndexerDeclaration"
    res = data.lastClass.id

  of ckParameterList:
    echo "obj is ParameterList"
    # last method or ctor
    assert data.classLastAdded in [ClassParts.Ctors, ClassParts.Methods]
    res = data.idLastClassPart

  of ckConstructor:
    echo "obj is Constructor"
    res = data.lastClass.id

  of ckProperty:
    echo "obj is property"
    # can be interfaces or classes
    assert data.nsLastAdded in [NamespaceParts.Interfaces,
        NamespaceParts.Classes]
    res = data.idLastNsPart()

  of ckInvocationExpression:
    echo "obj is InvocationExpression" #TODO: can also be in class as initializing instance var.
    # res = data.lastMethod.id
    if data.classLastAdded == Methods:
      if data.lastMethod.body.len == 0:
        res = data.lastMethod.id
      else:
        res = data.lastMethod.lastBodyExprId
    else: res = data.idLastClassPart

  of ckArgument:
    echo "obj is Argument, older code was discarding -- TODO?"
    # here we add to possibly many types. first: expression
    case data.classLastAdded
    of Methods:
      res = data.lastBodyExprId
    else: assert false, $data.classLastAdded
  of ckLiteralExpression:
    res = handleLiteralExpression(data)
    if res.isNone: discarded = true


  of ckExplicitInterfaceSpecifier:
    echo "obj is ExplicitInterfaceSpecifier"
    if data.previousPreviousConstruct.get.name == "IndexerDeclaration":
      if data.lastClass.hasIndexer:
        res = data.lastClass.indexer.id
      else: res = none(UUID)
  of ckEqualsValueClause:
    echo "obj is EqualsValueClause"
    # the parent is the previous construct. TODO: some checks needed?
    assert data.previousConstruct.isSome
    echo data.previousConstruct
    res = some(data.previousConstruct.get.id)
    assert data.previousconstruct.get.name in ["EnumMemberDeclaration",
        "VariableDeclarator"], data.previousconstruct.get.name
    # currentRoot.previousConstructObj()
  of ckBaseList, ckSimpleBaseType: # interfaces, classes or structs can have a baselist to extend
    assert data.nsLastAdded in [Classes, Interfaces] #, Structs ]
    res = data.idLastNsPart
  of ckBracketedParameterList: # for now, I assume only for indexer.
    assert data.classLastAdded == ClassParts.Indexer
    res = data.idLastClassPart

  of ckAccessorList: # for properties and indexer, others? both are in class.
    assert data.classLastAdded in [ClassParts.Properties, ClassParts.Indexer]
    res = data.idLastClassPart
  of ckAccessor: # find its parent:AccessorList
    let lastMatch = getLastBlockType("AccessorList")
    assert lastMatch.isSome
    res = lastMatch.get.id.some
    # assert data.classLastAdded in [ClassParts.Properties, ClassParts.Indexer]
    # case data.classLastAdded
    # of Properties:
    #   res = data.lastProp.acclist.id
    # of Indexer:
    #   assert data.lastClass.hasIndexer
    #   assert data.lastClass.indexer.aclist != nil
    #   res = data.lastClass.indexer.aclist.id
    # else: assert false, " where else? " & $data.classLastAdded
  of ckMemberAccessExpression:
    res = data.lastBlockType(@["VariableDeclarator", "InvocationExpression"])
    # if data.lastLine.isComplete: # variable declarator right hand side is fine,
  of ckConstructorInitializer:
    # parent is ckConstructor.
    assert data.classLastAdded == ClassParts.Ctors
    res = data.lastCtor.id
  of ckVariable:
    # can be in a method, can be in a class (as instance var)
    # if it is a variable declaration, add the actual declaration to this wrapper.
    # echo data.inBlock
    # echo data.prevBlock
    # echo data.currentConstruct
    case data.previousConstruct.get.name
    of "LocalDeclarationStatement":
      # we're in a method, get the last body id.
      assert data.classLastAdded == Methods, $data.classLastAdded
      res = data.lastBodyExprId # "hopefully" this is the local declaration.
    of "FieldDeclaration":
      res = data.lastBlockType("FieldDeclaration")
      assert res.isSome
    else: assert false, "please add more: " & data.previousConstruct.get.name


  of ckGenericName: # NOTE:don't know how it should be structured. probably part of csvariable.
    # just return the last construct.
    let b = state.getLastBlock((c) => c.name notin ["GenericName",
        "IdentifierName", "QualifiedName"])
    echo b.get.name
    res = b.get.id.some
    when false: # previous impl. do we pass unit tests?
      case data.previousConstruct.get.name
      of ["IdentifierName"]: discarded = true
      of ["VariableDeclaration", "ObjectCreationExpression",
          "MethodDeclaration", "Parameter", "SimpleBaseType"]:
        assert data.classLastAdded == Methods, $data.classLastAdded
        res = data.lastBodyExprId
        if res.get != data.previousConstruct.get.id:
          let btype = if not data.lastBodyExpr.get.typ.isEmptyOrWhitespace: data.lastBodyExpr.get.typ else: data.lastBodyExpr.get.ttype
          echo btype, " <=> ", data.previousConstruct.get.name
      else: assert false, data.previousConstruct.get.name


  of ckTypeArgumentList:
    case data.previousConstruct.get.name
    of "GenericName":
      let b = data.lastBlockType("GenericName")
      assert b.isSome
      res = b
      # assert data.classLastAdded == Methods, $data.classLastAdded
      # res = data.lastBodyExprId
    else: assert false, data.previousConstruct.get.name

  of ckVariableDeclarator: # for now assume we're in method, add more later.
    assert data.classLastAdded == Methods, $data.classLastAdded
    # res = data.lastBodyExprId # this will create a few chained adds but we don't care.
    res = data.lastBlockType(@["FieldDeclaration", "LocalDeclarationStatement",
        "MethodDeclaration"])
    # res = data.idLastClassPart
    # res = data.lastMethod.id

  of ckObjectCreationExpression: # store in assignment expression # not variable declarator.
    case data.previousPreviousConstruct.get.name & ", " &
        data.previousConstruct.get.name
    of "VariableDeclarator, EqualsValueClause":
      # based on last 2 constructs: variableDeclarator equalsvalueclause ...
      res = data.previousPreviousConstruct.get.id.some
    of "AssignmentExpression, IdentifierName":
      res = data.previousPreviousConstruct.get.id.some
    of "ParameterList, ReturnStatement":
      res = data.previousConstruct.get.id.some

    else: assert false, data.previousPreviousConstruct.get.name & ", " &
        data.previousConstruct.get.name

  of ckInitializerExpression: # find your parent: the last object creation expression
    # let lastoce = state.getLastBlockType("ObjectCreationExpression")
    res = data.lastBlockType("ObjectCreationExpression")
    assert res.isSome

  of ckPrefixUnaryExpression: # hmm, not the previous but the next one. so just add it.
    let fitting = state.getLastBlock(c=>c.name in [
        "InitializerExpression", "NameEquals" ]) # TODO: add others as needed.
    assert fitting.isSome, $data.simplified
    res = fitting.get.id.some
  of ckBinaryExpression:
    let b = state.getLastBlock(c=>c.name in [
        "VariableDeclarator", "LiteralExpression"]) # TODO: add others as needed.
    assert b.isSome, $data.simplified
    res = b.get.id.some
  of ckField: # classes, or interfaces
    assert data.nsLastAdded in [Classes, Interfaces] # more?
    res = data.idLastNsPart

  of ckNameEquals:
    res = data.lastUsing.id

  of ckExternAliasDirective:
    # ignore, unsupported.
    discarded = true
    echo "got " & $ckExternAliasDirective & " which we don't support (doesn't make sense for nim modules)"

  #things within method bodies or ctor bodies or getter/setter bodies:
  # TODO: split these if I'm wrong.
  of [ckIfStatement, ckElseClause, ckCaseSwitchLabel, ckSwitchSection, ckForStatement, ckDoStatement, ckGotoStatement, ckCastExpression, ckThrowStatement,
  ckPostfixUnaryExpression,ckForEachStatement,ckTryStatement,ckCatchClause,ckCatch,
  ckUsingStatement,ckWhileStatement,ckSwitchStatement,ckContinueStatement,ckFinallyClause,ckDefaultSwitchLabel,ckYieldStatement,ckLockStatement,ckThrowExpression
  ]:
    echo "got " & $obj.kind
    let parents = @["MethodDeclaration"] # add more here.
    echo "and looking for its parent in:", parents
    let lastMatch = getLastBlockTypes(parents)
    assert lastMatch.isSome
    res = lastMatch.get.id.some

  of ckBreakStatement: # if, case, else, while, do, ...others?
    let lastMatch = getLastBlockTypes(@[ "IfStatement"]) #"MethodDeclaration"])
    assert lastMatch.isSome
    res = lastMatch.get.id.some
  of ckThisExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckBracketedArgumentList:
    assert false, $obj.kind & " is still unsupported"
  of ckElementAccessExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckParenthesizedExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckArrayRankSpecifier:
    assert false, $obj.kind & " is still unsupported"
  of ckArrayType:
    assert false, $obj.kind & " is still unsupported"
  of ckOmittedArraySizeExpression:
    assert false, $obj.kind & " is still unsupported"

  of ckTypeOfExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckSimpleLambdaExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckArrayCreationExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckArrowExpressionClause:
    assert false, $obj.kind & " is still unsupported"
  of ckAliasQualifiedName:
    assert false, $obj.kind & " is still unsupported"
  of ckTypeParameter:
    assert false, $obj.kind & " is still unsupported"
  of ckAwaitExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckConditionalExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckTypeParameterList:
    assert false, $obj.kind & " is still unsupported"
  of ckInterpolatedStringText:
    assert false, $obj.kind & " is still unsupported"
  of ckParenthesizedLambdaExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckNullableType:
    assert false, $obj.kind & " is still unsupported"
  of ckBaseExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckInterpolation:
    assert false, $obj.kind & " is still unsupported"
  of ckNameColon:
    assert false, $obj.kind & " is still unsupported"
  of ckTypeParameterConstraintClause:
    assert false, $obj.kind & " is still unsupported"
  of ckTypeConstraint:
    assert false, $obj.kind & " is still unsupported"
  of ckSingleVariableDesignation:
    assert false, $obj.kind & " is still unsupported"
  of ckInterpolatedStringExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckImplicitArrayCreationExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckDeclarationExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckConditionalAccessExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckMemberBindingExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckDefaultExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckPointerType:
    assert false, $obj.kind & " is still unsupported"
  of ckInterface:
    assert false, $obj.kind & " is still unsupported"
  of ckAnonymousObjectMemberDeclarator:
    assert false, $obj.kind & " is still unsupported"
  of ckCheckedExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckStruct:
    assert false, $obj.kind & " is still unsupported"
  of ckIsPatternExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckDeclarationPattern:
    assert false, $obj.kind & " is still unsupported"
  of ckConstantPattern:
    assert false, $obj.kind & " is still unsupported"
  of ckRefType:
    assert false, $obj.kind & " is still unsupported"
  of ckRefExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckClassOrStructConstraint:
    assert false, $obj.kind & " is still unsupported"
  of ckOmittedTypeArgument:
    assert false, $obj.kind & " is still unsupported"
  of ckTupleElement:
    assert false, $obj.kind & " is still unsupported"
  of ckOperator:
    assert false, $obj.kind & " is still unsupported"
  of ckEventField:
    assert false, $obj.kind & " is still unsupported"
  of ckDelegate:
    assert false, $obj.kind & " is still unsupported"
  of ckImplicitElementAccess:
    assert false, $obj.kind & " is still unsupported"
  of ckAnonymousMethodExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckTupleExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckAnonymousObjectCreationExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckEvent:
    assert false, $obj.kind & " is still unsupported"

  of ckGlobalStatement:
    assert false, $obj.kind & " is still unsupported"
  of ckIncompleteMember:
    assert false, $obj.kind & " is still unsupported"
  of ckLocalFunctionStatement:
    assert false, $obj.kind & " is still unsupported"
  of ckConversionOperator:
    assert false, $obj.kind & " is still unsupported"
  of ckTupleType:
    assert false, $obj.kind & " is still unsupported"
  of ckFixedStatement:
    assert false, $obj.kind & " is still unsupported"
  of ckEmptyStatement:
    assert false, $obj.kind & " is still unsupported"
  of ckSizeOfExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckQueryBody:
    assert false, $obj.kind & " is still unsupported"
  of ckCheckedStatement:
    assert false, $obj.kind & " is still unsupported"
  of ckQueryExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckCasePatternSwitchLabel:
    assert false, $obj.kind & " is still unsupported"
  of ckLabeledStatement:
    assert false, $obj.kind & " is still unsupported"
  of ckConstructorConstraint:
    assert false, $obj.kind & " is still unsupported"
  of ckUnsafeStatement:
    assert false, $obj.kind & " is still unsupported"
  of ckParenthesizedVariableDesignation:
    assert false, $obj.kind & " is still unsupported"
  of ckInterpolationFormatClause:
    assert false, $obj.kind & " is still unsupported"
  of ckDestructor:
    assert false, $obj.kind & " is still unsupported"
  of ckDiscardDesignation:
    assert false, $obj.kind & " is still unsupported"
  of ckStackAllocArrayCreationExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckWhenClause:
    assert false, $obj.kind & " is still unsupported"
  of ckForEachVariableStatement:
    assert false, $obj.kind & " is still unsupported"
  of ckLetClause:
    assert false, $obj.kind & " is still unsupported"
  of ckElementBindingExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckCatchFilterClause:
    assert false, $obj.kind & " is still unsupported"
  of ckOrdering:
    assert false, $obj.kind & " is still unsupported"
  of ckInterpolationAlignmentClause:
    assert false, $obj.kind & " is still unsupported"
  of ckQueryContinuation:
    assert false, $obj.kind & " is still unsupported"

  of ckMakeRefExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckRefValueExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckRefTypeExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckBlock:
    assert false, $obj.kind & " is still unsupported"
  of ckBinaryPattern:
    assert false, $obj.kind & " is still unsupported"
  of ckDiscardPattern:
    assert false, $obj.kind & " is still unsupported"
  of ckFunctionPointerType:
    assert false, $obj.kind & " is still unsupported"
  of ckImplicitObjectCreationExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckParenthesizedPattern:
    assert false, $obj.kind & " is still unsupported"
  of ckPositionalPatternClause:
    assert false, $obj.kind & " is still unsupported"
  of ckPrimaryConstructorBaseType:
    assert false, $obj.kind & " is still unsupported"
  of ckPropertyPatternClause:
    assert false, $obj.kind & " is still unsupported"
  of ckRangeExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckRecord:
    assert false, $obj.kind & " is still unsupported"
  of ckRecursivePattern:
    assert false, $obj.kind & " is still unsupported"
  of ckRelationalPattern:
    assert false, $obj.kind & " is still unsupported"
  of ckSubpattern:
    assert false, $obj.kind & " is still unsupported"
  of ckSwitchExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckSwitchExpressionArm:
    assert false, $obj.kind & " is still unsupported"
  of ckTypePattern:
    assert false, $obj.kind & " is still unsupported"
  of ckUnaryPattern:
    assert false, $obj.kind & " is still unsupported"
  of ckVarPattern:
    assert false, $obj.kind & " is still unsupported"
  of ckWithExpression:
    assert false, $obj.kind & " is still unsupported"
  of ckImplicitStackAllocArrayCreationExpression:
    assert false, $obj.kind & " is still unsupported"
    # raise notimplementedException
  result = (discarded, res)
  if res.isNone: assert discarded == true
  assert (not discarded and res.isSome) or (discarded and res.isNone), "dis: " &
      $discarded & ", res: " & $res

proc getParent*(root: var CsRoot; newobj: Construct; allData: AllNeededData): (
    bool, Option[Construct]) =
  var res: Option[Construct]
  echo "in getParent"
  echo "newobj: ", newobj.kind
  let (dis, pid) = determineParentId(newobj, allData)
  if pid.isNone: assert dis == true

  echo "discarded: ", dis, " object kind: ", newobj.kind, " parentID: ", pid
  if pid.isSome and not dis and newobj.kind !=
      ckNamespace: # because namespace has no parent. root is explicit.
    assert pid.isSome
    assert not pid.get.isZero
    echo "parent id found: ", $pid
    res = root.infoCenter.fetch(pid.get)
    if res.isNone:
      echo "couldn't find registered object for this id" ### NOTE: can happen for IdentifierName since we don't register it. it means the parent was wrongly identified as IdentifierName.
      # assert false
  result = (dis, res)
  assert (not dis and res.isSome) or (dis and res.isNone), "dis: " & $dis &
      ", res: " & (if res.isSome: $res.get.kind else: "none")
