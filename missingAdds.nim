method add*(parent: var CsExpressionStatement; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsExpressionStatement; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsExpressionStatement, CsBinaryExpression)

method add*(parent: var CsAssignmentExpression; item: CsTypeOfExpression) = # TOE
  echo "in method add*(parent: var CsAssignmentExpression; item: CsTypeOfExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsTypeOfExpression)

method add*(parent: var CsInitializerExpression; item: CsInterpolatedStringExpression) = # ISE
  echo "in method add*(parent: var CsInitializerExpression; item: CsInterpolatedStringExpression)"
  todoimpl # TODO(add: CsInitializerExpression, CsInterpolatedStringExpression)

method add*(parent: var CsCastExpression; item: CsArrayCreationExpression) = # ACE
  echo "in method add*(parent: var CsCastExpression; item: CsArrayCreationExpression)"
  todoimpl # TODO(add: CsCastExpression, CsArrayCreationExpression)

method add*(parent: var CsArrowExpressionClause; item: CsSimpleLambdaExpression) = # SLE
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsSimpleLambdaExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsSimpleLambdaExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsCastExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsCastExpression)

method add*(parent: var CsThrowStatement; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsThrowStatement; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsThrowStatement, CsInvocationExpression)

method add*(parent: var CsConditionalExpression; item: CsAssignmentExpression) = # AE
  echo "in method add*(parent: var CsConditionalExpression; item: CsAssignmentExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsAssignmentExpression)

method add*(parent: var CsUsingStatement; item: CsObjectCreationExpression) = # OCE
  echo "in method add*(parent: var CsUsingStatement; item: CsObjectCreationExpression)"
  todoimpl # TODO(add: CsUsingStatement, CsObjectCreationExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsElementAccessExpression)

method add*(parent: var CsNamespace; item: CsInterface) =
  echo "in method add*(parent: var CsNamespace; item: CsInterface)"
  todoimpl # TODO(add: CsNamespace, CsInterface)

method add*(parent: var CsNamespace; item: CsProperty) =
  echo "in method add*(parent: var CsNamespace; item: CsProperty)"
  todoimpl # TODO(add: CsNamespace, CsProperty)

method add*(parent: var CsNamespace; item: CsStruct) =
  echo "in method add*(parent: var CsNamespace; item: CsStruct)"
  todoimpl # TODO(add: CsNamespace, CsStruct)

method add*(parent: var CsClass; item: CsInterface) =
  echo "in method add*(parent: var CsClass; item: CsInterface)"
  todoimpl # TODO(add: CsClass, CsInterface)

method add*(parent: var CsClass; item: CsStruct) =
  echo "in method add*(parent: var CsClass; item: CsStruct)"
  todoimpl # TODO(add: CsClass, CsStruct)

method add*(parent: var CsMethod; item: CsYieldStatement) = # YS
  echo "in method add*(parent: var CsMethod; item: CsYieldStatement)"
  todoimpl # TODO(add: CsMethod, CsYieldStatement)

method add*(parent: var CsMethod; item: CsTupleType) = # TT
  echo "in method add*(parent: var CsMethod; item: CsTupleType)"
  todoimpl # TODO(add: CsMethod, CsTupleType)

method add*(parent: var CsMethod; item: CsSwitchStatement) = # SS
  echo "in method add*(parent: var CsMethod; item: CsSwitchStatement)"
  todoimpl # TODO(add: CsMethod, CsSwitchStatement)

method add*(parent: var CsMethod; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsMethod; item: CsNullableType)"
  todoimpl # TODO(add: CsMethod, CsNullableType)

method add*(parent: var CsMethod; item: CsLockStatement) = # LS
  echo "in method add*(parent: var CsMethod; item: CsLockStatement)"
  todoimpl # TODO(add: CsMethod, CsLockStatement)

method add*(parent: var CsMethod; item: CsForEachStatement) = # FES
  echo "in method add*(parent: var CsMethod; item: CsForEachStatement)"
  todoimpl # TODO(add: CsMethod, CsForEachStatement)

method add*(parent: var CsReturnStatement; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsReturnStatement; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsReturnStatement, CsImplicitArrayCreationExpression)

method add*(parent: var CsProperty; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsProperty; item: CsNullableType)"
  todoimpl # TODO(add: CsProperty, CsNullableType)

method add*(parent: var CsExpressionStatement; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsExpressionStatement; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsExpressionStatement, CsAwaitExpression)

method add*(parent: var CsExpressionStatement; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsExpressionStatement; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsExpressionStatement, CsConditionalAccessExpression)

method add*(parent: var CsAssignmentExpression; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsAssignmentExpression; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsConditionalAccessExpression)

method add*(parent: var CsAssignmentExpression; item: CsDeclarationExpression) = # DE
  echo "in method add*(parent: var CsAssignmentExpression; item: CsDeclarationExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsDeclarationExpression)

method add*(parent: var CsAssignmentExpression; item: CsImplicitElementAccess) = # IEA
  echo "in method add*(parent: var CsAssignmentExpression; item: CsImplicitElementAccess)"
  todoimpl # TODO(add: CsAssignmentExpression, CsImplicitElementAccess)

method add*(parent: var CsVariable; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsVariable; item: CsNullableType)"
  todoimpl # TODO(add: CsVariable, CsNullableType)

method add*(parent: var CsVariable; item: CsPointerType) = # PT
  echo "in method add*(parent: var CsVariable; item: CsPointerType)"
  todoimpl # TODO(add: CsVariable, CsPointerType)

method add*(parent: var CsVariable; item: CsRefType) = # RT
  echo "in method add*(parent: var CsVariable; item: CsRefType)"
  todoimpl # TODO(add: CsVariable, CsRefType)

method add*(parent: var CsParameter; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsParameter; item: CsNullableType)"
  todoimpl # TODO(add: CsParameter, CsNullableType)

method add*(parent: var CsEqualsValueClause; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsEqualsValueClause; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsImplicitArrayCreationExpression)

method add*(parent: var CsEqualsValueClause; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsEqualsValueClause; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsConditionalAccessExpression)

method add*(parent: var CsEqualsValueClause; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsEqualsValueClause; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsCheckedExpression)

method add*(parent: var CsEqualsValueClause; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsEqualsValueClause; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsAwaitExpression)

method add*(parent: var CsEqualsValueClause; item: CsAnonymousMethodExpression) = # AME
  echo "in method add*(parent: var CsEqualsValueClause; item: CsAnonymousMethodExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsAnonymousMethodExpression)

method add*(parent: var CsArgument; item: CsNameColon) = # NC
  echo "in method add*(parent: var CsArgument; item: CsNameColon)"
  todoimpl # TODO(add: CsArgument, CsNameColon)

method add*(parent: var CsArgument; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsArgument; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsArgument, CsImplicitArrayCreationExpression)

method add*(parent: var CsArgument; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsArgument; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsArgument, CsDefaultExpression)

method add*(parent: var CsArgument; item: CsDeclarationExpression) = # DE
  echo "in method add*(parent: var CsArgument; item: CsDeclarationExpression)"
  todoimpl # TODO(add: CsArgument, CsDeclarationExpression)

method add*(parent: var CsArgument; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsArgument; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsArgument, CsAwaitExpression)

method add*(parent: var CsArgument; item: CsAnonymousObjectCreationExpression) = # AOCE
  echo "in method add*(parent: var CsArgument; item: CsAnonymousObjectCreationExpression)"
  todoimpl # TODO(add: CsArgument, CsAnonymousObjectCreationExpression)

method add*(parent: var CsTypeArgumentList; item: CsTupleType) = # TT
  echo "in method add*(parent: var CsTypeArgumentList; item: CsTupleType)"
  todoimpl # TODO(add: CsTypeArgumentList, CsTupleType)

method add*(parent: var CsMemberAccessExpression; item: CsBaseExpression) = # BE
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsBaseExpression)"
  todoimpl # TODO(add: CsMemberAccessExpression, CsBaseExpression)

method add*(parent: var CsBinaryExpression; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsBinaryExpression; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsBinaryExpression, CsCheckedExpression)

method add*(parent: var CsBinaryExpression; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsBinaryExpression; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsBinaryExpression, CsConditionalAccessExpression)

method add*(parent: var CsIfStatement; item: CsThrowExpression) = # TE
  echo "in method add*(parent: var CsIfStatement; item: CsThrowExpression)"
  todoimpl # TODO(add: CsIfStatement, CsThrowExpression)

method add*(parent: var CsIfStatement; item: CsElseClause) = # EC
  echo "in method add*(parent: var CsIfStatement; item: CsElseClause)"
  todoimpl # TODO(add: CsIfStatement, CsElseClause)

method add*(parent: var CsIfStatement; item: CsIsPatternExpression) = # IPE
  echo "in method add*(parent: var CsIfStatement; item: CsIsPatternExpression)"
  todoimpl # TODO(add: CsIfStatement, CsIsPatternExpression)

method add*(parent: var CsIfStatement; item: CsYieldStatement) = # YS
  echo "in method add*(parent: var CsIfStatement; item: CsYieldStatement)"
  todoimpl # TODO(add: CsIfStatement, CsYieldStatement)

method add*(parent: var CsCastExpression; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsCastExpression; item: CsNullableType)"
  todoimpl # TODO(add: CsCastExpression, CsNullableType)

method add*(parent: var CsArrowExpressionClause; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsElementAccessExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsAnonymousObjectCreationExpression) = # AOCE
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsAnonymousObjectCreationExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsAnonymousObjectCreationExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsQueryExpression) = # QE
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsQueryExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsQueryExpression)

method add*(parent: var CsElementAccessExpression; item: CsBaseExpression) = # BE
  echo "in method add*(parent: var CsElementAccessExpression; item: CsBaseExpression)"
  todoimpl # TODO(add: CsElementAccessExpression, CsBaseExpression)

method add*(parent: var CsParenthesizedExpression; item: CsIsPatternExpression) = # IPE
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsIsPatternExpression)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsIsPatternExpression)

method add*(parent: var CsParenthesizedExpression; item: CsQueryExpression) = # QE
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsQueryExpression)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsQueryExpression)

method add*(parent: var CsTryStatement; item: CsFinallyClause) = # FC
  echo "in method add*(parent: var CsTryStatement; item: CsFinallyClause)"
  todoimpl # TODO(add: CsTryStatement, CsFinallyClause)

method add*(parent: var CsInterpolation; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsInterpolation; item: CsCastExpression)"
  todoimpl # TODO(add: CsInterpolation, CsCastExpression)

method add*(parent: var CsDoStatement; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsDoStatement; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsDoStatement, CsBinaryExpression)

method add*(parent: var CsQueryExpression; item: CsQueryBody) = # QB
  echo "in method add*(parent: var CsQueryExpression; item: CsQueryBody)"
  todoimpl # TODO(add: CsQueryExpression, CsQueryBody)

method add*(parent: var CsBinaryExpression; item: CsIsPatternExpression) = # IPE
  echo "in method add*(parent: var CsBinaryExpression; item: CsIsPatternExpression)"
  todoimpl # TODO(add: CsBinaryExpression, CsIsPatternExpression)

method add*(parent: var CsBinaryExpression; item: CsThrowExpression) = # TE
  echo "in method add*(parent: var CsBinaryExpression; item: CsThrowExpression)"
  todoimpl # TODO(add: CsBinaryExpression, CsThrowExpression)

method add*(parent: var CsInterface; item: CsBaseList) = # BL
  echo "in method add*(parent: var CsInterface; item: CsBaseList)"
  todoimpl # TODO(add: CsInterface, CsBaseList)

method add*(parent: var CsInterface; item: CsMethod) =
  echo "in method add*(parent: var CsInterface; item: CsMethod)"
  todoimpl # TODO(add: CsInterface, CsMethod)

method add*(parent: var CsInterface; item: CsTypeParameterList) = # TPL
  echo "in method add*(parent: var CsInterface; item: CsTypeParameterList)"
  todoimpl # TODO(add: CsInterface, CsTypeParameterList)

method add*(parent: var CsInterpolation; item: CsInterpolationFormatClause) = # IFC
  echo "in method add*(parent: var CsInterpolation; item: CsInterpolationFormatClause)"
  todoimpl # TODO(add: CsInterpolation, CsInterpolationFormatClause)

method add*(parent: var CsPostfixUnaryExpression; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsPostfixUnaryExpression; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsPostfixUnaryExpression, CsLiteralExpression)

method add*(parent: var CsParameter; item: CsPointerType) = # PT
  echo "in method add*(parent: var CsParameter; item: CsPointerType)"
  todoimpl # TODO(add: CsParameter, CsPointerType)

method add*(parent: var CsDeclarationExpression; item: CsSingleVariableDesignation) = # SVD
  echo "in method add*(parent: var CsDeclarationExpression; item: CsSingleVariableDesignation)"
  todoimpl # TODO(add: CsDeclarationExpression, CsSingleVariableDesignation)

method add*(parent: var CsIsPatternExpression; item: CsConstantPattern) = # CP
  echo "in method add*(parent: var CsIsPatternExpression; item: CsConstantPattern)"
  todoimpl # TODO(add: CsIsPatternExpression, CsConstantPattern)

method add*(parent: var CsIsPatternExpression; item: CsDeclarationPattern) = # DP
  echo "in method add*(parent: var CsIsPatternExpression; item: CsDeclarationPattern)"
  todoimpl # TODO(add: CsIsPatternExpression, CsDeclarationPattern)

method add*(parent: var CsIsPatternExpression; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsIsPatternExpression; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsIsPatternExpression, CsMemberAccessExpression)

method add*(parent: var CsAssignmentExpression; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsAssignmentExpression; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsDefaultExpression)

method add*(parent: var CsAssignmentExpression; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsAssignmentExpression; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsImplicitArrayCreationExpression)

method add*(parent: var CsMethod; item: CsContinueStatement) = # CS
  echo "in method add*(parent: var CsMethod; item: CsContinueStatement)"
  todoimpl # TODO(add: CsMethod, CsContinueStatement)

method add*(parent: var CsMethod; item: CsRefType) = # RT
  echo "in method add*(parent: var CsMethod; item: CsRefType)"
  todoimpl # TODO(add: CsMethod, CsRefType)

method add*(parent: var CsNullableType; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsNullableType; item: CsPredefinedType)"
  todoimpl # TODO(add: CsNullableType, CsPredefinedType)

method add*(parent: var CsEqualsValueClause; item: CsAnonymousObjectCreationExpression) = # AOCE
  echo "in method add*(parent: var CsEqualsValueClause; item: CsAnonymousObjectCreationExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsAnonymousObjectCreationExpression)

method add*(parent: var CsEqualsValueClause; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsEqualsValueClause; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsPostfixUnaryExpression)

method add*(parent: var CsEqualsValueClause; item: CsQueryExpression) = # QE
  echo "in method add*(parent: var CsEqualsValueClause; item: CsQueryExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsQueryExpression)

method add*(parent: var CsTypeArgumentList; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsTypeArgumentList; item: CsNullableType)"
  todoimpl # TODO(add: CsTypeArgumentList, CsNullableType)

method add*(parent: var CsTypeArgumentList; item: CsOmittedTypeArgument) = # OTA
  echo "in method add*(parent: var CsTypeArgumentList; item: CsOmittedTypeArgument)"
  todoimpl # TODO(add: CsTypeArgumentList, CsOmittedTypeArgument)

method add*(parent: var CsYieldStatement; item: CsArrayCreationExpression) = # ACE
  echo "in method add*(parent: var CsYieldStatement; item: CsArrayCreationExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsArrayCreationExpression)

method add*(parent: var CsNamespace; item: CsIncompleteMember) = # IM
  echo "in method add*(parent: var CsNamespace; item: CsIncompleteMember)"
  todoimpl # TODO(add: CsNamespace, CsIncompleteMember)

method add*(parent: var CsUsingStatement; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsUsingStatement; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsUsingStatement, CsAwaitExpression)

method add*(parent: var CsConditionalAccessExpression; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsConditionalAccessExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsConditionalAccessExpression, CsInvocationExpression)

method add*(parent: var CsConditionalAccessExpression; item: CsMemberBindingExpression) = # MBE
  echo "in method add*(parent: var CsConditionalAccessExpression; item: CsMemberBindingExpression)"
  todoimpl # TODO(add: CsConditionalAccessExpression, CsMemberBindingExpression)

method add*(parent: var CsStruct; item: CsBaseList) = # BL
  echo "in method add*(parent: var CsStruct; item: CsBaseList)"
  todoimpl # TODO(add: CsStruct, CsBaseList)

method add*(parent: var CsStruct; item: CsConstructor) =
  echo "in method add*(parent: var CsStruct; item: CsConstructor)"
  todoimpl # TODO(add: CsStruct, CsConstructor)

method add*(parent: var CsStruct; item: CsField) =
  echo "in method add*(parent: var CsStruct; item: CsField)"
  todoimpl # TODO(add: CsStruct, CsField)

method add*(parent: var CsStruct; item: CsIncompleteMember) = # IM
  echo "in method add*(parent: var CsStruct; item: CsIncompleteMember)"
  todoimpl # TODO(add: CsStruct, CsIncompleteMember)

method add*(parent: var CsStruct; item: CsProperty) =
  echo "in method add*(parent: var CsStruct; item: CsProperty)"
  todoimpl # TODO(add: CsStruct, CsProperty)

method add*(parent: var CsStruct; item: CsTypeParameterList) = # TPL
  echo "in method add*(parent: var CsStruct; item: CsTypeParameterList)"
  todoimpl # TODO(add: CsStruct, CsTypeParameterList)

method add*(parent: var CsIfStatement; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsIfStatement; item: CsCastExpression)"
  todoimpl # TODO(add: CsIfStatement, CsCastExpression)

method add*(parent: var CsIfStatement; item: CsContinueStatement) = # CS
  echo "in method add*(parent: var CsIfStatement; item: CsContinueStatement)"
  todoimpl # TODO(add: CsIfStatement, CsContinueStatement)

method add*(parent: var CsIfStatement; item: CsEmptyStatement) = # ES
  echo "in method add*(parent: var CsIfStatement; item: CsEmptyStatement)"
  todoimpl # TODO(add: CsIfStatement, CsEmptyStatement)

method add*(parent: var CsAwaitExpression; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsAwaitExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsAwaitExpression, CsInvocationExpression)

method add*(parent: var CsAwaitExpression; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsAwaitExpression; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsAwaitExpression, CsParenthesizedExpression)

method add*(parent: var CsArrowExpressionClause; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsConditionalAccessExpression)

method add*(parent: var CsArrowExpressionClause; item: CsThrowExpression) = # TE
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsThrowExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsThrowExpression)

method add*(parent: var CsElseClause; item: CsExpressionStatement) = # ES
  echo "in method add*(parent: var CsElseClause; item: CsExpressionStatement)"
  todoimpl # TODO(add: CsElseClause, CsExpressionStatement)

method add*(parent: var CsElseClause; item: CsIfStatement) = # IS
  echo "in method add*(parent: var CsElseClause; item: CsIfStatement)"
  todoimpl # TODO(add: CsElseClause, CsIfStatement)

method add*(parent: var CsElseClause; item: CsReturnStatement) = # RS
  echo "in method add*(parent: var CsElseClause; item: CsReturnStatement)"
  todoimpl # TODO(add: CsElseClause, CsReturnStatement)

method add*(parent: var CsTupleType; item: CsTupleElement) = # TE
  echo "in method add*(parent: var CsTupleType; item: CsTupleElement)"
  todoimpl # TODO(add: CsTupleType, CsTupleElement)

method add*(parent: var CsConditionalExpression; item: CsConditionalExpression) = # CE
  echo "in method add*(parent: var CsConditionalExpression; item: CsConditionalExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsConditionalExpression)

method add*(parent: var CsConditionalExpression; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsConditionalExpression; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsElementAccessExpression)

method add*(parent: var CsAnonymousMethodExpression; item: CsParameterList) = # PL
  echo "in method add*(parent: var CsAnonymousMethodExpression; item: CsParameterList)"
  todoimpl # TODO(add: CsAnonymousMethodExpression, CsParameterList)

method add*(parent: var CsTypeParameterConstraintClause; item: CsClassOrStructConstraint) = # COSC
  echo "in method add*(parent: var CsTypeParameterConstraintClause; item: CsClassOrStructConstraint)"
  todoimpl # TODO(add: CsTypeParameterConstraintClause, CsClassOrStructConstraint)

method add*(parent: var CsArgument; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsArgument; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsArgument, CsConditionalAccessExpression)

method add*(parent: var CsArgument; item: CsTupleExpression) = # TE
  echo "in method add*(parent: var CsArgument; item: CsTupleExpression)"
  todoimpl # TODO(add: CsArgument, CsTupleExpression)

method add*(parent: var CsPrefixUnaryExpression; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsPrefixUnaryExpression; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsPrefixUnaryExpression, CsElementAccessExpression)

method add*(parent: var CsImplicitArrayCreationExpression; item: CsInitializerExpression) = # IE
  echo "in method add*(parent: var CsImplicitArrayCreationExpression; item: CsInitializerExpression)"
  todoimpl # TODO(add: CsImplicitArrayCreationExpression, CsInitializerExpression)

method add*(parent: var CsReturnStatement; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsReturnStatement; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsReturnStatement, CsAwaitExpression)

method add*(parent: var CsImplicitElementAccess; item: CsBracketedArgumentList) = # BAL
  echo "in method add*(parent: var CsImplicitElementAccess; item: CsBracketedArgumentList)"
  todoimpl # TODO(add: CsImplicitElementAccess, CsBracketedArgumentList)

method add*(parent: var CsClass; item: CsDelegate) =
  echo "in method add*(parent: var CsClass; item: CsDelegate)"
  todoimpl # TODO(add: CsClass, CsDelegate)

method add*(parent: var CsDelegate; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsDelegate; item: CsPredefinedType)"
  todoimpl # TODO(add: CsDelegate, CsPredefinedType)

method add*(parent: var CsDelegate; item: CsTypeParameterList) = # TPL
  echo "in method add*(parent: var CsDelegate; item: CsTypeParameterList)"
  todoimpl # TODO(add: CsDelegate, CsTypeParameterList)

method add*(parent: var CsForEachStatement; item: CsExpressionStatement) = # ES
  echo "in method add*(parent: var CsForEachStatement; item: CsExpressionStatement)"
  todoimpl # TODO(add: CsForEachStatement, CsExpressionStatement)

method add*(parent: var CsForEachStatement; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsForEachStatement; item: CsGenericName)"
  todoimpl # TODO(add: CsForEachStatement, CsGenericName)

method add*(parent: var CsForEachStatement; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsForEachStatement; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsForEachStatement, CsInvocationExpression)

method add*(parent: var CsForEachStatement; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsForEachStatement; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsForEachStatement, CsMemberAccessExpression)

method add*(parent: var CsForEachStatement; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsForEachStatement; item: CsPredefinedType)"
  todoimpl # TODO(add: CsForEachStatement, CsPredefinedType)

method add*(parent: var CsSwitchStatement; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsSwitchStatement; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsSwitchStatement, CsMemberAccessExpression)

method add*(parent: var CsSwitchStatement; item: CsSwitchSection) = # SS
  echo "in method add*(parent: var CsSwitchStatement; item: CsSwitchSection)"
  todoimpl # TODO(add: CsSwitchStatement, CsSwitchSection)

method add*(parent: var CsArrayRankSpecifier; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsArrayRankSpecifier; item: CsCastExpression)"
  todoimpl # TODO(add: CsArrayRankSpecifier, CsCastExpression)

method add*(parent: var CsArrayRankSpecifier; item: CsConditionalExpression) = # CE
  echo "in method add*(parent: var CsArrayRankSpecifier; item: CsConditionalExpression)"
  todoimpl # TODO(add: CsArrayRankSpecifier, CsConditionalExpression)

method add*(parent: var CsArrayRankSpecifier; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsArrayRankSpecifier; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsArrayRankSpecifier, CsInvocationExpression)

method add*(parent: var CsArrayRankSpecifier; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsArrayRankSpecifier; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsArrayRankSpecifier, CsParenthesizedExpression)

method add*(parent: var CsArrayRankSpecifier; item: CsPrefixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsArrayRankSpecifier; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsArrayRankSpecifier, CsPrefixUnaryExpression)

method add*(parent: var CsInterpolation; item: CsAssignmentExpression) = # AE
  echo "in method add*(parent: var CsInterpolation; item: CsAssignmentExpression)"
  todoimpl # TODO(add: CsInterpolation, CsAssignmentExpression)

method add*(parent: var CsInterpolation; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsInterpolation; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsInterpolation, CsElementAccessExpression)

method add*(parent: var CsInterpolation; item: CsObjectCreationExpression) = # OCE
  echo "in method add*(parent: var CsInterpolation; item: CsObjectCreationExpression)"
  todoimpl # TODO(add: CsInterpolation, CsObjectCreationExpression)

method add*(parent: var CsInterpolation; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsInterpolation; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsInterpolation, CsParenthesizedExpression)

method add*(parent: var CsInterpolation; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsInterpolation; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsInterpolation, CsPostfixUnaryExpression)

method add*(parent: var CsInterpolation; item: CsTypeOfExpression) = # TOE
  echo "in method add*(parent: var CsInterpolation; item: CsTypeOfExpression)"
  todoimpl # TODO(add: CsInterpolation, CsTypeOfExpression)

method add*(parent: var CsCatch; item: CsArrayType) = # AT
  echo "in method add*(parent: var CsCatch; item: CsArrayType)"
  todoimpl # TODO(add: CsCatch, CsArrayType)

method add*(parent: var CsCatch; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsCatch; item: CsGenericName)"
  todoimpl # TODO(add: CsCatch, CsGenericName)

method add*(parent: var CsCatch; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsCatch; item: CsPredefinedType)"
  todoimpl # TODO(add: CsCatch, CsPredefinedType)

method add*(parent: var CsPointerType; item: CsPointerType) = # PT
  echo "in method add*(parent: var CsPointerType; item: CsPointerType)"
  todoimpl # TODO(add: CsPointerType, CsPointerType)

method add*(parent: var CsPointerType; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsPointerType; item: CsPredefinedType)"
  todoimpl # TODO(add: CsPointerType, CsPredefinedType)

method add*(parent: var CsDeclarationExpression; item: CsDiscardDesignation) = # DD
  echo "in method add*(parent: var CsDeclarationExpression; item: CsDiscardDesignation)"
  todoimpl # TODO(add: CsDeclarationExpression, CsDiscardDesignation)

method add*(parent: var CsDeclarationExpression; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsDeclarationExpression; item: CsGenericName)"
  todoimpl # TODO(add: CsDeclarationExpression, CsGenericName)

method add*(parent: var CsDeclarationExpression; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsDeclarationExpression; item: CsNullableType)"
  todoimpl # TODO(add: CsDeclarationExpression, CsNullableType)

method add*(parent: var CsDeclarationExpression; item: CsParenthesizedVariableDesignation) = # PVD
  echo "in method add*(parent: var CsDeclarationExpression; item: CsParenthesizedVariableDesignation)"
  todoimpl # TODO(add: CsDeclarationExpression, CsParenthesizedVariableDesignation)

method add*(parent: var CsDeclarationExpression; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsDeclarationExpression; item: CsPredefinedType)"
  todoimpl # TODO(add: CsDeclarationExpression, CsPredefinedType)

method add*(parent: var CsIsPatternExpression; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsIsPatternExpression; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsIsPatternExpression, CsConditionalAccessExpression)

method add*(parent: var CsIsPatternExpression; item: CsUnaryPattern) = # UP
  echo "in method add*(parent: var CsIsPatternExpression; item: CsUnaryPattern)"
  todoimpl # TODO(add: CsIsPatternExpression, CsUnaryPattern)

method add*(parent: var CsEqualsValueClause; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsEqualsValueClause; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsDefaultExpression)

method add*(parent: var CsEqualsValueClause; item: CsImplicitObjectCreationExpression) = # IOCE
  echo "in method add*(parent: var CsEqualsValueClause; item: CsImplicitObjectCreationExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsImplicitObjectCreationExpression)

method add*(parent: var CsEqualsValueClause; item: CsIsPatternExpression) = # IPE
  echo "in method add*(parent: var CsEqualsValueClause; item: CsIsPatternExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsIsPatternExpression)

method add*(parent: var CsEqualsValueClause; item: CsMakeRefExpression) = # MRE
  echo "in method add*(parent: var CsEqualsValueClause; item: CsMakeRefExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsMakeRefExpression)

method add*(parent: var CsEqualsValueClause; item: CsRefExpression) = # RE
  echo "in method add*(parent: var CsEqualsValueClause; item: CsRefExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsRefExpression)

method add*(parent: var CsEqualsValueClause; item: CsStackAllocArrayCreationExpression) = # SAACE
  echo "in method add*(parent: var CsEqualsValueClause; item: CsStackAllocArrayCreationExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsStackAllocArrayCreationExpression)

method add*(parent: var CsEqualsValueClause; item: CsSwitchExpression) = # SE
  echo "in method add*(parent: var CsEqualsValueClause; item: CsSwitchExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsSwitchExpression)

method add*(parent: var CsEqualsValueClause; item: CsThisExpression) = # TE
  echo "in method add*(parent: var CsEqualsValueClause; item: CsThisExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsThisExpression)

method add*(parent: var CsEqualsValueClause; item: CsTupleExpression) = # TE
  echo "in method add*(parent: var CsEqualsValueClause; item: CsTupleExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsTupleExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsAnonymousObjectCreationExpression) = # AOCE
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsAnonymousObjectCreationExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsAnonymousObjectCreationExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsArrayCreationExpression) = # ACE
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsArrayCreationExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsArrayCreationExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsAwaitExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsConditionalAccessExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsInterpolatedStringExpression) = # ISE
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsInterpolatedStringExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsInterpolatedStringExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsRefExpression) = # RE
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsRefExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsRefExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsThrowExpression) = # TE
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsThrowExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsThrowExpression)

method add*(parent: var CsYieldStatement; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsYieldStatement; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsBinaryExpression)

method add*(parent: var CsYieldStatement; item: CsInterpolatedStringExpression) = # ISE
  echo "in method add*(parent: var CsYieldStatement; item: CsInterpolatedStringExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsInterpolatedStringExpression)

method add*(parent: var CsYieldStatement; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsYieldStatement; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsInvocationExpression)

method add*(parent: var CsYieldStatement; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsYieldStatement; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsLiteralExpression)

method add*(parent: var CsYieldStatement; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsYieldStatement; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsMemberAccessExpression)

method add*(parent: var CsYieldStatement; item: CsObjectCreationExpression) = # OCE
  echo "in method add*(parent: var CsYieldStatement; item: CsObjectCreationExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsObjectCreationExpression)

method add*(parent: var CsElementAccessExpression; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsElementAccessExpression; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsElementAccessExpression, CsLiteralExpression)

method add*(parent: var CsElementAccessExpression; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsElementAccessExpression; item: CsPredefinedType)"
  todoimpl # TODO(add: CsElementAccessExpression, CsPredefinedType)

method add*(parent: var CsArrayType; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsArrayType; item: CsNullableType)"
  todoimpl # TODO(add: CsArrayType, CsNullableType)

method add*(parent: var CsArrayType; item: CsTupleType) = # TT
  echo "in method add*(parent: var CsArrayType; item: CsTupleType)"
  todoimpl # TODO(add: CsArrayType, CsTupleType)

method add*(parent: var CsDoStatement; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsDoStatement; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsDoStatement, CsInvocationExpression)

method add*(parent: var CsDoStatement; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsDoStatement; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsDoStatement, CsLiteralExpression)

method add*(parent: var CsDoStatement; item: CsPrefixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsDoStatement; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsDoStatement, CsPrefixUnaryExpression)

method add*(parent: var CsAwaitExpression; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsAwaitExpression; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsAwaitExpression, CsMemberAccessExpression)

method add*(parent: var CsCatchClause; item: CsCatchFilterClause) = # CFC
  echo "in method add*(parent: var CsCatchClause; item: CsCatchFilterClause)"
  todoimpl # TODO(add: CsCatchClause, CsCatchFilterClause)

method add*(parent: var CsArrowExpressionClause; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsAwaitExpression)

method add*(parent: var CsArrowExpressionClause; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsImplicitArrayCreationExpression)

method add*(parent: var CsArrowExpressionClause; item: CsIsPatternExpression) = # IPE
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsIsPatternExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsIsPatternExpression)

method add*(parent: var CsArrowExpressionClause; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsParenthesizedExpression)

method add*(parent: var CsArrowExpressionClause; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsPostfixUnaryExpression)

method add*(parent: var CsArrowExpressionClause; item: CsPrefixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsPrefixUnaryExpression)

method add*(parent: var CsArrowExpressionClause; item: CsQueryExpression) = # QE
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsQueryExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsQueryExpression)

method add*(parent: var CsArrowExpressionClause; item: CsSwitchExpression) = # SE
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsSwitchExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsSwitchExpression)

method add*(parent: var CsArrowExpressionClause; item: CsThisExpression) = # TE
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsThisExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsThisExpression)

method add*(parent: var CsMemberAccessExpression; item: CsAliasQualifiedName) = # AQN
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsAliasQualifiedName)"
  todoimpl # TODO(add: CsMemberAccessExpression, CsAliasQualifiedName)

method add*(parent: var CsMemberAccessExpression; item: CsAnonymousObjectCreationExpression) = # AOCE
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsAnonymousObjectCreationExpression)"
  todoimpl # TODO(add: CsMemberAccessExpression, CsAnonymousObjectCreationExpression)

method add*(parent: var CsMemberAccessExpression; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsMemberAccessExpression, CsImplicitArrayCreationExpression)

method add*(parent: var CsMemberAccessExpression; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsMemberAccessExpression, CsPostfixUnaryExpression)

method add*(parent: var CsInitializerExpression; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsInitializerExpression; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsInitializerExpression, CsAwaitExpression)

method add*(parent: var CsInitializerExpression; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsInitializerExpression; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsInitializerExpression, CsCheckedExpression)

method add*(parent: var CsInitializerExpression; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsInitializerExpression; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsInitializerExpression, CsDefaultExpression)

method add*(parent: var CsInitializerExpression; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsInitializerExpression; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsInitializerExpression, CsElementAccessExpression)

method add*(parent: var CsInitializerExpression; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsInitializerExpression; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsInitializerExpression, CsImplicitArrayCreationExpression)

method add*(parent: var CsInitializerExpression; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsInitializerExpression; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsInitializerExpression, CsParenthesizedExpression)

method add*(parent: var CsInitializerExpression; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsInitializerExpression; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsInitializerExpression, CsPostfixUnaryExpression)

method add*(parent: var CsInitializerExpression; item: CsThisExpression) = # TE
  echo "in method add*(parent: var CsInitializerExpression; item: CsThisExpression)"
  todoimpl # TODO(add: CsInitializerExpression, CsThisExpression)

method add*(parent: var CsPrefixUnaryExpression; item: CsPrefixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsPrefixUnaryExpression; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsPrefixUnaryExpression, CsPrefixUnaryExpression)

method add*(parent: var CsTypeOfExpression; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsTypeOfExpression; item: CsNullableType)"
  todoimpl # TODO(add: CsTypeOfExpression, CsNullableType)

method add*(parent: var CsTypeOfExpression; item: CsPointerType) = # PT
  echo "in method add*(parent: var CsTypeOfExpression; item: CsPointerType)"
  todoimpl # TODO(add: CsTypeOfExpression, CsPointerType)

method add*(parent: var CsExpressionStatement; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsExpressionStatement; item: CsCastExpression)"
  todoimpl # TODO(add: CsExpressionStatement, CsCastExpression)

method add*(parent: var CsExpressionStatement; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsExpressionStatement; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsExpressionStatement, CsElementAccessExpression)

method add*(parent: var CsExpressionStatement; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsExpressionStatement; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsExpressionStatement, CsMemberAccessExpression)

method add*(parent: var CsExpressionStatement; item: CsThisExpression) = # TE
  echo "in method add*(parent: var CsExpressionStatement; item: CsThisExpression)"
  todoimpl # TODO(add: CsExpressionStatement, CsThisExpression)

method add*(parent: var CsLockStatement; item: CsLockStatement) = # LS
  echo "in method add*(parent: var CsLockStatement; item: CsLockStatement)"
  todoimpl # TODO(add: CsLockStatement, CsLockStatement)

method add*(parent: var CsLockStatement; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsLockStatement; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsLockStatement, CsMemberAccessExpression)

method add*(parent: var CsLockStatement; item: CsThisExpression) = # TE
  echo "in method add*(parent: var CsLockStatement; item: CsThisExpression)"
  todoimpl # TODO(add: CsLockStatement, CsThisExpression)

method add*(parent: var CsLockStatement; item: CsTypeOfExpression) = # TOE
  echo "in method add*(parent: var CsLockStatement; item: CsTypeOfExpression)"
  todoimpl # TODO(add: CsLockStatement, CsTypeOfExpression)

method add*(parent: var CsClass; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsClass; item: CsGenericName)"
  todoimpl # TODO(add: CsClass, CsGenericName)

method add*(parent: var CsClass; item: CsIncompleteMember) = # IM
  echo "in method add*(parent: var CsClass; item: CsIncompleteMember)"
  todoimpl # TODO(add: CsClass, CsIncompleteMember)

method add*(parent: var CsSwitchStatement; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsSwitchStatement; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsSwitchStatement, CsAwaitExpression)

method add*(parent: var CsSwitchStatement; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsSwitchStatement; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsSwitchStatement, CsBinaryExpression)

method add*(parent: var CsSwitchStatement; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsSwitchStatement; item: CsCastExpression)"
  todoimpl # TODO(add: CsSwitchStatement, CsCastExpression)

method add*(parent: var CsSwitchStatement; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsSwitchStatement; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsSwitchStatement, CsConditionalAccessExpression)

method add*(parent: var CsSwitchStatement; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsSwitchStatement; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsSwitchStatement, CsElementAccessExpression)

method add*(parent: var CsSwitchStatement; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsSwitchStatement; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsSwitchStatement, CsInvocationExpression)

method add*(parent: var CsSwitchStatement; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsSwitchStatement; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsSwitchStatement, CsLiteralExpression)

method add*(parent: var CsSwitchStatement; item: CsPrefixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsSwitchStatement; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsSwitchStatement, CsPrefixUnaryExpression)

method add*(parent: var CsParenthesizedExpression; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsAwaitExpression)

method add*(parent: var CsParenthesizedExpression; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsCheckedExpression)

method add*(parent: var CsParenthesizedExpression; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsElementAccessExpression)

method add*(parent: var CsParenthesizedExpression; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsImplicitArrayCreationExpression)

method add*(parent: var CsParenthesizedExpression; item: CsInterpolatedStringExpression) = # ISE
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsInterpolatedStringExpression)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsInterpolatedStringExpression)

method add*(parent: var CsParenthesizedExpression; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsParenthesizedExpression)

method add*(parent: var CsParenthesizedExpression; item: CsTypeOfExpression) = # TOE
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsTypeOfExpression)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsTypeOfExpression)

method add*(parent: var CsCastExpression; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsCastExpression; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsCastExpression, CsAwaitExpression)

method add*(parent: var CsCastExpression; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsCastExpression; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsCastExpression, CsConditionalAccessExpression)

method add*(parent: var CsCastExpression; item: CsPointerType) = # PT
  echo "in method add*(parent: var CsCastExpression; item: CsPointerType)"
  todoimpl # TODO(add: CsCastExpression, CsPointerType)

method add*(parent: var CsCastExpression; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsCastExpression; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsCastExpression, CsPostfixUnaryExpression)

method add*(parent: var CsBinaryExpression; item: CsArrayCreationExpression) = # ACE
  echo "in method add*(parent: var CsBinaryExpression; item: CsArrayCreationExpression)"
  todoimpl # TODO(add: CsBinaryExpression, CsArrayCreationExpression)

method add*(parent: var CsBinaryExpression; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsBinaryExpression; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsBinaryExpression, CsAwaitExpression)

method add*(parent: var CsBinaryExpression; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsBinaryExpression; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsBinaryExpression, CsDefaultExpression)

method add*(parent: var CsBinaryExpression; item: CsInterpolatedStringExpression) = # ISE
  echo "in method add*(parent: var CsBinaryExpression; item: CsInterpolatedStringExpression)"
  todoimpl # TODO(add: CsBinaryExpression, CsInterpolatedStringExpression)

method add*(parent: var CsBinaryExpression; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsBinaryExpression; item: CsNullableType)"
  todoimpl # TODO(add: CsBinaryExpression, CsNullableType)

method add*(parent: var CsSimpleBaseType; item: CsAliasQualifiedName) = # AQN
  echo "in method add*(parent: var CsSimpleBaseType; item: CsAliasQualifiedName)"
  todoimpl # TODO(add: CsSimpleBaseType, CsAliasQualifiedName)

method add*(parent: var CsSimpleBaseType; item: CsArrayType) = # AT
  echo "in method add*(parent: var CsSimpleBaseType; item: CsArrayType)"
  todoimpl # TODO(add: CsSimpleBaseType, CsArrayType)

method add*(parent: var CsInterface; item: CsField) =
  echo "in method add*(parent: var CsInterface; item: CsField)"
  todoimpl # TODO(add: CsInterface, CsField)

method add*(parent: var CsInterface; item: CsIndexer) =
  echo "in method add*(parent: var CsInterface; item: CsIndexer)"
  todoimpl # TODO(add: CsInterface, CsIndexer)

method add*(parent: var CsPostfixUnaryExpression; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsPostfixUnaryExpression; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsPostfixUnaryExpression, CsParenthesizedExpression)

method add*(parent: var CsAssignmentExpression; item: CsAnonymousMethodExpression) = # AME
  echo "in method add*(parent: var CsAssignmentExpression; item: CsAnonymousMethodExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsAnonymousMethodExpression)

method add*(parent: var CsAssignmentExpression; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsAssignmentExpression; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsAwaitExpression)

method add*(parent: var CsAssignmentExpression; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsAssignmentExpression; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsCheckedExpression)

method add*(parent: var CsAssignmentExpression; item: CsImplicitObjectCreationExpression) = # IOCE
  echo "in method add*(parent: var CsAssignmentExpression; item: CsImplicitObjectCreationExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsImplicitObjectCreationExpression)

method add*(parent: var CsAssignmentExpression; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsAssignmentExpression; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsPostfixUnaryExpression)

method add*(parent: var CsAssignmentExpression; item: CsTupleExpression) = # TE
  echo "in method add*(parent: var CsAssignmentExpression; item: CsTupleExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsTupleExpression)

method add*(parent: var CsMethod; item: CsGotoStatement) = # GS
  echo "in method add*(parent: var CsMethod; item: CsGotoStatement)"
  todoimpl # TODO(add: CsMethod, CsGotoStatement)

method add*(parent: var CsMethod; item: CsPointerType) = # PT
  echo "in method add*(parent: var CsMethod; item: CsPointerType)"
  todoimpl # TODO(add: CsMethod, CsPointerType)

method add*(parent: var CsNullableType; item: CsArrayType) = # AT
  echo "in method add*(parent: var CsNullableType; item: CsArrayType)"
  todoimpl # TODO(add: CsNullableType, CsArrayType)

method add*(parent: var CsNullableType; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsNullableType; item: CsGenericName)"
  todoimpl # TODO(add: CsNullableType, CsGenericName)

method add*(parent: var CsVariable; item: CsAliasQualifiedName) = # AQN
  echo "in method add*(parent: var CsVariable; item: CsAliasQualifiedName)"
  todoimpl # TODO(add: CsVariable, CsAliasQualifiedName)

method add*(parent: var CsUsingDirective; item: CsAliasQualifiedName) = # AQN
  echo "in method add*(parent: var CsUsingDirective; item: CsAliasQualifiedName)"
  todoimpl # TODO(add: CsUsingDirective, CsAliasQualifiedName)

method add*(parent: var CsNamespace; item: CsConstructor) =
  echo "in method add*(parent: var CsNamespace; item: CsConstructor)"
  todoimpl # TODO(add: CsNamespace, CsConstructor)

method add*(parent: var CsNamespace; item: CsField) =
  echo "in method add*(parent: var CsNamespace; item: CsField)"
  todoimpl # TODO(add: CsNamespace, CsField)

method add*(parent: var CsUsingStatement; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsUsingStatement; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsUsingStatement, CsBinaryExpression)

method add*(parent: var CsUsingStatement; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsUsingStatement; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsUsingStatement, CsConditionalAccessExpression)

method add*(parent: var CsUsingStatement; item: CsConditionalExpression) = # CE
  echo "in method add*(parent: var CsUsingStatement; item: CsConditionalExpression)"
  todoimpl # TODO(add: CsUsingStatement, CsConditionalExpression)

method add*(parent: var CsUsingStatement; item: CsEmptyStatement) = # ES
  echo "in method add*(parent: var CsUsingStatement; item: CsEmptyStatement)"
  todoimpl # TODO(add: CsUsingStatement, CsEmptyStatement)

method add*(parent: var CsUsingStatement; item: CsReturnStatement) = # RS
  echo "in method add*(parent: var CsUsingStatement; item: CsReturnStatement)"
  todoimpl # TODO(add: CsUsingStatement, CsReturnStatement)

method add*(parent: var CsUsingStatement; item: CsWhileStatement) = # WS
  echo "in method add*(parent: var CsUsingStatement; item: CsWhileStatement)"
  todoimpl # TODO(add: CsUsingStatement, CsWhileStatement)

method add*(parent: var CsConditionalAccessExpression; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsConditionalAccessExpression; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsConditionalAccessExpression, CsConditionalAccessExpression)

method add*(parent: var CsConditionalAccessExpression; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsConditionalAccessExpression; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsConditionalAccessExpression, CsMemberAccessExpression)

method add*(parent: var CsConditionalAccessExpression; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsConditionalAccessExpression; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsConditionalAccessExpression, CsParenthesizedExpression)

method add*(parent: var CsDefaultExpression; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsDefaultExpression; item: CsPredefinedType)"
  todoimpl # TODO(add: CsDefaultExpression, CsPredefinedType)

method add*(parent: var CsStruct; item: CsDelegate) =
  echo "in method add*(parent: var CsStruct; item: CsDelegate)"
  todoimpl # TODO(add: CsStruct, CsDelegate)

method add*(parent: var CsStruct; item: CsEnum) =
  echo "in method add*(parent: var CsStruct; item: CsEnum)"
  todoimpl # TODO(add: CsStruct, CsEnum)

method add*(parent: var CsStruct; item: CsMethod) =
  echo "in method add*(parent: var CsStruct; item: CsMethod)"
  todoimpl # TODO(add: CsStruct, CsMethod)

method add*(parent: var CsIfStatement; item: CsAssignmentExpression) = # AE
  echo "in method add*(parent: var CsIfStatement; item: CsAssignmentExpression)"
  todoimpl # TODO(add: CsIfStatement, CsAssignmentExpression)

method add*(parent: var CsIfStatement; item: CsForEachStatement) = # FES
  echo "in method add*(parent: var CsIfStatement; item: CsForEachStatement)"
  todoimpl # TODO(add: CsIfStatement, CsForEachStatement)

method add*(parent: var CsIfStatement; item: CsForStatement) = # FS
  echo "in method add*(parent: var CsIfStatement; item: CsForStatement)"
  todoimpl # TODO(add: CsIfStatement, CsForStatement)

method add*(parent: var CsIfStatement; item: CsGotoStatement) = # GS
  echo "in method add*(parent: var CsIfStatement; item: CsGotoStatement)"
  todoimpl # TODO(add: CsIfStatement, CsGotoStatement)

method add*(parent: var CsIfStatement; item: CsLocalDeclarationStatement) = # LDS
  echo "in method add*(parent: var CsIfStatement; item: CsLocalDeclarationStatement)"
  todoimpl # TODO(add: CsIfStatement, CsLocalDeclarationStatement)

method add*(parent: var CsIfStatement; item: CsTryStatement) = # TS
  echo "in method add*(parent: var CsIfStatement; item: CsTryStatement)"
  todoimpl # TODO(add: CsIfStatement, CsTryStatement)

method add*(parent: var CsIfStatement; item: CsUsingStatement) = # US
  echo "in method add*(parent: var CsIfStatement; item: CsUsingStatement)"
  todoimpl # TODO(add: CsIfStatement, CsUsingStatement)

method add*(parent: var CsForStatement; item: CsEmptyStatement) = # ES
  echo "in method add*(parent: var CsForStatement; item: CsEmptyStatement)"
  todoimpl # TODO(add: CsForStatement, CsEmptyStatement)

method add*(parent: var CsForStatement; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsForStatement; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsForStatement, CsInvocationExpression)

method add*(parent: var CsForStatement; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsForStatement; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsForStatement, CsLiteralExpression)

method add*(parent: var CsForStatement; item: CsLocalDeclarationStatement) = # LDS
  echo "in method add*(parent: var CsForStatement; item: CsLocalDeclarationStatement)"
  todoimpl # TODO(add: CsForStatement, CsLocalDeclarationStatement)

method add*(parent: var CsForStatement; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsForStatement; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsForStatement, CsMemberAccessExpression)

method add*(parent: var CsForStatement; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsForStatement; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsForStatement, CsParenthesizedExpression)

method add*(parent: var CsForStatement; item: CsYieldStatement) = # YS
  echo "in method add*(parent: var CsForStatement; item: CsYieldStatement)"
  todoimpl # TODO(add: CsForStatement, CsYieldStatement)

method add*(parent: var CsElseClause; item: CsThrowStatement) = # TS
  echo "in method add*(parent: var CsElseClause; item: CsThrowStatement)"
  todoimpl # TODO(add: CsElseClause, CsThrowStatement)

method add*(parent: var CsInvocationExpression; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsInvocationExpression; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsInvocationExpression, CsCheckedExpression)

method add*(parent: var CsInvocationExpression; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsInvocationExpression; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsInvocationExpression, CsParenthesizedExpression)

method add*(parent: var CsInvocationExpression; item: CsParenthesizedLambdaExpression) = # PLE
  echo "in method add*(parent: var CsInvocationExpression; item: CsParenthesizedLambdaExpression)"
  todoimpl # TODO(add: CsInvocationExpression, CsParenthesizedLambdaExpression)

method add*(parent: var CsInvocationExpression; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsInvocationExpression; item: CsPredefinedType)"
  todoimpl # TODO(add: CsInvocationExpression, CsPredefinedType)

method add*(parent: var CsWhileStatement; item: CsConditionalExpression) = # CE
  echo "in method add*(parent: var CsWhileStatement; item: CsConditionalExpression)"
  todoimpl # TODO(add: CsWhileStatement, CsConditionalExpression)

method add*(parent: var CsWhileStatement; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsWhileStatement; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsWhileStatement, CsElementAccessExpression)

method add*(parent: var CsWhileStatement; item: CsEmptyStatement) = # ES
  echo "in method add*(parent: var CsWhileStatement; item: CsEmptyStatement)"
  todoimpl # TODO(add: CsWhileStatement, CsEmptyStatement)

method add*(parent: var CsWhileStatement; item: CsForStatement) = # FS
  echo "in method add*(parent: var CsWhileStatement; item: CsForStatement)"
  todoimpl # TODO(add: CsWhileStatement, CsForStatement)

method add*(parent: var CsWhileStatement; item: CsIfStatement) = # IS
  echo "in method add*(parent: var CsWhileStatement; item: CsIfStatement)"
  todoimpl # TODO(add: CsWhileStatement, CsIfStatement)

method add*(parent: var CsWhileStatement; item: CsIsPatternExpression) = # IPE
  echo "in method add*(parent: var CsWhileStatement; item: CsIsPatternExpression)"
  todoimpl # TODO(add: CsWhileStatement, CsIsPatternExpression)

method add*(parent: var CsWhileStatement; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsWhileStatement; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsWhileStatement, CsMemberAccessExpression)

method add*(parent: var CsThrowStatement; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsThrowStatement; item: CsCastExpression)"
  todoimpl # TODO(add: CsThrowStatement, CsCastExpression)

method add*(parent: var CsThrowStatement; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsThrowStatement; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsThrowStatement, CsMemberAccessExpression)

method add*(parent: var CsThrowStatement; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsThrowStatement; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsThrowStatement, CsParenthesizedExpression)

method add*(parent: var CsIndexer; item: CsArrowExpressionClause) = # AEC
  echo "in method add*(parent: var CsIndexer; item: CsArrowExpressionClause)"
  todoimpl # TODO(add: CsIndexer, CsArrowExpressionClause)

method add*(parent: var CsIndexer; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsIndexer; item: CsGenericName)"
  todoimpl # TODO(add: CsIndexer, CsGenericName)

method add*(parent: var CsIndexer; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsIndexer; item: CsNullableType)"
  todoimpl # TODO(add: CsIndexer, CsNullableType)

method add*(parent: var CsIndexer; item: CsRefType) = # RT
  echo "in method add*(parent: var CsIndexer; item: CsRefType)"
  todoimpl # TODO(add: CsIndexer, CsRefType)

method add*(parent: var CsConditionalExpression; item: CsArrayCreationExpression) = # ACE
  echo "in method add*(parent: var CsConditionalExpression; item: CsArrayCreationExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsArrayCreationExpression)

method add*(parent: var CsConditionalExpression; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsConditionalExpression; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsAwaitExpression)

method add*(parent: var CsConditionalExpression; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsConditionalExpression; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsConditionalAccessExpression)

method add*(parent: var CsConditionalExpression; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsConditionalExpression; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsDefaultExpression)

method add*(parent: var CsConditionalExpression; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsConditionalExpression; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsImplicitArrayCreationExpression)

method add*(parent: var CsConditionalExpression; item: CsIsPatternExpression) = # IPE
  echo "in method add*(parent: var CsConditionalExpression; item: CsIsPatternExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsIsPatternExpression)

method add*(parent: var CsConditionalExpression; item: CsParenthesizedLambdaExpression) = # PLE
  echo "in method add*(parent: var CsConditionalExpression; item: CsParenthesizedLambdaExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsParenthesizedLambdaExpression)

method add*(parent: var CsVariableDeclarator; item: CsBracketedArgumentList) = # BAL
  echo "in method add*(parent: var CsVariableDeclarator; item: CsBracketedArgumentList)"
  todoimpl # TODO(add: CsVariableDeclarator, CsBracketedArgumentList)

method add*(parent: var CsSimpleLambdaExpression; item: CsArrayCreationExpression) = # ACE
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsArrayCreationExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsArrayCreationExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsElementAccessExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsImplicitArrayCreationExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsInterpolatedStringExpression) = # ISE
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsInterpolatedStringExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsInterpolatedStringExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsPostfixUnaryExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsThrowExpression) = # TE
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsThrowExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsThrowExpression)

method add*(parent: var CsArgument; item: CsAliasQualifiedName) = # AQN
  echo "in method add*(parent: var CsArgument; item: CsAliasQualifiedName)"
  todoimpl # TODO(add: CsArgument, CsAliasQualifiedName)

method add*(parent: var CsArgument; item: CsAnonymousMethodExpression) = # AME
  echo "in method add*(parent: var CsArgument; item: CsAnonymousMethodExpression)"
  todoimpl # TODO(add: CsArgument, CsAnonymousMethodExpression)

method add*(parent: var CsArgument; item: CsBaseExpression) = # BE
  echo "in method add*(parent: var CsArgument; item: CsBaseExpression)"
  todoimpl # TODO(add: CsArgument, CsBaseExpression)

method add*(parent: var CsArgument; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsArgument; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsArgument, CsCheckedExpression)

method add*(parent: var CsArgument; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsArgument; item: CsGenericName)"
  todoimpl # TODO(add: CsArgument, CsGenericName)

method add*(parent: var CsArgument; item: CsImplicitObjectCreationExpression) = # IOCE
  echo "in method add*(parent: var CsArgument; item: CsImplicitObjectCreationExpression)"
  todoimpl # TODO(add: CsArgument, CsImplicitObjectCreationExpression)

method add*(parent: var CsArgument; item: CsIsPatternExpression) = # IPE
  echo "in method add*(parent: var CsArgument; item: CsIsPatternExpression)"
  todoimpl # TODO(add: CsArgument, CsIsPatternExpression)

method add*(parent: var CsArgument; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsArgument; item: CsPredefinedType)"
  todoimpl # TODO(add: CsArgument, CsPredefinedType)

method add*(parent: var CsArgument; item: CsQueryExpression) = # QE
  echo "in method add*(parent: var CsArgument; item: CsQueryExpression)"
  todoimpl # TODO(add: CsArgument, CsQueryExpression)

method add*(parent: var CsArgument; item: CsRangeExpression) = # RE
  echo "in method add*(parent: var CsArgument; item: CsRangeExpression)"
  todoimpl # TODO(add: CsArgument, CsRangeExpression)

method add*(parent: var CsReturnStatement; item: CsAnonymousObjectCreationExpression) = # AOCE
  echo "in method add*(parent: var CsReturnStatement; item: CsAnonymousObjectCreationExpression)"
  todoimpl # TODO(add: CsReturnStatement, CsAnonymousObjectCreationExpression)

method add*(parent: var CsReturnStatement; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsReturnStatement; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsReturnStatement, CsCheckedExpression)

method add*(parent: var CsReturnStatement; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsReturnStatement; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsReturnStatement, CsConditionalAccessExpression)

method add*(parent: var CsReturnStatement; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsReturnStatement; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsReturnStatement, CsDefaultExpression)

method add*(parent: var CsReturnStatement; item: CsQueryExpression) = # QE
  echo "in method add*(parent: var CsReturnStatement; item: CsQueryExpression)"
  todoimpl # TODO(add: CsReturnStatement, CsQueryExpression)

method add*(parent: var CsReturnStatement; item: CsSwitchExpression) = # SE
  echo "in method add*(parent: var CsReturnStatement; item: CsSwitchExpression)"
  todoimpl # TODO(add: CsReturnStatement, CsSwitchExpression)

method add*(parent: var CsCheckedExpression; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsCheckedExpression; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsCheckedExpression, CsBinaryExpression)

method add*(parent: var CsCheckedExpression; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsCheckedExpression; item: CsCastExpression)"
  todoimpl # TODO(add: CsCheckedExpression, CsCastExpression)

method add*(parent: var CsAnonymousObjectCreationExpression; item: CsAnonymousObjectMemberDeclarator) = # AOMD
  echo "in method add*(parent: var CsAnonymousObjectCreationExpression; item: CsAnonymousObjectMemberDeclarator)"
  todoimpl # TODO(add: CsAnonymousObjectCreationExpression, CsAnonymousObjectMemberDeclarator)

method add*(parent: var CsDelegate; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsDelegate; item: CsGenericName)"
  todoimpl # TODO(add: CsDelegate, CsGenericName)

method add*(parent: var CsDelegate; item: CsParameterList) = # PL
  echo "in method add*(parent: var CsDelegate; item: CsParameterList)"
  todoimpl # TODO(add: CsDelegate, CsParameterList)

method add*(parent: var CsForEachStatement; item: CsArrayCreationExpression) = # ACE
  echo "in method add*(parent: var CsForEachStatement; item: CsArrayCreationExpression)"
  todoimpl # TODO(add: CsForEachStatement, CsArrayCreationExpression)

method add*(parent: var CsForEachStatement; item: CsArrayType) = # AT
  echo "in method add*(parent: var CsForEachStatement; item: CsArrayType)"
  todoimpl # TODO(add: CsForEachStatement, CsArrayType)

method add*(parent: var CsForEachStatement; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsForEachStatement; item: CsCastExpression)"
  todoimpl # TODO(add: CsForEachStatement, CsCastExpression)

method add*(parent: var CsForEachStatement; item: CsIfStatement) = # IS
  echo "in method add*(parent: var CsForEachStatement; item: CsIfStatement)"
  todoimpl # TODO(add: CsForEachStatement, CsIfStatement)

method add*(parent: var CsForEachStatement; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsForEachStatement; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsForEachStatement, CsImplicitArrayCreationExpression)

method add*(parent: var CsForEachStatement; item: CsObjectCreationExpression) = # OCE
  echo "in method add*(parent: var CsForEachStatement; item: CsObjectCreationExpression)"
  todoimpl # TODO(add: CsForEachStatement, CsObjectCreationExpression)

method add*(parent: var CsForEachStatement; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsForEachStatement; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsForEachStatement, CsPostfixUnaryExpression)

method add*(parent: var CsForEachStatement; item: CsThisExpression) = # TE
  echo "in method add*(parent: var CsForEachStatement; item: CsThisExpression)"
  todoimpl # TODO(add: CsForEachStatement, CsThisExpression)

method add*(parent: var CsForEachStatement; item: CsYieldStatement) = # YS
  echo "in method add*(parent: var CsForEachStatement; item: CsYieldStatement)"
  todoimpl # TODO(add: CsForEachStatement, CsYieldStatement)

method add*(parent: var CsInterpolation; item: CsInterpolationAlignmentClause) = # IAC
  echo "in method add*(parent: var CsInterpolation; item: CsInterpolationAlignmentClause)"
  todoimpl # TODO(add: CsInterpolation, CsInterpolationAlignmentClause)

method add*(parent: var CsIsPatternExpression; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsIsPatternExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsIsPatternExpression, CsInvocationExpression)

method add*(parent: var CsTypeArgumentList; item: CsPointerType) = # PT
  echo "in method add*(parent: var CsTypeArgumentList; item: CsPointerType)"
  todoimpl # TODO(add: CsTypeArgumentList, CsPointerType)

method add*(parent: var CsYieldStatement; item: CsThisExpression) = # TE
  echo "in method add*(parent: var CsYieldStatement; item: CsThisExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsThisExpression)

method add*(parent: var CsTupleElement; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsTupleElement; item: CsPredefinedType)"
  todoimpl # TODO(add: CsTupleElement, CsPredefinedType)

method add*(parent: var CsTupleExpression; item: CsArgument) =
  echo "in method add*(parent: var CsTupleExpression; item: CsArgument)"
  todoimpl # TODO(add: CsTupleExpression, CsArgument)

method add*(parent: var CsElementAccessExpression; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsElementAccessExpression; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsElementAccessExpression, CsDefaultExpression)

method add*(parent: var CsElementAccessExpression; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsElementAccessExpression; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsElementAccessExpression, CsImplicitArrayCreationExpression)

method add*(parent: var CsArrayType; item: CsPointerType) = # PT
  echo "in method add*(parent: var CsArrayType; item: CsPointerType)"
  todoimpl # TODO(add: CsArrayType, CsPointerType)

method add*(parent: var CsAwaitExpression; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsAwaitExpression; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsAwaitExpression, CsLiteralExpression)

method add*(parent: var CsMemberAccessExpression; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsMemberAccessExpression, CsDefaultExpression)

method add*(parent: var CsInitializerExpression; item: CsAnonymousMethodExpression) = # AME
  echo "in method add*(parent: var CsInitializerExpression; item: CsAnonymousMethodExpression)"
  todoimpl # TODO(add: CsInitializerExpression, CsAnonymousMethodExpression)

method add*(parent: var CsInitializerExpression; item: CsTupleExpression) = # TE
  echo "in method add*(parent: var CsInitializerExpression; item: CsTupleExpression)"
  todoimpl # TODO(add: CsInitializerExpression, CsTupleExpression)

method add*(parent: var CsExpressionStatement; item: CsQueryExpression) = # QE
  echo "in method add*(parent: var CsExpressionStatement; item: CsQueryExpression)"
  todoimpl # TODO(add: CsExpressionStatement, CsQueryExpression)

method add*(parent: var CsLockStatement; item: CsEmptyStatement) = # ES
  echo "in method add*(parent: var CsLockStatement; item: CsEmptyStatement)"
  todoimpl # TODO(add: CsLockStatement, CsEmptyStatement)

method add*(parent: var CsLockStatement; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsLockStatement; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsLockStatement, CsLiteralExpression)

method add*(parent: var CsSwitchSection; item: CsCaseSwitchLabel) = # CSL
  echo "in method add*(parent: var CsSwitchSection; item: CsCaseSwitchLabel)"
  todoimpl # TODO(add: CsSwitchSection, CsCaseSwitchLabel)

method add*(parent: var CsProperty; item: CsPointerType) = # PT
  echo "in method add*(parent: var CsProperty; item: CsPointerType)"
  todoimpl # TODO(add: CsProperty, CsPointerType)

method add*(parent: var CsProperty; item: CsRefType) = # RT
  echo "in method add*(parent: var CsProperty; item: CsRefType)"
  todoimpl # TODO(add: CsProperty, CsRefType)

method add*(parent: var CsBinaryExpression; item: CsAnonymousMethodExpression) = # AME
  echo "in method add*(parent: var CsBinaryExpression; item: CsAnonymousMethodExpression)"
  todoimpl # TODO(add: CsBinaryExpression, CsAnonymousMethodExpression)

method add*(parent: var CsBinaryExpression; item: CsTupleExpression) = # TE
  echo "in method add*(parent: var CsBinaryExpression; item: CsTupleExpression)"
  todoimpl # TODO(add: CsBinaryExpression, CsTupleExpression)

method add*(parent: var CsInterface; item: CsTypeParameterConstraintClause) = # TPCC
  echo "in method add*(parent: var CsInterface; item: CsTypeParameterConstraintClause)"
  todoimpl # TODO(add: CsInterface, CsTypeParameterConstraintClause)

method add*(parent: var CsObjectCreationExpression; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsObjectCreationExpression; item: CsNullableType)"
  todoimpl # TODO(add: CsObjectCreationExpression, CsNullableType)

method add*(parent: var CsObjectCreationExpression; item: CsTupleType) = # TT
  echo "in method add*(parent: var CsObjectCreationExpression; item: CsTupleType)"
  todoimpl # TODO(add: CsObjectCreationExpression, CsTupleType)

method add*(parent: var CsParameter; item: CsTupleType) = # TT
  echo "in method add*(parent: var CsParameter; item: CsTupleType)"
  todoimpl # TODO(add: CsParameter, CsTupleType)

method add*(parent: var CsAssignmentExpression; item: CsBaseExpression) = # BE
  echo "in method add*(parent: var CsAssignmentExpression; item: CsBaseExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsBaseExpression)

method add*(parent: var CsVariable; item: CsTupleType) = # TT
  echo "in method add*(parent: var CsVariable; item: CsTupleType)"
  todoimpl # TODO(add: CsVariable, CsTupleType)

method add*(parent: var CsNamespace; item: CsAliasQualifiedName) = # AQN
  echo "in method add*(parent: var CsNamespace; item: CsAliasQualifiedName)"
  todoimpl # TODO(add: CsNamespace, CsAliasQualifiedName)

method add*(parent: var CsConditionalAccessExpression; item: CsElementBindingExpression) = # EBE
  echo "in method add*(parent: var CsConditionalAccessExpression; item: CsElementBindingExpression)"
  todoimpl # TODO(add: CsConditionalAccessExpression, CsElementBindingExpression)

method add*(parent: var CsConditionalAccessExpression; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsConditionalAccessExpression; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsConditionalAccessExpression, CsLiteralExpression)

method add*(parent: var CsConditionalAccessExpression; item: CsThisExpression) = # TE
  echo "in method add*(parent: var CsConditionalAccessExpression; item: CsThisExpression)"
  todoimpl # TODO(add: CsConditionalAccessExpression, CsThisExpression)

method add*(parent: var CsDefaultExpression; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsDefaultExpression; item: CsGenericName)"
  todoimpl # TODO(add: CsDefaultExpression, CsGenericName)

method add*(parent: var CsStruct; item: CsStruct) =
  echo "in method add*(parent: var CsStruct; item: CsStruct)"
  todoimpl # TODO(add: CsStruct, CsStruct)

method add*(parent: var CsElseClause; item: CsBreakStatement) = # BS
  echo "in method add*(parent: var CsElseClause; item: CsBreakStatement)"
  todoimpl # TODO(add: CsElseClause, CsBreakStatement)

method add*(parent: var CsInvocationExpression; item: CsAliasQualifiedName) = # AQN
  echo "in method add*(parent: var CsInvocationExpression; item: CsAliasQualifiedName)"
  todoimpl # TODO(add: CsInvocationExpression, CsAliasQualifiedName)

method add*(parent: var CsInvocationExpression; item: CsMemberBindingExpression) = # MBE
  echo "in method add*(parent: var CsInvocationExpression; item: CsMemberBindingExpression)"
  todoimpl # TODO(add: CsInvocationExpression, CsMemberBindingExpression)

method add*(parent: var CsIndexer; item: CsPointerType) = # PT
  echo "in method add*(parent: var CsIndexer; item: CsPointerType)"
  todoimpl # TODO(add: CsIndexer, CsPointerType)

method add*(parent: var CsConditionalExpression; item: CsThrowExpression) = # TE
  echo "in method add*(parent: var CsConditionalExpression; item: CsThrowExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsThrowExpression)

method add*(parent: var CsTypeParameterConstraintClause; item: CsConstructorConstraint) = # CC
  echo "in method add*(parent: var CsTypeParameterConstraintClause; item: CsConstructorConstraint)"
  todoimpl # TODO(add: CsTypeParameterConstraintClause, CsConstructorConstraint)

method add*(parent: var CsTypeConstraint; item: CsArrayType) = # AT
  echo "in method add*(parent: var CsTypeConstraint; item: CsArrayType)"
  todoimpl # TODO(add: CsTypeConstraint, CsArrayType)

method add*(parent: var CsTypeConstraint; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsTypeConstraint; item: CsPredefinedType)"
  todoimpl # TODO(add: CsTypeConstraint, CsPredefinedType)

method add*(parent: var CsRefType; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsRefType; item: CsPredefinedType)"
  todoimpl # TODO(add: CsRefType, CsPredefinedType)

method add*(parent: var CsReturnStatement; item: CsIsPatternExpression) = # IPE
  echo "in method add*(parent: var CsReturnStatement; item: CsIsPatternExpression)"
  todoimpl # TODO(add: CsReturnStatement, CsIsPatternExpression)

method add*(parent: var CsReturnStatement; item: CsRefExpression) = # RE
  echo "in method add*(parent: var CsReturnStatement; item: CsRefExpression)"
  todoimpl # TODO(add: CsReturnStatement, CsRefExpression)

method add*(parent: var CsThrowExpression; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsThrowExpression; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsThrowExpression, CsLiteralExpression)

method add*(parent: var CsForEachStatement; item: CsAnonymousMethodExpression) = # AME
  echo "in method add*(parent: var CsForEachStatement; item: CsAnonymousMethodExpression)"
  todoimpl # TODO(add: CsForEachStatement, CsAnonymousMethodExpression)

method add*(parent: var CsForEachStatement; item: CsEmptyStatement) = # ES
  echo "in method add*(parent: var CsForEachStatement; item: CsEmptyStatement)"
  todoimpl # TODO(add: CsForEachStatement, CsEmptyStatement)

method add*(parent: var CsForEachStatement; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsForEachStatement; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsForEachStatement, CsLiteralExpression)

method add*(parent: var CsDeclarationPattern; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsDeclarationPattern; item: CsPredefinedType)"
  todoimpl # TODO(add: CsDeclarationPattern, CsPredefinedType)

method add*(parent: var CsDeclarationPattern; item: CsSingleVariableDesignation) = # SVD
  echo "in method add*(parent: var CsDeclarationPattern; item: CsSingleVariableDesignation)"
  todoimpl # TODO(add: CsDeclarationPattern, CsSingleVariableDesignation)

method add*(parent: var CsIsPatternExpression; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsIsPatternExpression; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsIsPatternExpression, CsLiteralExpression)

method add*(parent: var CsGotoStatement; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsGotoStatement; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsGotoStatement, CsLiteralExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsAnonymousMethodExpression) = # AME
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsAnonymousMethodExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsAnonymousMethodExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsIsPatternExpression) = # IPE
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsIsPatternExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsIsPatternExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsTupleExpression) = # TE
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsTupleExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsTupleExpression)

method add*(parent: var CsYieldStatement; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsYieldStatement; item: CsCastExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsCastExpression)

method add*(parent: var CsYieldStatement; item: CsPrefixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsYieldStatement; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsPrefixUnaryExpression)

method add*(parent: var CsTupleElement; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsTupleElement; item: CsNullableType)"
  todoimpl # TODO(add: CsTupleElement, CsNullableType)

method add*(parent: var CsTupleElement; item: CsTupleType) = # TT
  echo "in method add*(parent: var CsTupleElement; item: CsTupleType)"
  todoimpl # TODO(add: CsTupleElement, CsTupleType)

method add*(parent: var CsAwaitExpression; item: CsObjectCreationExpression) = # OCE
  echo "in method add*(parent: var CsAwaitExpression; item: CsObjectCreationExpression)"
  todoimpl # TODO(add: CsAwaitExpression, CsObjectCreationExpression)

method add*(parent: var CsArrowExpressionClause; item: CsRefExpression) = # RE
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsRefExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsRefExpression)

method add*(parent: var CsMemberAccessExpression; item: CsElementBindingExpression) = # EBE
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsElementBindingExpression)"
  todoimpl # TODO(add: CsMemberAccessExpression, CsElementBindingExpression)

method add*(parent: var CsInitializerExpression; item: CsAnonymousObjectCreationExpression) = # AOCE
  echo "in method add*(parent: var CsInitializerExpression; item: CsAnonymousObjectCreationExpression)"
  todoimpl # TODO(add: CsInitializerExpression, CsAnonymousObjectCreationExpression)

method add*(parent: var CsParenthesizedVariableDesignation; item: CsSingleVariableDesignation) = # SVD
  echo "in method add*(parent: var CsParenthesizedVariableDesignation; item: CsSingleVariableDesignation)"
  todoimpl # TODO(add: CsParenthesizedVariableDesignation, CsSingleVariableDesignation)

method add*(parent: var CsConstantPattern; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsConstantPattern; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsConstantPattern, CsLiteralExpression)

method add*(parent: var CsPrefixUnaryExpression; item: CsThisExpression) = # TE
  echo "in method add*(parent: var CsPrefixUnaryExpression; item: CsThisExpression)"
  todoimpl # TODO(add: CsPrefixUnaryExpression, CsThisExpression)

method add*(parent: var CsLockStatement; item: CsAssignmentExpression) = # AE
  echo "in method add*(parent: var CsLockStatement; item: CsAssignmentExpression)"
  todoimpl # TODO(add: CsLockStatement, CsAssignmentExpression)

method add*(parent: var CsLockStatement; item: CsObjectCreationExpression) = # OCE
  echo "in method add*(parent: var CsLockStatement; item: CsObjectCreationExpression)"
  todoimpl # TODO(add: CsLockStatement, CsObjectCreationExpression)

method add*(parent: var CsParenthesizedExpression; item: CsAnonymousMethodExpression) = # AME
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsAnonymousMethodExpression)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsAnonymousMethodExpression)

method add*(parent: var CsParenthesizedExpression; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsConditionalAccessExpression)

method add*(parent: var CsSwitchSection; item: CsCasePatternSwitchLabel) = # CPSL
  echo "in method add*(parent: var CsSwitchSection; item: CsCasePatternSwitchLabel)"
  todoimpl # TODO(add: CsSwitchSection, CsCasePatternSwitchLabel)

method add*(parent: var CsSwitchSection; item: CsDefaultSwitchLabel) = # DSL
  echo "in method add*(parent: var CsSwitchSection; item: CsDefaultSwitchLabel)"
  todoimpl # TODO(add: CsSwitchSection, CsDefaultSwitchLabel)

method add*(parent: var CsProperty; item: CsTupleType) = # TT
  echo "in method add*(parent: var CsProperty; item: CsTupleType)"
  todoimpl # TODO(add: CsProperty, CsTupleType)

method add*(parent: var CsCastExpression; item: CsAnonymousMethodExpression) = # AME
  echo "in method add*(parent: var CsCastExpression; item: CsAnonymousMethodExpression)"
  todoimpl # TODO(add: CsCastExpression, CsAnonymousMethodExpression)

method add*(parent: var CsCastExpression; item: CsBaseExpression) = # BE
  echo "in method add*(parent: var CsCastExpression; item: CsBaseExpression)"
  todoimpl # TODO(add: CsCastExpression, CsBaseExpression)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsNameEquals) = # NE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsNameEquals)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsNameEquals)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsObjectCreationExpression) = # OCE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsObjectCreationExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsObjectCreationExpression)

method add*(parent: var CsObjectCreationExpression; item: CsAliasQualifiedName) = # AQN
  echo "in method add*(parent: var CsObjectCreationExpression; item: CsAliasQualifiedName)"
  todoimpl # TODO(add: CsObjectCreationExpression, CsAliasQualifiedName)

method add*(parent: var CsCatchFilterClause; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsCatchFilterClause; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsCatchFilterClause, CsLiteralExpression)

method add*(parent: var CsMethod; item: CsAliasQualifiedName) = # AQN
  echo "in method add*(parent: var CsMethod; item: CsAliasQualifiedName)"
  todoimpl # TODO(add: CsMethod, CsAliasQualifiedName)

method add*(parent: var CsDefaultExpression; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsDefaultExpression; item: CsNullableType)"
  todoimpl # TODO(add: CsDefaultExpression, CsNullableType)

method add*(parent: var CsStruct; item: CsIndexer) =
  echo "in method add*(parent: var CsStruct; item: CsIndexer)"
  todoimpl # TODO(add: CsStruct, CsIndexer)

method add*(parent: var CsForStatement; item: CsIsPatternExpression) = # IPE
  echo "in method add*(parent: var CsForStatement; item: CsIsPatternExpression)"
  todoimpl # TODO(add: CsForStatement, CsIsPatternExpression)

method add*(parent: var CsElseClause; item: CsEmptyStatement) = # ES
  echo "in method add*(parent: var CsElseClause; item: CsEmptyStatement)"
  todoimpl # TODO(add: CsElseClause, CsEmptyStatement)

method add*(parent: var CsSimpleLambdaExpression; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsAwaitExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsConditionalAccessExpression)

method add*(parent: var CsStackAllocArrayCreationExpression; item: CsArrayType) = # AT
  echo "in method add*(parent: var CsStackAllocArrayCreationExpression; item: CsArrayType)"
  todoimpl # TODO(add: CsStackAllocArrayCreationExpression, CsArrayType)

method add*(parent: var CsStackAllocArrayCreationExpression; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsStackAllocArrayCreationExpression; item: CsPredefinedType)"
  todoimpl # TODO(add: CsStackAllocArrayCreationExpression, CsPredefinedType)

method add*(parent: var CsIncompleteMember; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsIncompleteMember; item: CsPredefinedType)"
  todoimpl # TODO(add: CsIncompleteMember, CsPredefinedType)

method add*(parent: var CsIncompleteMember; item: CsTupleType) = # TT
  echo "in method add*(parent: var CsIncompleteMember; item: CsTupleType)"
  todoimpl # TODO(add: CsIncompleteMember, CsTupleType)

method add*(parent: var CsArgument; item: CsOmittedArraySizeExpression) = # OASE
  echo "in method add*(parent: var CsArgument; item: CsOmittedArraySizeExpression)"
  todoimpl # TODO(add: CsArgument, CsOmittedArraySizeExpression)

method add*(parent: var CsRefType; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsRefType; item: CsGenericName)"
  todoimpl # TODO(add: CsRefType, CsGenericName)

method add*(parent: var CsReturnStatement; item: CsAnonymousMethodExpression) = # AME
  echo "in method add*(parent: var CsReturnStatement; item: CsAnonymousMethodExpression)"
  todoimpl # TODO(add: CsReturnStatement, CsAnonymousMethodExpression)

method add*(parent: var CsReturnStatement; item: CsTupleExpression) = # TE
  echo "in method add*(parent: var CsReturnStatement; item: CsTupleExpression)"
  todoimpl # TODO(add: CsReturnStatement, CsTupleExpression)

method add*(parent: var CsThrowExpression; item: CsObjectCreationExpression) = # OCE
  echo "in method add*(parent: var CsThrowExpression; item: CsObjectCreationExpression)"
  todoimpl # TODO(add: CsThrowExpression, CsObjectCreationExpression)

method add*(parent: var CsDelegate; item: CsArrayType) = # AT
  echo "in method add*(parent: var CsDelegate; item: CsArrayType)"
  todoimpl # TODO(add: CsDelegate, CsArrayType)

method add*(parent: var CsDelegate; item: CsPointerType) = # PT
  echo "in method add*(parent: var CsDelegate; item: CsPointerType)"
  todoimpl # TODO(add: CsDelegate, CsPointerType)

method add*(parent: var CsDelegate; item: CsRefType) = # RT
  echo "in method add*(parent: var CsDelegate; item: CsRefType)"
  todoimpl # TODO(add: CsDelegate, CsRefType)

method add*(parent: var CsDelegate; item: CsTypeParameterConstraintClause) = # TPCC
  echo "in method add*(parent: var CsDelegate; item: CsTypeParameterConstraintClause)"
  todoimpl # TODO(add: CsDelegate, CsTypeParameterConstraintClause)

method add*(parent: var CsDeclarationPattern; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsDeclarationPattern; item: CsGenericName)"
  todoimpl # TODO(add: CsDeclarationPattern, CsGenericName)

method add*(parent: var CsRefExpression; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsRefExpression; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsRefExpression, CsLiteralExpression)

method add*(parent: var CsCaseSwitchLabel; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsCaseSwitchLabel; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsCaseSwitchLabel, CsLiteralExpression)

method add*(parent: var CsSwitchSection; item: CsBreakStatement) = # BS
  echo "in method add*(parent: var CsSwitchSection; item: CsBreakStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsBreakStatement)

method add*(parent: var CsInterpolationAlignmentClause; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsInterpolationAlignmentClause; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsInterpolationAlignmentClause, CsLiteralExpression)

method add*(parent: var CsElementBindingExpression; item: CsBracketedArgumentList) = # BAL
  echo "in method add*(parent: var CsElementBindingExpression; item: CsBracketedArgumentList)"
  todoimpl # TODO(add: CsElementBindingExpression, CsBracketedArgumentList)

method add*(parent: var CsRefExpression; item: CsConditionalExpression) = # CE
  echo "in method add*(parent: var CsRefExpression; item: CsConditionalExpression)"
  todoimpl # TODO(add: CsRefExpression, CsConditionalExpression)

method add*(parent: var CsAliasQualifiedName; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsAliasQualifiedName; item: CsGenericName)"
  todoimpl # TODO(add: CsAliasQualifiedName, CsGenericName)

method add*(parent: var CsConstantPattern; item: CsPrefixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsConstantPattern; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsConstantPattern, CsPrefixUnaryExpression)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsLiteralExpression)

method add*(parent: var CsCatchFilterClause; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsCatchFilterClause; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsCatchFilterClause, CsAwaitExpression)

method add*(parent: var CsCatchFilterClause; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsCatchFilterClause; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsCatchFilterClause, CsBinaryExpression)

method add*(parent: var CsInterpolationAlignmentClause; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsInterpolationAlignmentClause; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsInterpolationAlignmentClause, CsInvocationExpression)

method add*(parent: var CsInterpolationAlignmentClause; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsInterpolationAlignmentClause; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsInterpolationAlignmentClause, CsMemberAccessExpression)

method add*(parent: var CsCaseSwitchLabel; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsCaseSwitchLabel; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsCaseSwitchLabel, CsMemberAccessExpression)

method add*(parent: var CsCheckedExpression; item: CsAnonymousMethodExpression) = # AME
  echo "in method add*(parent: var CsCheckedExpression; item: CsAnonymousMethodExpression)"
  todoimpl # TODO(add: CsCheckedExpression, CsAnonymousMethodExpression)

method add*(parent: var CsRefExpression; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsRefExpression; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsRefExpression, CsMemberAccessExpression)

method add*(parent: var CsConstantPattern; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsConstantPattern; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsConstantPattern, CsBinaryExpression)

method add*(parent: var CsSwitchSection; item: CsExpressionStatement) = # ES
  echo "in method add*(parent: var CsSwitchSection; item: CsExpressionStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsExpressionStatement)

method add*(parent: var CsSwitchSection; item: CsGotoStatement) = # GS
  echo "in method add*(parent: var CsSwitchSection; item: CsGotoStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsGotoStatement)

method add*(parent: var CsSwitchSection; item: CsLabeledStatement) = # LS
  echo "in method add*(parent: var CsSwitchSection; item: CsLabeledStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsLabeledStatement)

method add*(parent: var CsSwitchSection; item: CsReturnStatement) = # RS
  echo "in method add*(parent: var CsSwitchSection; item: CsReturnStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsReturnStatement)

method add*(parent: var CsSwitchSection; item: CsThrowStatement) = # TS
  echo "in method add*(parent: var CsSwitchSection; item: CsThrowStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsThrowStatement)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsAnonymousMethodExpression) = # AME
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsAnonymousMethodExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsAnonymousMethodExpression)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsInvocationExpression)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsSimpleLambdaExpression) = # SLE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsSimpleLambdaExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsSimpleLambdaExpression)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsTupleExpression) = # TE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsTupleExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsTupleExpression)

method add*(parent: var CsSwitchSection; item: CsLocalDeclarationStatement) = # LDS
  echo "in method add*(parent: var CsSwitchSection; item: CsLocalDeclarationStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsLocalDeclarationStatement)

method add*(parent: var CsConditionalExpression; item: CsRefExpression) = # RE
  echo "in method add*(parent: var CsConditionalExpression; item: CsRefExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsRefExpression)

method add*(parent: var CsLabeledStatement; item: CsBreakStatement) = # BS
  echo "in method add*(parent: var CsLabeledStatement; item: CsBreakStatement)"
  todoimpl # TODO(add: CsLabeledStatement, CsBreakStatement)

method add*(parent: var CsInterpolation; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsInterpolation; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsInterpolation, CsConditionalAccessExpression)

method add*(parent: var CsIsPatternExpression; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsIsPatternExpression; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsIsPatternExpression, CsElementAccessExpression)

method add*(parent: var CsRefExpression; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsRefExpression; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsRefExpression, CsElementAccessExpression)

method add*(parent: var CsTupleElement; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsTupleElement; item: CsGenericName)"
  todoimpl # TODO(add: CsTupleElement, CsGenericName)

method add*(parent: var CsMemberAccessExpression; item: CsMemberBindingExpression) = # MBE
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsMemberBindingExpression)"
  todoimpl # TODO(add: CsMemberAccessExpression, CsMemberBindingExpression)

method add*(parent: var CsLockStatement; item: CsExpressionStatement) = # ES
  echo "in method add*(parent: var CsLockStatement; item: CsExpressionStatement)"
  todoimpl # TODO(add: CsLockStatement, CsExpressionStatement)

method add*(parent: var CsQueryBody; item: CsLetClause) = # LC
  echo "in method add*(parent: var CsQueryBody; item: CsLetClause)"
  todoimpl # TODO(add: CsQueryBody, CsLetClause)

method add*(parent: var CsConditionalAccessExpression; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsConditionalAccessExpression; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsConditionalAccessExpression, CsElementAccessExpression)

method add*(parent: var CsRefExpression; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsRefExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsRefExpression, CsInvocationExpression)

method add*(parent: var CsTupleElement; item: CsArrayType) = # AT
  echo "in method add*(parent: var CsTupleElement; item: CsArrayType)"
  todoimpl # TODO(add: CsTupleElement, CsArrayType)

method add*(parent: var CsPrefixUnaryExpression; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsPrefixUnaryExpression; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsPrefixUnaryExpression, CsConditionalAccessExpression)

method add*(parent: var CsCasePatternSwitchLabel; item: CsDeclarationPattern) = # DP
  echo "in method add*(parent: var CsCasePatternSwitchLabel; item: CsDeclarationPattern)"
  todoimpl # TODO(add: CsCasePatternSwitchLabel, CsDeclarationPattern)

method add*(parent: var CsSwitchSection; item: CsIfStatement) = # IS
  echo "in method add*(parent: var CsSwitchSection; item: CsIfStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsIfStatement)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsMemberAccessExpression)

method add*(parent: var CsAssignmentExpression; item: CsAnonymousObjectCreationExpression) = # AOCE
  echo "in method add*(parent: var CsAssignmentExpression; item: CsAnonymousObjectCreationExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsAnonymousObjectCreationExpression)

method add*(parent: var CsUnaryPattern; item: CsConstantPattern) = # CP
  echo "in method add*(parent: var CsUnaryPattern; item: CsConstantPattern)"
  todoimpl # TODO(add: CsUnaryPattern, CsConstantPattern)

method add*(parent: var CsIncompleteMember; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsIncompleteMember; item: CsGenericName)"
  todoimpl # TODO(add: CsIncompleteMember, CsGenericName)

method add*(parent: var CsCheckedExpression; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsCheckedExpression; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsCheckedExpression, CsParenthesizedExpression)

method add*(parent: var CsForEachStatement; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsForEachStatement; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsForEachStatement, CsAwaitExpression)

method add*(parent: var CsForEachStatement; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsForEachStatement; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsForEachStatement, CsElementAccessExpression)

method add*(parent: var CsArrayRankSpecifier; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsArrayRankSpecifier; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsArrayRankSpecifier, CsElementAccessExpression)

method add*(parent: var CsYieldStatement; item: CsTupleExpression) = # TE
  echo "in method add*(parent: var CsYieldStatement; item: CsTupleExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsTupleExpression)

method add*(parent: var CsSwitchExpression; item: CsSwitchExpressionArm) = # SEA
  echo "in method add*(parent: var CsSwitchExpression; item: CsSwitchExpressionArm)"
  todoimpl # TODO(add: CsSwitchExpression, CsSwitchExpressionArm)

method add*(parent: var CsParenthesizedVariableDesignation; item: CsDiscardDesignation) = # DD
  echo "in method add*(parent: var CsParenthesizedVariableDesignation; item: CsDiscardDesignation)"
  todoimpl # TODO(add: CsParenthesizedVariableDesignation, CsDiscardDesignation)

method add*(parent: var CsSwitchSection; item: CsForEachStatement) = # FES
  echo "in method add*(parent: var CsSwitchSection; item: CsForEachStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsForEachStatement)

method add*(parent: var CsSwitchSection; item: CsSwitchStatement) = # SS
  echo "in method add*(parent: var CsSwitchSection; item: CsSwitchStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsSwitchStatement)

method add*(parent: var CsAssignmentExpression; item: CsQueryExpression) = # QE
  echo "in method add*(parent: var CsAssignmentExpression; item: CsQueryExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsQueryExpression)

method add*(parent: var CsMemberBindingExpression; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsMemberBindingExpression; item: CsGenericName)"
  todoimpl # TODO(add: CsMemberBindingExpression, CsGenericName)

method add*(parent: var CsStruct; item: CsTypeParameterConstraintClause) = # TPCC
  echo "in method add*(parent: var CsStruct; item: CsTypeParameterConstraintClause)"
  todoimpl # TODO(add: CsStruct, CsTypeParameterConstraintClause)

method add*(parent: var CsIfStatement; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsIfStatement; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsIfStatement, CsAwaitExpression)

method add*(parent: var CsElseClause; item: CsContinueStatement) = # CS
  echo "in method add*(parent: var CsElseClause; item: CsContinueStatement)"
  todoimpl # TODO(add: CsElseClause, CsContinueStatement)

method add*(parent: var CsElseClause; item: CsYieldStatement) = # YS
  echo "in method add*(parent: var CsElseClause; item: CsYieldStatement)"
  todoimpl # TODO(add: CsElseClause, CsYieldStatement)

method add*(parent: var CsForEachStatement; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsForEachStatement; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsForEachStatement, CsBinaryExpression)

method add*(parent: var CsForEachStatement; item: CsForEachStatement) = # FES
  echo "in method add*(parent: var CsForEachStatement; item: CsForEachStatement)"
  todoimpl # TODO(add: CsForEachStatement, CsForEachStatement)

method add*(parent: var CsRangeExpression; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsRangeExpression; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsRangeExpression, CsElementAccessExpression)

method add*(parent: var CsSwitchStatement; item: CsThisExpression) = # TE
  echo "in method add*(parent: var CsSwitchStatement; item: CsThisExpression)"
  todoimpl # TODO(add: CsSwitchStatement, CsThisExpression)

method add*(parent: var CsForStatement; item: CsWhileStatement) = # WS
  echo "in method add*(parent: var CsForStatement; item: CsWhileStatement)"
  todoimpl # TODO(add: CsForStatement, CsWhileStatement)

method add*(parent: var CsInvocationExpression; item: CsBaseExpression) = # BE
  echo "in method add*(parent: var CsInvocationExpression; item: CsBaseExpression)"
  todoimpl # TODO(add: CsInvocationExpression, CsBaseExpression)

method add*(parent: var CsWhileStatement; item: CsYieldStatement) = # YS
  echo "in method add*(parent: var CsWhileStatement; item: CsYieldStatement)"
  todoimpl # TODO(add: CsWhileStatement, CsYieldStatement)

method add*(parent: var CsDeclarationPattern; item: CsDiscardDesignation) = # DD
  echo "in method add*(parent: var CsDeclarationPattern; item: CsDiscardDesignation)"
  todoimpl # TODO(add: CsDeclarationPattern, CsDiscardDesignation)

method add*(parent: var CsImplicitObjectCreationExpression; item: CsArgumentList) = # AL
  echo "in method add*(parent: var CsImplicitObjectCreationExpression; item: CsArgumentList)"
  todoimpl # TODO(add: CsImplicitObjectCreationExpression, CsArgumentList)

method add*(parent: var CsSwitchExpressionArm; item: CsConstantPattern) = # CP
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsConstantPattern)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsConstantPattern)

method add*(parent: var CsLockStatement; item: CsReturnStatement) = # RS
  echo "in method add*(parent: var CsLockStatement; item: CsReturnStatement)"
  todoimpl # TODO(add: CsLockStatement, CsReturnStatement)

method add*(parent: var CsBinaryExpression; item: CsRangeExpression) = # RE
  echo "in method add*(parent: var CsBinaryExpression; item: CsRangeExpression)"
  todoimpl # TODO(add: CsBinaryExpression, CsRangeExpression)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsAnonymousObjectCreationExpression) = # AOCE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsAnonymousObjectCreationExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsAnonymousObjectCreationExpression)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsImplicitArrayCreationExpression)

method add*(parent: var CsIfStatement; item: CsLockStatement) = # LS
  echo "in method add*(parent: var CsIfStatement; item: CsLockStatement)"
  todoimpl # TODO(add: CsIfStatement, CsLockStatement)

method add*(parent: var CsConditionalExpression; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsConditionalExpression; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsPostfixUnaryExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsDefaultExpression)

method add*(parent: var CsForEachStatement; item: CsQueryExpression) = # QE
  echo "in method add*(parent: var CsForEachStatement; item: CsQueryExpression)"
  todoimpl # TODO(add: CsForEachStatement, CsQueryExpression)

method add*(parent: var CsRangeExpression; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsRangeExpression; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsRangeExpression, CsLiteralExpression)

method add*(parent: var CsYieldStatement; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsYieldStatement; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsElementAccessExpression)

method add*(parent: var CsArrowExpressionClause; item: CsTupleExpression) = # TE
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsTupleExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsTupleExpression)

method add*(parent: var CsArgumentList; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsArgumentList; item: CsGenericName)"
  todoimpl # TODO(add: CsArgumentList, CsGenericName)

method add*(parent: var CsCastExpression; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsCastExpression; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsCastExpression, CsCheckedExpression)

method add*(parent: var CsCaseSwitchLabel; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsCaseSwitchLabel; item: CsCastExpression)"
  todoimpl # TODO(add: CsCaseSwitchLabel, CsCastExpression)

method add*(parent: var CsThrowExpression; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsThrowExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsThrowExpression, CsInvocationExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsQueryExpression) = # QE
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsQueryExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsQueryExpression)

method add*(parent: var CsSwitchSection; item: CsContinueStatement) = # CS
  echo "in method add*(parent: var CsSwitchSection; item: CsContinueStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsContinueStatement)

method add*(parent: var CsProperty; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsProperty; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsProperty, CsInvocationExpression)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsBinaryExpression)

method add*(parent: var CsInterface; item: CsInterface) =
  echo "in method add*(parent: var CsInterface; item: CsInterface)"
  todoimpl # TODO(add: CsInterface, CsInterface)

method add*(parent: var CsWhileStatement; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsWhileStatement; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsWhileStatement, CsAwaitExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsIsPatternExpression) = # IPE
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsIsPatternExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsIsPatternExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsTupleExpression) = # TE
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsTupleExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsTupleExpression)

method add*(parent: var CsLetClause; item: CsQueryExpression) = # QE
  echo "in method add*(parent: var CsLetClause; item: CsQueryExpression)"
  todoimpl # TODO(add: CsLetClause, CsQueryExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsParenthesizedExpression)

method add*(parent: var CsYieldStatement; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsYieldStatement; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsImplicitArrayCreationExpression)

method add*(parent: var CsConstantPattern; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsConstantPattern; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsConstantPattern, CsMemberAccessExpression)

method add*(parent: var CsCasePatternSwitchLabel; item: CsConstantPattern) = # CP
  echo "in method add*(parent: var CsCasePatternSwitchLabel; item: CsConstantPattern)"
  todoimpl # TODO(add: CsCasePatternSwitchLabel, CsConstantPattern)

method add*(parent: var CsBinaryExpression; item: CsBaseExpression) = # BE
  echo "in method add*(parent: var CsBinaryExpression; item: CsBaseExpression)"
  todoimpl # TODO(add: CsBinaryExpression, CsBaseExpression)

method add*(parent: var CsNullableType; item: CsTupleType) = # TT
  echo "in method add*(parent: var CsNullableType; item: CsTupleType)"
  todoimpl # TODO(add: CsNullableType, CsTupleType)

method add*(parent: var CsIfStatement; item: CsSwitchStatement) = # SS
  echo "in method add*(parent: var CsIfStatement; item: CsSwitchStatement)"
  todoimpl # TODO(add: CsIfStatement, CsSwitchStatement)

method add*(parent: var CsForStatement; item: CsSwitchStatement) = # SS
  echo "in method add*(parent: var CsForStatement; item: CsSwitchStatement)"
  todoimpl # TODO(add: CsForStatement, CsSwitchStatement)

method add*(parent: var CsElseClause; item: CsSwitchStatement) = # SS
  echo "in method add*(parent: var CsElseClause; item: CsSwitchStatement)"
  todoimpl # TODO(add: CsElseClause, CsSwitchStatement)

method add*(parent: var CsForEachStatement; item: CsSwitchStatement) = # SS
  echo "in method add*(parent: var CsForEachStatement; item: CsSwitchStatement)"
  todoimpl # TODO(add: CsForEachStatement, CsSwitchStatement)

method add*(parent: var CsInterface; item: CsClass) =
  echo "in method add*(parent: var CsInterface; item: CsClass)"
  todoimpl # TODO(add: CsInterface, CsClass)

method add*(parent: var CsPointerType; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsPointerType; item: CsGenericName)"
  todoimpl # TODO(add: CsPointerType, CsGenericName)

method add*(parent: var CsRefExpression; item: CsThisExpression) = # TE
  echo "in method add*(parent: var CsRefExpression; item: CsThisExpression)"
  todoimpl # TODO(add: CsRefExpression, CsThisExpression)

method add*(parent: var CsCastExpression; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsCastExpression; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsCastExpression, CsDefaultExpression)

method add*(parent: var CsSimpleBaseType; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsSimpleBaseType; item: CsNullableType)"
  todoimpl # TODO(add: CsSimpleBaseType, CsNullableType)

method add*(parent: var CsSimpleBaseType; item: CsPointerType) = # PT
  echo "in method add*(parent: var CsSimpleBaseType; item: CsPointerType)"
  todoimpl # TODO(add: CsSimpleBaseType, CsPointerType)

method add*(parent: var CsInterface; item: CsConstructor) =
  echo "in method add*(parent: var CsInterface; item: CsConstructor)"
  todoimpl # TODO(add: CsInterface, CsConstructor)

method add*(parent: var CsInterface; item: CsDelegate) =
  echo "in method add*(parent: var CsInterface; item: CsDelegate)"
  todoimpl # TODO(add: CsInterface, CsDelegate)

method add*(parent: var CsInterface; item: CsEnum) =
  echo "in method add*(parent: var CsInterface; item: CsEnum)"
  todoimpl # TODO(add: CsInterface, CsEnum)

method add*(parent: var CsInterface; item: CsStruct) =
  echo "in method add*(parent: var CsInterface; item: CsStruct)"
  todoimpl # TODO(add: CsInterface, CsStruct)

method add*(parent: var CsLockStatement; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsLockStatement; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsLockStatement, CsInvocationExpression)

method add*(parent: var CsCatchFilterClause; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsCatchFilterClause; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsCatchFilterClause, CsInvocationExpression)

method add*(parent: var CsSwitchSection; item: CsTryStatement) = # TS
  echo "in method add*(parent: var CsSwitchSection; item: CsTryStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsTryStatement)

method add*(parent: var CsStruct; item: CsClass) =
  echo "in method add*(parent: var CsStruct; item: CsClass)"
  todoimpl # TODO(add: CsStruct, CsClass)

method add*(parent: var CsForEachStatement; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsForEachStatement; item: CsNullableType)"
  todoimpl # TODO(add: CsForEachStatement, CsNullableType)

method add*(parent: var CsInterpolation; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsInterpolation; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsInterpolation, CsAwaitExpression)

method add*(parent: var CsIsPatternExpression; item: CsRecursivePattern) = # RP
  echo "in method add*(parent: var CsIsPatternExpression; item: CsRecursivePattern)"
  todoimpl # TODO(add: CsIsPatternExpression, CsRecursivePattern)

method add*(parent: var CsLetClause; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsLetClause; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsLetClause, CsInvocationExpression)

method add*(parent: var CsEqualsValueClause; item: CsRefValueExpression) = # RVE
  echo "in method add*(parent: var CsEqualsValueClause; item: CsRefValueExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsRefValueExpression)

method add*(parent: var CsRefExpression; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsRefExpression; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsRefExpression, CsBinaryExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsDefaultExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsBinaryPattern) = # BP
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsBinaryPattern)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsBinaryPattern)

method add*(parent: var CsTypeArgumentList; item: CsAliasQualifiedName) = # AQN
  echo "in method add*(parent: var CsTypeArgumentList; item: CsAliasQualifiedName)"
  todoimpl # TODO(add: CsTypeArgumentList, CsAliasQualifiedName)

method add*(parent: var CsYieldStatement; item: CsConditionalExpression) = # CE
  echo "in method add*(parent: var CsYieldStatement; item: CsConditionalExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsConditionalExpression)

method add*(parent: var CsYieldStatement; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsYieldStatement; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsDefaultExpression)

method add*(parent: var CsYieldStatement; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsYieldStatement; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsPostfixUnaryExpression)

method add*(parent: var CsYieldStatement; item: CsTypeOfExpression) = # TOE
  echo "in method add*(parent: var CsYieldStatement; item: CsTypeOfExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsTypeOfExpression)

method add*(parent: var CsSwitchExpression; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsSwitchExpression; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsSwitchExpression, CsMemberAccessExpression)

method add*(parent: var CsElementAccessExpression; item: CsArrayCreationExpression) = # ACE
  echo "in method add*(parent: var CsElementAccessExpression; item: CsArrayCreationExpression)"
  todoimpl # TODO(add: CsElementAccessExpression, CsArrayCreationExpression)

method add*(parent: var CsDoStatement; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsDoStatement; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsDoStatement, CsMemberAccessExpression)

method add*(parent: var CsAwaitExpression; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsAwaitExpression; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsAwaitExpression, CsAwaitExpression)

method add*(parent: var CsAwaitExpression; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsAwaitExpression; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsAwaitExpression, CsCheckedExpression)

method add*(parent: var CsAwaitExpression; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsAwaitExpression; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsAwaitExpression, CsConditionalAccessExpression)

method add*(parent: var CsAwaitExpression; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsAwaitExpression; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsAwaitExpression, CsPostfixUnaryExpression)

method add*(parent: var CsArrowExpressionClause; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsCheckedExpression)

method add*(parent: var CsMemberAccessExpression; item: CsRefValueExpression) = # RVE
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsRefValueExpression)"
  todoimpl # TODO(add: CsMemberAccessExpression, CsRefValueExpression)

method add*(parent: var CsMemberAccessExpression; item: CsTupleExpression) = # TE
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsTupleExpression)"
  todoimpl # TODO(add: CsMemberAccessExpression, CsTupleExpression)

method add*(parent: var CsInitializerExpression; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsInitializerExpression; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsInitializerExpression, CsConditionalAccessExpression)

method add*(parent: var CsInitializerExpression; item: CsThrowExpression) = # TE
  echo "in method add*(parent: var CsInitializerExpression; item: CsThrowExpression)"
  todoimpl # TODO(add: CsInitializerExpression, CsThrowExpression)

method add*(parent: var CsPrefixUnaryExpression; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsPrefixUnaryExpression; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsPrefixUnaryExpression, CsAwaitExpression)

method add*(parent: var CsLabeledStatement; item: CsGotoStatement) = # GS
  echo "in method add*(parent: var CsLabeledStatement; item: CsGotoStatement)"
  todoimpl # TODO(add: CsLabeledStatement, CsGotoStatement)

method add*(parent: var CsLockStatement; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsLockStatement; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsLockStatement, CsElementAccessExpression)

method add*(parent: var CsSwitchSection; item: CsForStatement) = # FS
  echo "in method add*(parent: var CsSwitchSection; item: CsForStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsForStatement)

method add*(parent: var CsSwitchSection; item: CsUsingStatement) = # US
  echo "in method add*(parent: var CsSwitchSection; item: CsUsingStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsUsingStatement)

method add*(parent: var CsSwitchSection; item: CsYieldStatement) = # YS
  echo "in method add*(parent: var CsSwitchSection; item: CsYieldStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsYieldStatement)

method add*(parent: var CsCastExpression; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsCastExpression; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsCastExpression, CsImplicitArrayCreationExpression)

method add*(parent: var CsBinaryExpression; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsBinaryExpression; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsBinaryExpression, CsImplicitArrayCreationExpression)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsCastExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsCastExpression)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsDefaultExpression)

method add*(parent: var CsInterface; item: CsIncompleteMember) = # IM
  echo "in method add*(parent: var CsInterface; item: CsIncompleteMember)"
  todoimpl # TODO(add: CsInterface, CsIncompleteMember)

method add*(parent: var CsCatchFilterClause; item: CsPrefixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsCatchFilterClause; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsCatchFilterClause, CsPrefixUnaryExpression)

method add*(parent: var CsPostfixUnaryExpression; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsPostfixUnaryExpression; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsPostfixUnaryExpression, CsDefaultExpression)

method add*(parent: var CsParameter; item: CsAliasQualifiedName) = # AQN
  echo "in method add*(parent: var CsParameter; item: CsAliasQualifiedName)"
  todoimpl # TODO(add: CsParameter, CsAliasQualifiedName)

method add*(parent: var CsAssignmentExpression; item: CsSwitchExpression) = # SE
  echo "in method add*(parent: var CsAssignmentExpression; item: CsSwitchExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsSwitchExpression)

method add*(parent: var CsUsingStatement; item: CsFixedStatement) = # FS
  echo "in method add*(parent: var CsUsingStatement; item: CsFixedStatement)"
  todoimpl # TODO(add: CsUsingStatement, CsFixedStatement)

method add*(parent: var CsUsingStatement; item: CsTryStatement) = # TS
  echo "in method add*(parent: var CsUsingStatement; item: CsTryStatement)"
  todoimpl # TODO(add: CsUsingStatement, CsTryStatement)

method add*(parent: var CsForStatement; item: CsCheckedStatement) = # CS
  echo "in method add*(parent: var CsForStatement; item: CsCheckedStatement)"
  todoimpl # TODO(add: CsForStatement, CsCheckedStatement)

method add*(parent: var CsForStatement; item: CsLockStatement) = # LS
  echo "in method add*(parent: var CsForStatement; item: CsLockStatement)"
  todoimpl # TODO(add: CsForStatement, CsLockStatement)

method add*(parent: var CsIndexer; item: CsArrayType) = # AT
  echo "in method add*(parent: var CsIndexer; item: CsArrayType)"
  todoimpl # TODO(add: CsIndexer, CsArrayType)

method add*(parent: var CsCaseSwitchLabel; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsCaseSwitchLabel; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsCaseSwitchLabel, CsInvocationExpression)

method add*(parent: var CsCaseSwitchLabel; item: CsPrefixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsCaseSwitchLabel; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsCaseSwitchLabel, CsPrefixUnaryExpression)

method add*(parent: var CsConditionalExpression; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsConditionalExpression; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsCheckedExpression)

method add*(parent: var CsConditionalExpression; item: CsSimpleLambdaExpression) = # SLE
  echo "in method add*(parent: var CsConditionalExpression; item: CsSimpleLambdaExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsSimpleLambdaExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsImplicitObjectCreationExpression) = # IOCE
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsImplicitObjectCreationExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsImplicitObjectCreationExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsSwitchExpression) = # SE
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsSwitchExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsSwitchExpression)

method add*(parent: var CsIncompleteMember; item: CsArrayType) = # AT
  echo "in method add*(parent: var CsIncompleteMember; item: CsArrayType)"
  todoimpl # TODO(add: CsIncompleteMember, CsArrayType)

method add*(parent: var CsIncompleteMember; item: CsPointerType) = # PT
  echo "in method add*(parent: var CsIncompleteMember; item: CsPointerType)"
  todoimpl # TODO(add: CsIncompleteMember, CsPointerType)

method add*(parent: var CsArgument; item: CsRefValueExpression) = # RVE
  echo "in method add*(parent: var CsArgument; item: CsRefValueExpression)"
  todoimpl # TODO(add: CsArgument, CsRefValueExpression)

method add*(parent: var CsArgument; item: CsWithExpression) = # WE
  echo "in method add*(parent: var CsArgument; item: CsWithExpression)"
  todoimpl # TODO(add: CsArgument, CsWithExpression)

method add*(parent: var CsDelegate; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsDelegate; item: CsNullableType)"
  todoimpl # TODO(add: CsDelegate, CsNullableType)

method add*(parent: var CsForEachStatement; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsForEachStatement; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsForEachStatement, CsConditionalAccessExpression)

method add*(parent: var CsForEachStatement; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsForEachStatement; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsForEachStatement, CsParenthesizedExpression)

method add*(parent: var CsForEachStatement; item: CsReturnStatement) = # RS
  echo "in method add*(parent: var CsForEachStatement; item: CsReturnStatement)"
  todoimpl # TODO(add: CsForEachStatement, CsReturnStatement)

method add*(parent: var CsForEachStatement; item: CsUsingStatement) = # US
  echo "in method add*(parent: var CsForEachStatement; item: CsUsingStatement)"
  todoimpl # TODO(add: CsForEachStatement, CsUsingStatement)

method add*(parent: var CsDeclarationPattern; item: CsArrayType) = # AT
  echo "in method add*(parent: var CsDeclarationPattern; item: CsArrayType)"
  todoimpl # TODO(add: CsDeclarationPattern, CsArrayType)

method add*(parent: var CsDeclarationExpression; item: CsArrayType) = # AT
  echo "in method add*(parent: var CsDeclarationExpression; item: CsArrayType)"
  todoimpl # TODO(add: CsDeclarationExpression, CsArrayType)

method add*(parent: var CsSwitchExpressionArm; item: CsDeclarationPattern) = # DP
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsDeclarationPattern)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsDeclarationPattern)

method add*(parent: var CsSwitchExpressionArm; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsLiteralExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsMemberAccessExpression)

method add*(parent: var CsPrefixUnaryExpression; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsPrefixUnaryExpression; item: CsPredefinedType)"
  todoimpl # TODO(add: CsPrefixUnaryExpression, CsPredefinedType)

method add*(parent: var CsCasePatternSwitchLabel; item: CsWhenClause) = # WC
  echo "in method add*(parent: var CsCasePatternSwitchLabel; item: CsWhenClause)"
  todoimpl # TODO(add: CsCasePatternSwitchLabel, CsWhenClause)

method add*(parent: var CsSwitchSection; item: CsWhileStatement) = # WS
  echo "in method add*(parent: var CsSwitchSection; item: CsWhileStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsWhileStatement)

method add*(parent: var CsCaseSwitchLabel; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsCaseSwitchLabel; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsCaseSwitchLabel, CsBinaryExpression)

method add*(parent: var CsCaseSwitchLabel; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsCaseSwitchLabel; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsCaseSwitchLabel, CsParenthesizedExpression)

method add*(parent: var CsRangeExpression; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsRangeExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsRangeExpression, CsInvocationExpression)

method add*(parent: var CsOmittedTypeArgument; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsOmittedTypeArgument; item: CsGenericName)"
  todoimpl # TODO(add: CsOmittedTypeArgument, CsGenericName)

method add*(parent: var CsGotoStatement; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsGotoStatement; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsGotoStatement, CsMemberAccessExpression)

method add*(parent: var CsEqualsValueClause; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsEqualsValueClause; item: CsGenericName)"
  todoimpl # TODO(add: CsEqualsValueClause, CsGenericName)

method add*(parent: var CsEqualsValueClause; item: CsRefTypeExpression) = # RTE
  echo "in method add*(parent: var CsEqualsValueClause; item: CsRefTypeExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsRefTypeExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsInvocationExpression)

method add*(parent: var CsArrowExpressionClause; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsDefaultExpression)

method add*(parent: var CsLabeledStatement; item: CsExpressionStatement) = # ES
  echo "in method add*(parent: var CsLabeledStatement; item: CsExpressionStatement)"
  todoimpl # TODO(add: CsLabeledStatement, CsExpressionStatement)

method add*(parent: var CsSwitchStatement; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsSwitchStatement; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsSwitchStatement, CsDefaultExpression)

method add*(parent: var CsCastExpression; item: CsTupleExpression) = # TE
  echo "in method add*(parent: var CsCastExpression; item: CsTupleExpression)"
  todoimpl # TODO(add: CsCastExpression, CsTupleExpression)

method add*(parent: var CsNamespace; item: CsIndexer) =
  echo "in method add*(parent: var CsNamespace; item: CsIndexer)"
  todoimpl # TODO(add: CsNamespace, CsIndexer)

method add*(parent: var CsElseClause; item: CsGotoStatement) = # GS
  echo "in method add*(parent: var CsElseClause; item: CsGotoStatement)"
  todoimpl # TODO(add: CsElseClause, CsGotoStatement)

method add*(parent: var CsConditionalExpression; item: CsStackAllocArrayCreationExpression) = # SAACE
  echo "in method add*(parent: var CsConditionalExpression; item: CsStackAllocArrayCreationExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsStackAllocArrayCreationExpression)

method add*(parent: var CsIncompleteMember; item: CsRefType) = # RT
  echo "in method add*(parent: var CsIncompleteMember; item: CsRefType)"
  todoimpl # TODO(add: CsIncompleteMember, CsRefType)

method add*(parent: var CsRefType; item: CsPointerType) = # PT
  echo "in method add*(parent: var CsRefType; item: CsPointerType)"
  todoimpl # TODO(add: CsRefType, CsPointerType)

method add*(parent: var CsExplicitInterfaceSpecifier; item: CsAliasQualifiedName) = # AQN
  echo "in method add*(parent: var CsExplicitInterfaceSpecifier; item: CsAliasQualifiedName)"
  todoimpl # TODO(add: CsExplicitInterfaceSpecifier, CsAliasQualifiedName)

method add*(parent: var CsArrayRankSpecifier; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsArrayRankSpecifier; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsArrayRankSpecifier, CsCheckedExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsDiscardPattern) = # DP
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsDiscardPattern)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsDiscardPattern)

method add*(parent: var CsSwitchExpression; item: CsTupleExpression) = # TE
  echo "in method add*(parent: var CsSwitchExpression; item: CsTupleExpression)"
  todoimpl # TODO(add: CsSwitchExpression, CsTupleExpression)

method add*(parent: var CsCastExpression; item: CsTypeOfExpression) = # TOE
  echo "in method add*(parent: var CsCastExpression; item: CsTypeOfExpression)"
  todoimpl # TODO(add: CsCastExpression, CsTypeOfExpression)

method add*(parent: var CsCaseSwitchLabel; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsCaseSwitchLabel; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsCaseSwitchLabel, CsCheckedExpression)

method add*(parent: var CsStackAllocArrayCreationExpression; item: CsInitializerExpression) = # IE
  echo "in method add*(parent: var CsStackAllocArrayCreationExpression; item: CsInitializerExpression)"
  todoimpl # TODO(add: CsStackAllocArrayCreationExpression, CsInitializerExpression)

method add*(parent: var CsCheckedExpression; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsCheckedExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsCheckedExpression, CsInvocationExpression)

method add*(parent: var CsInterpolation; item: CsInterpolatedStringExpression) = # ISE
  echo "in method add*(parent: var CsInterpolation; item: CsInterpolatedStringExpression)"
  todoimpl # TODO(add: CsInterpolation, CsInterpolatedStringExpression)

method add*(parent: var CsLetClause; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsLetClause; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsLetClause, CsMemberAccessExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsCastExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsCastExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsInterpolatedStringExpression) = # ISE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsInterpolatedStringExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsInterpolatedStringExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsThrowExpression) = # TE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsThrowExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsThrowExpression)

method add*(parent: var CsRefValueExpression; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsRefValueExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsRefValueExpression, CsInvocationExpression)

method add*(parent: var CsRefValueExpression; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsRefValueExpression; item: CsPredefinedType)"
  todoimpl # TODO(add: CsRefValueExpression, CsPredefinedType)

method add*(parent: var CsLockStatement; item: CsIfStatement) = # IS
  echo "in method add*(parent: var CsLockStatement; item: CsIfStatement)"
  todoimpl # TODO(add: CsLockStatement, CsIfStatement)

method add*(parent: var CsRecursivePattern; item: CsPositionalPatternClause) = # PPC
  echo "in method add*(parent: var CsRecursivePattern; item: CsPositionalPatternClause)"
  todoimpl # TODO(add: CsRecursivePattern, CsPositionalPatternClause)

method add*(parent: var CsRecursivePattern; item: CsPropertyPatternClause) = # PPC
  echo "in method add*(parent: var CsRecursivePattern; item: CsPropertyPatternClause)"
  todoimpl # TODO(add: CsRecursivePattern, CsPropertyPatternClause)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsArrayCreationExpression) = # ACE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsArrayCreationExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsArrayCreationExpression)

method add*(parent: var CsPostfixUnaryExpression; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsPostfixUnaryExpression; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsPostfixUnaryExpression, CsConditionalAccessExpression)

method add*(parent: var CsDefaultExpression; item: CsArrayType) = # AT
  echo "in method add*(parent: var CsDefaultExpression; item: CsArrayType)"
  todoimpl # TODO(add: CsDefaultExpression, CsArrayType)

method add*(parent: var CsCheckedExpression; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsCheckedExpression; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsCheckedExpression, CsLiteralExpression)

method add*(parent: var CsForEachStatement; item: CsTupleType) = # TT
  echo "in method add*(parent: var CsForEachStatement; item: CsTupleType)"
  todoimpl # TODO(add: CsForEachStatement, CsTupleType)

method add*(parent: var CsRangeExpression; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsRangeExpression; item: CsCastExpression)"
  todoimpl # TODO(add: CsRangeExpression, CsCastExpression)

method add*(parent: var CsFixedStatement; item: CsVariable) =
  echo "in method add*(parent: var CsFixedStatement; item: CsVariable)"
  todoimpl # TODO(add: CsFixedStatement, CsVariable)

method add*(parent: var CsRefExpression; item: CsPrefixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsRefExpression; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsRefExpression, CsPrefixUnaryExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsRecursivePattern) = # RP
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsRecursivePattern)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsRecursivePattern)

method add*(parent: var CsConstantPattern; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsConstantPattern; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsConstantPattern, CsDefaultExpression)

method add*(parent: var CsTypeOfExpression; item: CsAliasQualifiedName) = # AQN
  echo "in method add*(parent: var CsTypeOfExpression; item: CsAliasQualifiedName)"
  todoimpl # TODO(add: CsTypeOfExpression, CsAliasQualifiedName)

method add*(parent: var CsIfStatement; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsIfStatement; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsIfStatement, CsCheckedExpression)

method add*(parent: var CsElseClause; item: CsLocalDeclarationStatement) = # LDS
  echo "in method add*(parent: var CsElseClause; item: CsLocalDeclarationStatement)"
  todoimpl # TODO(add: CsElseClause, CsLocalDeclarationStatement)

method add*(parent: var CsThrowStatement; item: CsConditionalExpression) = # CE
  echo "in method add*(parent: var CsThrowStatement; item: CsConditionalExpression)"
  todoimpl # TODO(add: CsThrowStatement, CsConditionalExpression)

method add*(parent: var CsWithExpression; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsWithExpression; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsWithExpression, CsMemberAccessExpression)

method add*(parent: var CsCheckedExpression; item: CsConditionalExpression) = # CE
  echo "in method add*(parent: var CsCheckedExpression; item: CsConditionalExpression)"
  todoimpl # TODO(add: CsCheckedExpression, CsConditionalExpression)

method add*(parent: var CsWhenClause; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsWhenClause; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsWhenClause, CsBinaryExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsParenthesizedExpression)

method add*(parent: var CsYieldStatement; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsYieldStatement; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsParenthesizedExpression)

method add*(parent: var CsWhileStatement; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsWhileStatement; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsWhileStatement, CsParenthesizedExpression)

method add*(parent: var CsPositionalPatternClause; item: CsSubpattern) =
  echo "in method add*(parent: var CsPositionalPatternClause; item: CsSubpattern)"
  todoimpl # TODO(add: CsPositionalPatternClause, CsSubpattern)

method add*(parent: var CsSwitchExpressionArm; item: CsConditionalExpression) = # CE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsConditionalExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsConditionalExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsObjectCreationExpression) = # OCE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsObjectCreationExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsObjectCreationExpression)

method add*(parent: var CsSwitchExpression; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsSwitchExpression; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsSwitchExpression, CsElementAccessExpression)

method add*(parent: var CsElementAccessExpression; item: CsMemberBindingExpression) = # MBE
  echo "in method add*(parent: var CsElementAccessExpression; item: CsMemberBindingExpression)"
  todoimpl # TODO(add: CsElementAccessExpression, CsMemberBindingExpression)

method add*(parent: var CsMemberAccessExpression; item: CsRefTypeExpression) = # RTE
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsRefTypeExpression)"
  todoimpl # TODO(add: CsMemberAccessExpression, CsRefTypeExpression)

method add*(parent: var CsPrefixUnaryExpression; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsPrefixUnaryExpression; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsPrefixUnaryExpression, CsPostfixUnaryExpression)

method add*(parent: var CsParenthesizedExpression; item: CsThisExpression) = # TE
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsThisExpression)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsThisExpression)

method add*(parent: var CsSwitchSection; item: CsEmptyStatement) = # ES
  echo "in method add*(parent: var CsSwitchSection; item: CsEmptyStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsEmptyStatement)

method add*(parent: var CsAssignmentExpression; item: CsRefValueExpression) = # RVE
  echo "in method add*(parent: var CsAssignmentExpression; item: CsRefValueExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsRefValueExpression)

method add*(parent: var CsBinaryPattern; item: CsBinaryPattern) = # BP
  echo "in method add*(parent: var CsBinaryPattern; item: CsBinaryPattern)"
  todoimpl # TODO(add: CsBinaryPattern, CsBinaryPattern)

method add*(parent: var CsPropertyPatternClause; item: CsSubpattern) =
  echo "in method add*(parent: var CsPropertyPatternClause; item: CsSubpattern)"
  todoimpl # TODO(add: CsPropertyPatternClause, CsSubpattern)

method add*(parent: var CsWithExpression; item: CsInitializerExpression) = # IE
  echo "in method add*(parent: var CsWithExpression; item: CsInitializerExpression)"
  todoimpl # TODO(add: CsWithExpression, CsInitializerExpression)

method add*(parent: var CsWhenClause; item: CsIsPatternExpression) = # IPE
  echo "in method add*(parent: var CsWhenClause; item: CsIsPatternExpression)"
  todoimpl # TODO(add: CsWhenClause, CsIsPatternExpression)

method add*(parent: var CsElementAccessExpression; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsElementAccessExpression; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsElementAccessExpression, CsPostfixUnaryExpression)

method add*(parent: var CsSubpattern; item: CsConstantPattern) = # CP
  echo "in method add*(parent: var CsSubpattern; item: CsConstantPattern)"
  todoimpl # TODO(add: CsSubpattern, CsConstantPattern)

method add*(parent: var CsNameEquals; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsNameEquals; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsNameEquals, CsLiteralExpression)

method add*(parent: var CsExpressionStatement; item: CsExpressionStatement) = # ES
  echo "in method add*(parent: var CsExpressionStatement; item: CsExpressionStatement)"
  todoimpl # TODO(add: CsExpressionStatement, CsExpressionStatement)

method add*(parent: var CsClass; item: CsEvent) =
  echo "in method add*(parent: var CsClass; item: CsEvent)"
  todoimpl # TODO(add: CsClass, CsEvent)

method add*(parent: var CsClass; item: CsEventField) = # EF
  echo "in method add*(parent: var CsClass; item: CsEventField)"
  todoimpl # TODO(add: CsClass, CsEventField)

method add*(parent: var CsClass; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsClass; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsClass, CsLiteralExpression)

method add*(parent: var CsInterface; item: CsEventField) = # EF
  echo "in method add*(parent: var CsInterface; item: CsEventField)"
  todoimpl # TODO(add: CsInterface, CsEventField)

method add*(parent: var CsInterface; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsInterface; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsInterface, CsLiteralExpression)

method add*(parent: var CsAccessor; item: CsIfStatement) = # IS
  echo "in method add*(parent: var CsAccessor; item: CsIfStatement)"
  todoimpl # TODO(add: CsAccessor, CsIfStatement)

method add*(parent: var CsAccessor; item: CsLockStatement) = # LS
  echo "in method add*(parent: var CsAccessor; item: CsLockStatement)"
  todoimpl # TODO(add: CsAccessor, CsLockStatement)

method add*(parent: var CsAccessor; item: CsThrowStatement) = # TS
  echo "in method add*(parent: var CsAccessor; item: CsThrowStatement)"
  todoimpl # TODO(add: CsAccessor, CsThrowStatement)

method add*(parent: var CsAccessor; item: CsYieldStatement) = # YS
  echo "in method add*(parent: var CsAccessor; item: CsYieldStatement)"
  todoimpl # TODO(add: CsAccessor, CsYieldStatement)

method add*(parent: var CsParameter; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsParameter; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsParameter, CsLiteralExpression)

method add*(parent: var CsMethod; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsMethod; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsMethod, CsLiteralExpression)

method add*(parent: var CsUsingDirective; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsUsingDirective; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsUsingDirective, CsLiteralExpression)

method add*(parent: var CsConstructor; item: CsForEachStatement) = # FES
  echo "in method add*(parent: var CsConstructor; item: CsForEachStatement)"
  todoimpl # TODO(add: CsConstructor, CsForEachStatement)

method add*(parent: var CsConstructor; item: CsIfStatement) = # IS
  echo "in method add*(parent: var CsConstructor; item: CsIfStatement)"
  todoimpl # TODO(add: CsConstructor, CsIfStatement)

method add*(parent: var CsConstructor; item: CsThrowStatement) = # TS
  echo "in method add*(parent: var CsConstructor; item: CsThrowStatement)"
  todoimpl # TODO(add: CsConstructor, CsThrowStatement)

method add*(parent: var CsConstructor; item: CsTryStatement) = # TS
  echo "in method add*(parent: var CsConstructor; item: CsTryStatement)"
  todoimpl # TODO(add: CsConstructor, CsTryStatement)

method add*(parent: var CsConstructor; item: CsUsingStatement) = # US
  echo "in method add*(parent: var CsConstructor; item: CsUsingStatement)"
  todoimpl # TODO(add: CsConstructor, CsUsingStatement)

method add*(parent: var CsPostfixUnaryExpression; item: CsTupleExpression) = # TE
  echo "in method add*(parent: var CsPostfixUnaryExpression; item: CsTupleExpression)"
  todoimpl # TODO(add: CsPostfixUnaryExpression, CsTupleExpression)

method add*(parent: var CsProperty; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsProperty; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsProperty, CsLiteralExpression)

method add*(parent: var CsAccessor; item: CsWhileStatement) = # WS
  echo "in method add*(parent: var CsAccessor; item: CsWhileStatement)"
  todoimpl # TODO(add: CsAccessor, CsWhileStatement)

method add*(parent: var CsEvent; item: CsAccessorList) = # AL
  echo "in method add*(parent: var CsEvent; item: CsAccessorList)"
  todoimpl # TODO(add: CsEvent, CsAccessorList)

method add*(parent: var CsEventField; item: CsVariable) =
  echo "in method add*(parent: var CsEventField; item: CsVariable)"
  todoimpl # TODO(add: CsEventField, CsVariable)

method add*(parent: var CsPredefinedType; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsPredefinedType; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsPredefinedType, CsLiteralExpression)

method add*(parent: var CsSubpattern; item: CsDiscardPattern) = # DP
  echo "in method add*(parent: var CsSubpattern; item: CsDiscardPattern)"
  todoimpl # TODO(add: CsSubpattern, CsDiscardPattern)

method add*(parent: var CsConstructor; item: CsForStatement) = # FS
  echo "in method add*(parent: var CsConstructor; item: CsForStatement)"
  todoimpl # TODO(add: CsConstructor, CsForStatement)

method add*(parent: var CsConstructor; item: CsWhileStatement) = # WS
  echo "in method add*(parent: var CsConstructor; item: CsWhileStatement)"
  todoimpl # TODO(add: CsConstructor, CsWhileStatement)

method add*(parent: var CsInterpolation; item: CsThisExpression) = # TE
  echo "in method add*(parent: var CsInterpolation; item: CsThisExpression)"
  todoimpl # TODO(add: CsInterpolation, CsThisExpression)

method add*(parent: var CsIsPatternExpression; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsIsPatternExpression; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsIsPatternExpression, CsParenthesizedExpression)

method add*(parent: var CsDoStatement; item: CsIsPatternExpression) = # IPE
  echo "in method add*(parent: var CsDoStatement; item: CsIsPatternExpression)"
  todoimpl # TODO(add: CsDoStatement, CsIsPatternExpression)

method add*(parent: var CsField; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsField; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsField, CsLiteralExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsBinaryExpression)

method add*(parent: var CsAccessor; item: CsForEachStatement) = # FES
  echo "in method add*(parent: var CsAccessor; item: CsForEachStatement)"
  todoimpl # TODO(add: CsAccessor, CsForEachStatement)

method add*(parent: var CsEvent; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsEvent; item: CsGenericName)"
  todoimpl # TODO(add: CsEvent, CsGenericName)

method add*(parent: var CsEvent; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsEvent; item: CsNullableType)"
  todoimpl # TODO(add: CsEvent, CsNullableType)

method add*(parent: var CsCheckedExpression; item: CsArrayCreationExpression) = # ACE
  echo "in method add*(parent: var CsCheckedExpression; item: CsArrayCreationExpression)"
  todoimpl # TODO(add: CsCheckedExpression, CsArrayCreationExpression)

method add*(parent: var CsAccessor; item: CsTryStatement) = # TS
  echo "in method add*(parent: var CsAccessor; item: CsTryStatement)"
  todoimpl # TODO(add: CsAccessor, CsTryStatement)

method add*(parent: var CsConstructor; item: CsContinueStatement) = # CS
  echo "in method add*(parent: var CsConstructor; item: CsContinueStatement)"
  todoimpl # TODO(add: CsConstructor, CsContinueStatement)

method add*(parent: var CsEvent; item: CsExplicitInterfaceSpecifier) = # EIS
  echo "in method add*(parent: var CsEvent; item: CsExplicitInterfaceSpecifier)"
  todoimpl # TODO(add: CsEvent, CsExplicitInterfaceSpecifier)

method add*(parent: var CsClass; item: CsConversionOperator) = # CO
  echo "in method add*(parent: var CsClass; item: CsConversionOperator)"
  todoimpl # TODO(add: CsClass, CsConversionOperator)

method add*(parent: var CsClass; item: CsDestructor) =
  echo "in method add*(parent: var CsClass; item: CsDestructor)"
  todoimpl # TODO(add: CsClass, CsDestructor)

method add*(parent: var CsClass; item: CsOperator) =
  echo "in method add*(parent: var CsClass; item: CsOperator)"
  todoimpl # TODO(add: CsClass, CsOperator)

method add*(parent: var CsStruct; item: CsOperator) =
  echo "in method add*(parent: var CsStruct; item: CsOperator)"
  todoimpl # TODO(add: CsStruct, CsOperator)

method add*(parent: var CsSwitchExpression; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsSwitchExpression; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsSwitchExpression, CsParenthesizedExpression)

method add*(parent: var CsDoStatement; item: CsExpressionStatement) = # ES
  echo "in method add*(parent: var CsDoStatement; item: CsExpressionStatement)"
  todoimpl # TODO(add: CsDoStatement, CsExpressionStatement)

method add*(parent: var CsAwaitExpression; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsAwaitExpression; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsAwaitExpression, CsDefaultExpression)

method add*(parent: var CsArrowExpressionClause; item: CsWithExpression) = # WE
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsWithExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsWithExpression)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsConditionalExpression) = # CE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsConditionalExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsConditionalExpression)

method add*(parent: var CsAccessor; item: CsForStatement) = # FS
  echo "in method add*(parent: var CsAccessor; item: CsForStatement)"
  todoimpl # TODO(add: CsAccessor, CsForStatement)

method add*(parent: var CsAccessor; item: CsUsingStatement) = # US
  echo "in method add*(parent: var CsAccessor; item: CsUsingStatement)"
  todoimpl # TODO(add: CsAccessor, CsUsingStatement)

method add*(parent: var CsAssignmentExpression; item: CsIsPatternExpression) = # IPE
  echo "in method add*(parent: var CsAssignmentExpression; item: CsIsPatternExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsIsPatternExpression)

method add*(parent: var CsStruct; item: CsEventField) = # EF
  echo "in method add*(parent: var CsStruct; item: CsEventField)"
  todoimpl # TODO(add: CsStruct, CsEventField)

method add*(parent: var CsConstructor; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsConstructor; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsConstructor, CsLiteralExpression)

method add*(parent: var CsConstructor; item: CsLockStatement) = # LS
  echo "in method add*(parent: var CsConstructor; item: CsLockStatement)"
  todoimpl # TODO(add: CsConstructor, CsLockStatement)

method add*(parent: var CsArgument; item: CsMakeRefExpression) = # MRE
  echo "in method add*(parent: var CsArgument; item: CsMakeRefExpression)"
  todoimpl # TODO(add: CsArgument, CsMakeRefExpression)

method add*(parent: var CsThrowExpression; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsThrowExpression; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsThrowExpression, CsBinaryExpression)

method add*(parent: var CsRangeExpression; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsRangeExpression; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsRangeExpression, CsMemberAccessExpression)

method add*(parent: var CsDestructor; item: CsParameterList) = # PL
  echo "in method add*(parent: var CsDestructor; item: CsParameterList)"
  todoimpl # TODO(add: CsDestructor, CsParameterList)

method add*(parent: var CsConversionOperator; item: CsParameterList) = # PL
  echo "in method add*(parent: var CsConversionOperator; item: CsParameterList)"
  todoimpl # TODO(add: CsConversionOperator, CsParameterList)

method add*(parent: var CsOperator; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsOperator; item: CsPredefinedType)"
  todoimpl # TODO(add: CsOperator, CsPredefinedType)

method add*(parent: var CsConstructor; item: CsDoStatement) = # DS
  echo "in method add*(parent: var CsConstructor; item: CsDoStatement)"
  todoimpl # TODO(add: CsConstructor, CsDoStatement)

method add*(parent: var CsDelegate; item: CsTupleType) = # TT
  echo "in method add*(parent: var CsDelegate; item: CsTupleType)"
  todoimpl # TODO(add: CsDelegate, CsTupleType)

method add*(parent: var CsOperator; item: CsParameterList) = # PL
  echo "in method add*(parent: var CsOperator; item: CsParameterList)"
  todoimpl # TODO(add: CsOperator, CsParameterList)

method add*(parent: var CsStruct; item: CsConversionOperator) = # CO
  echo "in method add*(parent: var CsStruct; item: CsConversionOperator)"
  todoimpl # TODO(add: CsStruct, CsConversionOperator)

method add*(parent: var CsInvocationExpression; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsInvocationExpression; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsInvocationExpression, CsPostfixUnaryExpression)

method add*(parent: var CsOperator; item: CsArrowExpressionClause) = # AEC
  echo "in method add*(parent: var CsOperator; item: CsArrowExpressionClause)"
  todoimpl # TODO(add: CsOperator, CsArrowExpressionClause)

method add*(parent: var CsConversionOperator; item: CsArrowExpressionClause) = # AEC
  echo "in method add*(parent: var CsConversionOperator; item: CsArrowExpressionClause)"
  todoimpl # TODO(add: CsConversionOperator, CsArrowExpressionClause)

method add*(parent: var CsBinaryExpression; item: CsSizeOfExpression) = # SOE
  echo "in method add*(parent: var CsBinaryExpression; item: CsSizeOfExpression)"
  todoimpl # TODO(add: CsBinaryExpression, CsSizeOfExpression)

method add*(parent: var CsWhenClause; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsWhenClause; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsWhenClause, CsInvocationExpression)

method add*(parent: var CsSizeOfExpression; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsSizeOfExpression; item: CsPredefinedType)"
  todoimpl # TODO(add: CsSizeOfExpression, CsPredefinedType)

method add*(parent: var CsConversionOperator; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsConversionOperator; item: CsPredefinedType)"
  todoimpl # TODO(add: CsConversionOperator, CsPredefinedType)

method add*(parent: var CsConversionOperator; item: CsArrayType) = # AT
  echo "in method add*(parent: var CsConversionOperator; item: CsArrayType)"
  todoimpl # TODO(add: CsConversionOperator, CsArrayType)

method add*(parent: var CsEnum; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsEnum; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsEnum, CsLiteralExpression)

method add*(parent: var CsAssignmentExpression; item: CsSizeOfExpression) = # SOE
  echo "in method add*(parent: var CsAssignmentExpression; item: CsSizeOfExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsSizeOfExpression)

method add*(parent: var CsConversionOperator; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsConversionOperator; item: CsGenericName)"
  todoimpl # TODO(add: CsConversionOperator, CsGenericName)

method add*(parent: var CsOperator; item: CsReturnStatement) = # RS
  echo "in method add*(parent: var CsOperator; item: CsReturnStatement)"
  todoimpl # TODO(add: CsOperator, CsReturnStatement)

method add*(parent: var CsEqualsValueClause; item: CsSizeOfExpression) = # SOE
  echo "in method add*(parent: var CsEqualsValueClause; item: CsSizeOfExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsSizeOfExpression)

method add*(parent: var CsDestructor; item: CsArrowExpressionClause) = # AEC
  echo "in method add*(parent: var CsDestructor; item: CsArrowExpressionClause)"
  todoimpl # TODO(add: CsDestructor, CsArrowExpressionClause)

method add*(parent: var CsConversionOperator; item: CsReturnStatement) = # RS
  echo "in method add*(parent: var CsConversionOperator; item: CsReturnStatement)"
  todoimpl # TODO(add: CsConversionOperator, CsReturnStatement)

method add*(parent: var CsTypeParameter; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsTypeParameter; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsTypeParameter, CsLiteralExpression)

method add*(parent: var CsConversionOperator; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsConversionOperator; item: CsNullableType)"
  todoimpl # TODO(add: CsConversionOperator, CsNullableType)

method add*(parent: var CsIfStatement; item: CsObjectCreationExpression) = # OCE
  echo "in method add*(parent: var CsIfStatement; item: CsObjectCreationExpression)"
  todoimpl # TODO(add: CsIfStatement, CsObjectCreationExpression)

method add*(parent: var CsArgument; item: CsSizeOfExpression) = # SOE
  echo "in method add*(parent: var CsArgument; item: CsSizeOfExpression)"
  todoimpl # TODO(add: CsArgument, CsSizeOfExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsImplicitArrayCreationExpression)

method add*(parent: var CsSwitchStatement; item: CsObjectCreationExpression) = # OCE
  echo "in method add*(parent: var CsSwitchStatement; item: CsObjectCreationExpression)"
  todoimpl # TODO(add: CsSwitchStatement, CsObjectCreationExpression)

method add*(parent: var CsCastExpression; item: CsSizeOfExpression) = # SOE
  echo "in method add*(parent: var CsCastExpression; item: CsSizeOfExpression)"
  todoimpl # TODO(add: CsCastExpression, CsSizeOfExpression)

method add*(parent: var CsStruct; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsStruct; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsStruct, CsLiteralExpression)

method add*(parent: var CsPostfixUnaryExpression; item: CsThisExpression) = # TE
  echo "in method add*(parent: var CsPostfixUnaryExpression; item: CsThisExpression)"
  todoimpl # TODO(add: CsPostfixUnaryExpression, CsThisExpression)

method add*(parent: var CsAssignmentExpression; item: CsRefExpression) = # RE
  echo "in method add*(parent: var CsAssignmentExpression; item: CsRefExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsRefExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsArrayCreationExpression) = # ACE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsArrayCreationExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsArrayCreationExpression)

method add*(parent: var CsPrefixUnaryExpression; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsPrefixUnaryExpression; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsPrefixUnaryExpression, CsCheckedExpression)

method add*(parent: var CsOperator; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsOperator; item: CsGenericName)"
  todoimpl # TODO(add: CsOperator, CsGenericName)

method add*(parent: var CsOperator; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsOperator; item: CsNullableType)"
  todoimpl # TODO(add: CsOperator, CsNullableType)

method add*(parent: var CsReturnStatement; item: CsSizeOfExpression) = # SOE
  echo "in method add*(parent: var CsReturnStatement; item: CsSizeOfExpression)"
  todoimpl # TODO(add: CsReturnStatement, CsSizeOfExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsPrefixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsPrefixUnaryExpression)

method add*(parent: var CsSwitchExpression; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsSwitchExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsSwitchExpression, CsInvocationExpression)

method add*(parent: var CsTypeOfExpression; item: CsTupleType) = # TT
  echo "in method add*(parent: var CsTypeOfExpression; item: CsTupleType)"
  todoimpl # TODO(add: CsTypeOfExpression, CsTupleType)

method add*(parent: var CsSizeOfExpression; item: CsPointerType) = # PT
  echo "in method add*(parent: var CsSizeOfExpression; item: CsPointerType)"
  todoimpl # TODO(add: CsSizeOfExpression, CsPointerType)

method add*(parent: var CsSubpattern; item: CsNameColon) = # NC
  echo "in method add*(parent: var CsSubpattern; item: CsNameColon)"
  todoimpl # TODO(add: CsSubpattern, CsNameColon)

method add*(parent: var CsArrayRankSpecifier; item: CsSizeOfExpression) = # SOE
  echo "in method add*(parent: var CsArrayRankSpecifier; item: CsSizeOfExpression)"
  todoimpl # TODO(add: CsArrayRankSpecifier, CsSizeOfExpression)

method add*(parent: var CsArrowExpressionClause; item: CsSizeOfExpression) = # SOE
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsSizeOfExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsSizeOfExpression)

method add*(parent: var CsConditionalAccessExpression; item: CsTypeOfExpression) = # TOE
  echo "in method add*(parent: var CsConditionalAccessExpression; item: CsTypeOfExpression)"
  todoimpl # TODO(add: CsConditionalAccessExpression, CsTypeOfExpression)

method add*(parent: var CsEventField; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsEventField; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsEventField, CsLiteralExpression)

method add*(parent: var CsForStatement; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsForStatement; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsForStatement, CsAwaitExpression)

method add*(parent: var CsIncompleteMember; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsIncompleteMember; item: CsNullableType)"
  todoimpl # TODO(add: CsIncompleteMember, CsNullableType)

method add*(parent: var CsSubpattern; item: CsDeclarationPattern) = # DP
  echo "in method add*(parent: var CsSubpattern; item: CsDeclarationPattern)"
  todoimpl # TODO(add: CsSubpattern, CsDeclarationPattern)

method add*(parent: var CsConditionalExpression; item: CsTupleExpression) = # TE
  echo "in method add*(parent: var CsConditionalExpression; item: CsTupleExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsTupleExpression)

method add*(parent: var CsBinaryExpression; item: CsSwitchExpression) = # SE
  echo "in method add*(parent: var CsBinaryExpression; item: CsSwitchExpression)"
  todoimpl # TODO(add: CsBinaryExpression, CsSwitchExpression)

method add*(parent: var CsInterpolation; item: CsSizeOfExpression) = # SOE
  echo "in method add*(parent: var CsInterpolation; item: CsSizeOfExpression)"
  todoimpl # TODO(add: CsInterpolation, CsSizeOfExpression)

method add*(parent: var CsDeclarationExpression; item: CsPointerType) = # PT
  echo "in method add*(parent: var CsDeclarationExpression; item: CsPointerType)"
  todoimpl # TODO(add: CsDeclarationExpression, CsPointerType)

method add*(parent: var CsIsPatternExpression; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsIsPatternExpression; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsIsPatternExpression, CsBinaryExpression)

method add*(parent: var CsIsPatternExpression; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsIsPatternExpression; item: CsCastExpression)"
  todoimpl # TODO(add: CsIsPatternExpression, CsCastExpression)

method add*(parent: var CsIsPatternExpression; item: CsThisExpression) = # TE
  echo "in method add*(parent: var CsIsPatternExpression; item: CsThisExpression)"
  todoimpl # TODO(add: CsIsPatternExpression, CsThisExpression)

method add*(parent: var CsLetClause; item: CsConditionalExpression) = # CE
  echo "in method add*(parent: var CsLetClause; item: CsConditionalExpression)"
  todoimpl # TODO(add: CsLetClause, CsConditionalExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsImplicitArrayCreationExpression)

method add*(parent: var CsYieldStatement; item: CsParenthesizedLambdaExpression) = # PLE
  echo "in method add*(parent: var CsYieldStatement; item: CsParenthesizedLambdaExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsParenthesizedLambdaExpression)

method add*(parent: var CsAwaitExpression; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsAwaitExpression; item: CsCastExpression)"
  todoimpl # TODO(add: CsAwaitExpression, CsCastExpression)

method add*(parent: var CsArrowExpressionClause; item: CsImplicitObjectCreationExpression) = # IOCE
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsImplicitObjectCreationExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsImplicitObjectCreationExpression)

method add*(parent: var CsInitializerExpression; item: CsImplicitObjectCreationExpression) = # IOCE
  echo "in method add*(parent: var CsInitializerExpression; item: CsImplicitObjectCreationExpression)"
  todoimpl # TODO(add: CsInitializerExpression, CsImplicitObjectCreationExpression)

method add*(parent: var CsConstantPattern; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsConstantPattern; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsConstantPattern, CsInvocationExpression)

method add*(parent: var CsConversionOperator; item: CsPointerType) = # PT
  echo "in method add*(parent: var CsConversionOperator; item: CsPointerType)"
  todoimpl # TODO(add: CsConversionOperator, CsPointerType)

method add*(parent: var CsCasePatternSwitchLabel; item: CsVarPattern) = # VP
  echo "in method add*(parent: var CsCasePatternSwitchLabel; item: CsVarPattern)"
  todoimpl # TODO(add: CsCasePatternSwitchLabel, CsVarPattern)

method add*(parent: var CsSwitchSection; item: CsDoStatement) = # DS
  echo "in method add*(parent: var CsSwitchSection; item: CsDoStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsDoStatement)

method add*(parent: var CsSwitchSection; item: CsForEachVariableStatement) = # FEVS
  echo "in method add*(parent: var CsSwitchSection; item: CsForEachVariableStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsForEachVariableStatement)

method add*(parent: var CsSwitchSection; item: CsLockStatement) = # LS
  echo "in method add*(parent: var CsSwitchSection; item: CsLockStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsLockStatement)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsElementAccessExpression)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsInterpolatedStringExpression) = # ISE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsInterpolatedStringExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsInterpolatedStringExpression)

method add*(parent: var CsAccessor; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsAccessor; item: CsCastExpression)"
  todoimpl # TODO(add: CsAccessor, CsCastExpression)

method add*(parent: var CsAccessor; item: CsContinueStatement) = # CS
  echo "in method add*(parent: var CsAccessor; item: CsContinueStatement)"
  todoimpl # TODO(add: CsAccessor, CsContinueStatement)

method add*(parent: var CsAccessor; item: CsDoStatement) = # DS
  echo "in method add*(parent: var CsAccessor; item: CsDoStatement)"
  todoimpl # TODO(add: CsAccessor, CsDoStatement)

method add*(parent: var CsPostfixUnaryExpression; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsPostfixUnaryExpression; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsPostfixUnaryExpression, CsPostfixUnaryExpression)

method add*(parent: var CsUnaryPattern; item: CsDeclarationPattern) = # DP
  echo "in method add*(parent: var CsUnaryPattern; item: CsDeclarationPattern)"
  todoimpl # TODO(add: CsUnaryPattern, CsDeclarationPattern)

method add*(parent: var CsEvent; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsEvent; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsEvent, CsLiteralExpression)

method add*(parent: var CsUsingStatement; item: CsForStatement) = # FS
  echo "in method add*(parent: var CsUsingStatement; item: CsForStatement)"
  todoimpl # TODO(add: CsUsingStatement, CsForStatement)

method add*(parent: var CsInterpolationAlignmentClause; item: CsPrefixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsInterpolationAlignmentClause; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsInterpolationAlignmentClause, CsPrefixUnaryExpression)

method add*(parent: var CsIfStatement; item: CsWhileStatement) = # WS
  echo "in method add*(parent: var CsIfStatement; item: CsWhileStatement)"
  todoimpl # TODO(add: CsIfStatement, CsWhileStatement)

method add*(parent: var CsForStatement; item: CsContinueStatement) = # CS
  echo "in method add*(parent: var CsForStatement; item: CsContinueStatement)"
  todoimpl # TODO(add: CsForStatement, CsContinueStatement)

method add*(parent: var CsForStatement; item: CsForEachStatement) = # FES
  echo "in method add*(parent: var CsForStatement; item: CsForEachStatement)"
  todoimpl # TODO(add: CsForStatement, CsForEachStatement)

method add*(parent: var CsForStatement; item: CsThrowStatement) = # TS
  echo "in method add*(parent: var CsForStatement; item: CsThrowStatement)"
  todoimpl # TODO(add: CsForStatement, CsThrowStatement)

method add*(parent: var CsForStatement; item: CsUsingStatement) = # US
  echo "in method add*(parent: var CsForStatement; item: CsUsingStatement)"
  todoimpl # TODO(add: CsForStatement, CsUsingStatement)

method add*(parent: var CsElseClause; item: CsForStatement) = # FS
  echo "in method add*(parent: var CsElseClause; item: CsForStatement)"
  todoimpl # TODO(add: CsElseClause, CsForStatement)

method add*(parent: var CsElseClause; item: CsWhileStatement) = # WS
  echo "in method add*(parent: var CsElseClause; item: CsWhileStatement)"
  todoimpl # TODO(add: CsElseClause, CsWhileStatement)

method add*(parent: var CsInvocationExpression; item: CsObjectCreationExpression) = # OCE
  echo "in method add*(parent: var CsInvocationExpression; item: CsObjectCreationExpression)"
  todoimpl # TODO(add: CsInvocationExpression, CsObjectCreationExpression)

method add*(parent: var CsWhileStatement; item: CsAssignmentExpression) = # AE
  echo "in method add*(parent: var CsWhileStatement; item: CsAssignmentExpression)"
  todoimpl # TODO(add: CsWhileStatement, CsAssignmentExpression)

method add*(parent: var CsThrowStatement; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsThrowStatement; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsThrowStatement, CsElementAccessExpression)

method add*(parent: var CsThrowStatement; item: CsThisExpression) = # TE
  echo "in method add*(parent: var CsThrowStatement; item: CsThisExpression)"
  todoimpl # TODO(add: CsThrowStatement, CsThisExpression)

method add*(parent: var CsSubpattern; item: CsUnaryPattern) = # UP
  echo "in method add*(parent: var CsSubpattern; item: CsUnaryPattern)"
  todoimpl # TODO(add: CsSubpattern, CsUnaryPattern)

method add*(parent: var CsArgument; item: CsSwitchExpression) = # SE
  echo "in method add*(parent: var CsArgument; item: CsSwitchExpression)"
  todoimpl # TODO(add: CsArgument, CsSwitchExpression)

method add*(parent: var CsArgument; item: CsThrowExpression) = # TE
  echo "in method add*(parent: var CsArgument; item: CsThrowExpression)"
  todoimpl # TODO(add: CsArgument, CsThrowExpression)

method add*(parent: var CsCheckedExpression; item: CsPrefixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsCheckedExpression; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsCheckedExpression, CsPrefixUnaryExpression)

method add*(parent: var CsThrowExpression; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsThrowExpression; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsThrowExpression, CsParenthesizedExpression)

method add*(parent: var CsRangeExpression; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsRangeExpression; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsRangeExpression, CsParenthesizedExpression)

method add*(parent: var CsWhenClause; item: CsPrefixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsWhenClause; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsWhenClause, CsPrefixUnaryExpression)

method add*(parent: var CsIsPatternExpression; item: CsVarPattern) = # VP
  echo "in method add*(parent: var CsIsPatternExpression; item: CsVarPattern)"
  todoimpl # TODO(add: CsIsPatternExpression, CsVarPattern)

method add*(parent: var CsCatchFilterClause; item: CsIsPatternExpression) = # IPE
  echo "in method add*(parent: var CsCatchFilterClause; item: CsIsPatternExpression)"
  todoimpl # TODO(add: CsCatchFilterClause, CsIsPatternExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsParenthesizedLambdaExpression) = # PLE
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsParenthesizedLambdaExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsParenthesizedLambdaExpression)

method add*(parent: var CsTypeArgumentList; item: CsRefType) = # RT
  echo "in method add*(parent: var CsTypeArgumentList; item: CsRefType)"
  todoimpl # TODO(add: CsTypeArgumentList, CsRefType)

method add*(parent: var CsForEachStatement; item: CsRefType) = # RT
  echo "in method add*(parent: var CsForEachStatement; item: CsRefType)"
  todoimpl # TODO(add: CsForEachStatement, CsRefType)

method add*(parent: var CsVarPattern; item: CsSingleVariableDesignation) = # SVD
  echo "in method add*(parent: var CsVarPattern; item: CsSingleVariableDesignation)"
  todoimpl # TODO(add: CsVarPattern, CsSingleVariableDesignation)

method add*(parent: var CsSubpattern; item: CsRecursivePattern) = # RP
  echo "in method add*(parent: var CsSubpattern; item: CsRecursivePattern)"
  todoimpl # TODO(add: CsSubpattern, CsRecursivePattern)

method add*(parent: var CsArgument; item: CsStackAllocArrayCreationExpression) = # SAACE
  echo "in method add*(parent: var CsArgument; item: CsStackAllocArrayCreationExpression)"
  todoimpl # TODO(add: CsArgument, CsStackAllocArrayCreationExpression)

method add*(parent: var CsAccessor; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsAccessor; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsAccessor, CsLiteralExpression)

method add*(parent: var CsRefType; item: CsArrayType) = # AT
  echo "in method add*(parent: var CsRefType; item: CsArrayType)"
  todoimpl # TODO(add: CsRefType, CsArrayType)

method add*(parent: var CsAwaitExpression; item: CsThisExpression) = # TE
  echo "in method add*(parent: var CsAwaitExpression; item: CsThisExpression)"
  todoimpl # TODO(add: CsAwaitExpression, CsThisExpression)

method add*(parent: var CsIfStatement; item: CsCheckedStatement) = # CS
  echo "in method add*(parent: var CsIfStatement; item: CsCheckedStatement)"
  todoimpl # TODO(add: CsIfStatement, CsCheckedStatement)

method add*(parent: var CsSubpattern; item: CsRelationalPattern) = # RP
  echo "in method add*(parent: var CsSubpattern; item: CsRelationalPattern)"
  todoimpl # TODO(add: CsSubpattern, CsRelationalPattern)

method add*(parent: var CsIsPatternExpression; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsIsPatternExpression; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsIsPatternExpression, CsDefaultExpression)

method add*(parent: var CsConstantPattern; item: CsIsPatternExpression) = # IPE
  echo "in method add*(parent: var CsConstantPattern; item: CsIsPatternExpression)"
  todoimpl # TODO(add: CsConstantPattern, CsIsPatternExpression)

method add*(parent: var CsArrayRankSpecifier; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsArrayRankSpecifier; item: CsPredefinedType)"
  todoimpl # TODO(add: CsArrayRankSpecifier, CsPredefinedType)

method add*(parent: var CsDeclarationExpression; item: CsTupleType) = # TT
  echo "in method add*(parent: var CsDeclarationExpression; item: CsTupleType)"
  todoimpl # TODO(add: CsDeclarationExpression, CsTupleType)

method add*(parent: var CsImplicitObjectCreationExpression; item: CsInitializerExpression) = # IE
  echo "in method add*(parent: var CsImplicitObjectCreationExpression; item: CsInitializerExpression)"
  todoimpl # TODO(add: CsImplicitObjectCreationExpression, CsInitializerExpression)

method add*(parent: var CsLetClause; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsLetClause; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsLetClause, CsBinaryExpression)

method add*(parent: var CsLetClause; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsLetClause; item: CsCastExpression)"
  todoimpl # TODO(add: CsLetClause, CsCastExpression)

method add*(parent: var CsLetClause; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsLetClause; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsLetClause, CsImplicitArrayCreationExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsSimpleLambdaExpression) = # SLE
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsSimpleLambdaExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsSimpleLambdaExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsThisExpression) = # TE
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsThisExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsThisExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsAwaitExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsElementAccessExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsIsPatternExpression) = # IPE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsIsPatternExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsIsPatternExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsRelationalPattern) = # RP
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsRelationalPattern)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsRelationalPattern)

method add*(parent: var CsSwitchExpressionArm; item: CsTypeOfExpression) = # TOE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsTypeOfExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsTypeOfExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsVarPattern) = # VP
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsVarPattern)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsVarPattern)

method add*(parent: var CsSwitchExpressionArm; item: CsWhenClause) = # WC
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsWhenClause)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsWhenClause)

method add*(parent: var CsYieldStatement; item: CsAssignmentExpression) = # AE
  echo "in method add*(parent: var CsYieldStatement; item: CsAssignmentExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsAssignmentExpression)

method add*(parent: var CsSwitchExpression; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsSwitchExpression; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsSwitchExpression, CsConditionalAccessExpression)

method add*(parent: var CsSwitchExpression; item: CsThisExpression) = # TE
  echo "in method add*(parent: var CsSwitchExpression; item: CsThisExpression)"
  todoimpl # TODO(add: CsSwitchExpression, CsThisExpression)

method add*(parent: var CsSwitchExpression; item: CsTypeOfExpression) = # TOE
  echo "in method add*(parent: var CsSwitchExpression; item: CsTypeOfExpression)"
  todoimpl # TODO(add: CsSwitchExpression, CsTypeOfExpression)

method add*(parent: var CsAwaitExpression; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsAwaitExpression; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsAwaitExpression, CsElementAccessExpression)

method add*(parent: var CsAwaitExpression; item: CsInterpolatedStringExpression) = # ISE
  echo "in method add*(parent: var CsAwaitExpression; item: CsInterpolatedStringExpression)"
  todoimpl # TODO(add: CsAwaitExpression, CsInterpolatedStringExpression)

method add*(parent: var CsMemberAccessExpression; item: CsStackAllocArrayCreationExpression) = # SAACE
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsStackAllocArrayCreationExpression)"
  todoimpl # TODO(add: CsMemberAccessExpression, CsStackAllocArrayCreationExpression)

method add*(parent: var CsInitializerExpression; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsInitializerExpression; item: CsGenericName)"
  todoimpl # TODO(add: CsInitializerExpression, CsGenericName)

method add*(parent: var CsInitializerExpression; item: CsSizeOfExpression) = # SOE
  echo "in method add*(parent: var CsInitializerExpression; item: CsSizeOfExpression)"
  todoimpl # TODO(add: CsInitializerExpression, CsSizeOfExpression)

method add*(parent: var CsParenthesizedVariableDesignation; item: CsParenthesizedVariableDesignation) = # PVD
  echo "in method add*(parent: var CsParenthesizedVariableDesignation; item: CsParenthesizedVariableDesignation)"
  todoimpl # TODO(add: CsParenthesizedVariableDesignation, CsParenthesizedVariableDesignation)

method add*(parent: var CsConstantPattern; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsConstantPattern; item: CsCastExpression)"
  todoimpl # TODO(add: CsConstantPattern, CsCastExpression)

method add*(parent: var CsConstantPattern; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsConstantPattern; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsConstantPattern, CsElementAccessExpression)

method add*(parent: var CsLabeledStatement; item: CsEmptyStatement) = # ES
  echo "in method add*(parent: var CsLabeledStatement; item: CsEmptyStatement)"
  todoimpl # TODO(add: CsLabeledStatement, CsEmptyStatement)

method add*(parent: var CsExpressionStatement; item: CsIsPatternExpression) = # IPE
  echo "in method add*(parent: var CsExpressionStatement; item: CsIsPatternExpression)"
  todoimpl # TODO(add: CsExpressionStatement, CsIsPatternExpression)

method add*(parent: var CsExpressionStatement; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsExpressionStatement; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsExpressionStatement, CsParenthesizedExpression)

method add*(parent: var CsExpressionStatement; item: CsTupleExpression) = # TE
  echo "in method add*(parent: var CsExpressionStatement; item: CsTupleExpression)"
  todoimpl # TODO(add: CsExpressionStatement, CsTupleExpression)

method add*(parent: var CsRecursivePattern; item: CsSingleVariableDesignation) = # SVD
  echo "in method add*(parent: var CsRecursivePattern; item: CsSingleVariableDesignation)"
  todoimpl # TODO(add: CsRecursivePattern, CsSingleVariableDesignation)

method add*(parent: var CsConversionOperator; item: CsTupleType) = # TT
  echo "in method add*(parent: var CsConversionOperator; item: CsTupleType)"
  todoimpl # TODO(add: CsConversionOperator, CsTupleType)

method add*(parent: var CsSwitchStatement; item: CsAssignmentExpression) = # AE
  echo "in method add*(parent: var CsSwitchStatement; item: CsAssignmentExpression)"
  todoimpl # TODO(add: CsSwitchStatement, CsAssignmentExpression)

method add*(parent: var CsSwitchStatement; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsSwitchStatement; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsSwitchStatement, CsParenthesizedExpression)

method add*(parent: var CsSwitchStatement; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsSwitchStatement; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsSwitchStatement, CsPostfixUnaryExpression)

method add*(parent: var CsParenthesizedExpression; item: CsSizeOfExpression) = # SOE
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsSizeOfExpression)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsSizeOfExpression)

method add*(parent: var CsParenthesizedExpression; item: CsSwitchExpression) = # SE
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsSwitchExpression)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsSwitchExpression)

method add*(parent: var CsCasePatternSwitchLabel; item: CsRecursivePattern) = # RP
  echo "in method add*(parent: var CsCasePatternSwitchLabel; item: CsRecursivePattern)"
  todoimpl # TODO(add: CsCasePatternSwitchLabel, CsRecursivePattern)

method add*(parent: var CsSwitchSection; item: CsCheckedStatement) = # CS
  echo "in method add*(parent: var CsSwitchSection; item: CsCheckedStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsCheckedStatement)

method add*(parent: var CsCastExpression; item: CsTupleType) = # TT
  echo "in method add*(parent: var CsCastExpression; item: CsTupleType)"
  todoimpl # TODO(add: CsCastExpression, CsTupleType)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsConditionalAccessExpression)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsPrefixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsPrefixUnaryExpression)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsTypeOfExpression) = # TOE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsTypeOfExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsTypeOfExpression)

method add*(parent: var CsAccessor; item: CsGotoStatement) = # GS
  echo "in method add*(parent: var CsAccessor; item: CsGotoStatement)"
  todoimpl # TODO(add: CsAccessor, CsGotoStatement)

method add*(parent: var CsCatchFilterClause; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsCatchFilterClause; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsCatchFilterClause, CsMemberAccessExpression)

method add*(parent: var CsNamespace; item: CsEventField) = # EF
  echo "in method add*(parent: var CsNamespace; item: CsEventField)"
  todoimpl # TODO(add: CsNamespace, CsEventField)

method add*(parent: var CsUsingStatement; item: CsUnsafeStatement) = # US
  echo "in method add*(parent: var CsUsingStatement; item: CsUnsafeStatement)"
  todoimpl # TODO(add: CsUsingStatement, CsUnsafeStatement)

method add*(parent: var CsBinaryPattern; item: CsTypePattern) = # TP
  echo "in method add*(parent: var CsBinaryPattern; item: CsTypePattern)"
  todoimpl # TODO(add: CsBinaryPattern, CsTypePattern)

method add*(parent: var CsDefaultExpression; item: CsTupleType) = # TT
  echo "in method add*(parent: var CsDefaultExpression; item: CsTupleType)"
  todoimpl # TODO(add: CsDefaultExpression, CsTupleType)

method add*(parent: var CsStruct; item: CsEvent) =
  echo "in method add*(parent: var CsStruct; item: CsEvent)"
  todoimpl # TODO(add: CsStruct, CsEvent)

method add*(parent: var CsStruct; item: CsInterface) =
  echo "in method add*(parent: var CsStruct; item: CsInterface)"
  todoimpl # TODO(add: CsStruct, CsInterface)

method add*(parent: var CsOmittedArraySizeExpression; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsOmittedArraySizeExpression; item: CsGenericName)"
  todoimpl # TODO(add: CsOmittedArraySizeExpression, CsGenericName)

method add*(parent: var CsForStatement; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsForStatement; item: CsPredefinedType)"
  todoimpl # TODO(add: CsForStatement, CsPredefinedType)

method add*(parent: var CsForStatement; item: CsTryStatement) = # TS
  echo "in method add*(parent: var CsForStatement; item: CsTryStatement)"
  todoimpl # TODO(add: CsForStatement, CsTryStatement)

method add*(parent: var CsForStatement; item: CsUnsafeStatement) = # US
  echo "in method add*(parent: var CsForStatement; item: CsUnsafeStatement)"
  todoimpl # TODO(add: CsForStatement, CsUnsafeStatement)

method add*(parent: var CsElseClause; item: CsForEachStatement) = # FES
  echo "in method add*(parent: var CsElseClause; item: CsForEachStatement)"
  todoimpl # TODO(add: CsElseClause, CsForEachStatement)

method add*(parent: var CsThrowStatement; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsThrowStatement; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsThrowStatement, CsBinaryExpression)

method add*(parent: var CsIndexer; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsIndexer; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsIndexer, CsLiteralExpression)

method add*(parent: var CsIndexer; item: CsTupleType) = # TT
  echo "in method add*(parent: var CsIndexer; item: CsTupleType)"
  todoimpl # TODO(add: CsIndexer, CsTupleType)

method add*(parent: var CsCaseSwitchLabel; item: CsSizeOfExpression) = # SOE
  echo "in method add*(parent: var CsCaseSwitchLabel; item: CsSizeOfExpression)"
  todoimpl # TODO(add: CsCaseSwitchLabel, CsSizeOfExpression)

method add*(parent: var CsWithExpression; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsWithExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsWithExpression, CsInvocationExpression)

method add*(parent: var CsConditionalExpression; item: CsAnonymousMethodExpression) = # AME
  echo "in method add*(parent: var CsConditionalExpression; item: CsAnonymousMethodExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsAnonymousMethodExpression)

method add*(parent: var CsConditionalExpression; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsConditionalExpression; item: CsGenericName)"
  todoimpl # TODO(add: CsConditionalExpression, CsGenericName)

method add*(parent: var CsConditionalExpression; item: CsSizeOfExpression) = # SOE
  echo "in method add*(parent: var CsConditionalExpression; item: CsSizeOfExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsSizeOfExpression)

method add*(parent: var CsConditionalExpression; item: CsSwitchExpression) = # SE
  echo "in method add*(parent: var CsConditionalExpression; item: CsSwitchExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsSwitchExpression)

method add*(parent: var CsRelationalPattern; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsRelationalPattern; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsRelationalPattern, CsLiteralExpression)

method add*(parent: var CsConstructor; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsConstructor; item: CsCastExpression)"
  todoimpl # TODO(add: CsConstructor, CsCastExpression)

method add*(parent: var CsConstructor; item: CsGotoStatement) = # GS
  echo "in method add*(parent: var CsConstructor; item: CsGotoStatement)"
  todoimpl # TODO(add: CsConstructor, CsGotoStatement)

method add*(parent: var CsTypeConstraint; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsTypeConstraint; item: CsNullableType)"
  todoimpl # TODO(add: CsTypeConstraint, CsNullableType)

method add*(parent: var CsSimpleLambdaExpression; item: CsTypeOfExpression) = # TOE
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsTypeOfExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsTypeOfExpression)

method add*(parent: var CsRefType; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsRefType; item: CsNullableType)"
  todoimpl # TODO(add: CsRefType, CsNullableType)

method add*(parent: var CsReturnStatement; item: CsImplicitObjectCreationExpression) = # IOCE
  echo "in method add*(parent: var CsReturnStatement; item: CsImplicitObjectCreationExpression)"
  todoimpl # TODO(add: CsReturnStatement, CsImplicitObjectCreationExpression)

method add*(parent: var CsCheckedExpression; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsCheckedExpression; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsCheckedExpression, CsPostfixUnaryExpression)

method add*(parent: var CsThrowExpression; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsThrowExpression; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsThrowExpression, CsMemberAccessExpression)

method add*(parent: var CsDelegate; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsDelegate; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsDelegate, CsLiteralExpression)

method add*(parent: var CsForEachStatement; item: CsConditionalExpression) = # CE
  echo "in method add*(parent: var CsForEachStatement; item: CsConditionalExpression)"
  todoimpl # TODO(add: CsForEachStatement, CsConditionalExpression)

method add*(parent: var CsForEachStatement; item: CsTryStatement) = # TS
  echo "in method add*(parent: var CsForEachStatement; item: CsTryStatement)"
  todoimpl # TODO(add: CsForEachStatement, CsTryStatement)

method add*(parent: var CsRangeExpression; item: CsPrefixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsRangeExpression; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsRangeExpression, CsPrefixUnaryExpression)

method add*(parent: var CsTryStatement; item: CsBreakStatement) = # BS
  echo "in method add*(parent: var CsTryStatement; item: CsBreakStatement)"
  todoimpl # TODO(add: CsTryStatement, CsBreakStatement)

method add*(parent: var CsConversionOperator; item: CsLocalDeclarationStatement) = # LDS
  echo "in method add*(parent: var CsConversionOperator; item: CsLocalDeclarationStatement)"
  todoimpl # TODO(add: CsConversionOperator, CsLocalDeclarationStatement)

method add*(parent: var CsWhileStatement; item: CsBreakStatement) = # BS
  echo "in method add*(parent: var CsWhileStatement; item: CsBreakStatement)"
  todoimpl # TODO(add: CsWhileStatement, CsBreakStatement)

method add*(parent: var CsAccessor; item: CsLocalDeclarationStatement) = # LDS
  echo "in method add*(parent: var CsAccessor; item: CsLocalDeclarationStatement)"
  todoimpl # TODO(add: CsAccessor, CsLocalDeclarationStatement)

method add*(parent: var CsSubpattern; item: CsBinaryPattern) = # BP
  echo "in method add*(parent: var CsSubpattern; item: CsBinaryPattern)"
  todoimpl # TODO(add: CsSubpattern, CsBinaryPattern)

method add*(parent: var CsMethod; item: CsBreakStatement) = # BS
  echo "in method add*(parent: var CsMethod; item: CsBreakStatement)"
  todoimpl # TODO(add: CsMethod, CsBreakStatement)

method add*(parent: var CsQueryExpression; item: CsFromClause) = # FC
  echo "in method add*(parent: var CsQueryExpression; item: CsFromClause)"
  todoimpl # TODO(add: CsQueryExpression, CsFromClause)

method add*(parent: var CsBinaryPattern; item: CsRecursivePattern) = # RP
  echo "in method add*(parent: var CsBinaryPattern; item: CsRecursivePattern)"
  todoimpl # TODO(add: CsBinaryPattern, CsRecursivePattern)

method add*(parent: var CsFromClause; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsFromClause; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsFromClause, CsAwaitExpression)

method add*(parent: var CsFromClause; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsFromClause; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsFromClause, CsInvocationExpression)

method add*(parent: var CsFromClause; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsFromClause; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsFromClause, CsLiteralExpression)

method add*(parent: var CsFromClause; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsFromClause; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsFromClause, CsMemberAccessExpression)

method add*(parent: var CsQueryBody; item: CsSelectClause) = # SC
  echo "in method add*(parent: var CsQueryBody; item: CsSelectClause)"
  todoimpl # TODO(add: CsQueryBody, CsSelectClause)

method add*(parent: var CsQueryBody; item: CsJoinClause) = # JC
  echo "in method add*(parent: var CsQueryBody; item: CsJoinClause)"
  todoimpl # TODO(add: CsQueryBody, CsJoinClause)

method add*(parent: var CsSelectClause; item: CsAnonymousObjectCreationExpression) = # AOCE
  echo "in method add*(parent: var CsSelectClause; item: CsAnonymousObjectCreationExpression)"
  todoimpl # TODO(add: CsSelectClause, CsAnonymousObjectCreationExpression)

method add*(parent: var CsSelectClause; item: CsArrayCreationExpression) = # ACE
  echo "in method add*(parent: var CsSelectClause; item: CsArrayCreationExpression)"
  todoimpl # TODO(add: CsSelectClause, CsArrayCreationExpression)

method add*(parent: var CsSelectClause; item: CsConditionalExpression) = # CE
  echo "in method add*(parent: var CsSelectClause; item: CsConditionalExpression)"
  todoimpl # TODO(add: CsSelectClause, CsConditionalExpression)

method add*(parent: var CsSelectClause; item: CsTupleExpression) = # TE
  echo "in method add*(parent: var CsSelectClause; item: CsTupleExpression)"
  todoimpl # TODO(add: CsSelectClause, CsTupleExpression)

method add*(parent: var CsJoinClause; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsJoinClause; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsJoinClause, CsInvocationExpression)

method add*(parent: var CsQueryBody; item: CsFromClause) = # FC
  echo "in method add*(parent: var CsQueryBody; item: CsFromClause)"
  todoimpl # TODO(add: CsQueryBody, CsFromClause)

method add*(parent: var CsQueryBody; item: CsOrderByClause) = # OBC
  echo "in method add*(parent: var CsQueryBody; item: CsOrderByClause)"
  todoimpl # TODO(add: CsQueryBody, CsOrderByClause)

method add*(parent: var CsQueryBody; item: CsWhereClause) = # WC
  echo "in method add*(parent: var CsQueryBody; item: CsWhereClause)"
  todoimpl # TODO(add: CsQueryBody, CsWhereClause)

method add*(parent: var CsSelectClause; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsSelectClause; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsSelectClause, CsMemberAccessExpression)

method add*(parent: var CsOrderByClause; item: CsOrdering) =
  echo "in method add*(parent: var CsOrderByClause; item: CsOrdering)"
  todoimpl # TODO(add: CsOrderByClause, CsOrdering)

method add*(parent: var CsWhereClause; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsWhereClause; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsWhereClause, CsBinaryExpression)

method add*(parent: var CsWhereClause; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsWhereClause; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsWhereClause, CsInvocationExpression)

method add*(parent: var CsSelectClause; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsSelectClause; item: CsCastExpression)"
  todoimpl # TODO(add: CsSelectClause, CsCastExpression)

method add*(parent: var CsSelectClause; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsSelectClause; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsSelectClause, CsInvocationExpression)

method add*(parent: var CsFromClause; item: CsArrayCreationExpression) = # ACE
  echo "in method add*(parent: var CsFromClause; item: CsArrayCreationExpression)"
  todoimpl # TODO(add: CsFromClause, CsArrayCreationExpression)

method add*(parent: var CsFromClause; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsFromClause; item: CsPredefinedType)"
  todoimpl # TODO(add: CsFromClause, CsPredefinedType)

method add*(parent: var CsQueryBody; item: CsGroupClause) = # GC
  echo "in method add*(parent: var CsQueryBody; item: CsGroupClause)"
  todoimpl # TODO(add: CsQueryBody, CsGroupClause)

method add*(parent: var CsSelectClause; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsSelectClause; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsSelectClause, CsBinaryExpression)

method add*(parent: var CsSelectClause; item: CsInterpolatedStringExpression) = # ISE
  echo "in method add*(parent: var CsSelectClause; item: CsInterpolatedStringExpression)"
  todoimpl # TODO(add: CsSelectClause, CsInterpolatedStringExpression)

method add*(parent: var CsGroupClause; item: CsAnonymousObjectCreationExpression) = # AOCE
  echo "in method add*(parent: var CsGroupClause; item: CsAnonymousObjectCreationExpression)"
  todoimpl # TODO(add: CsGroupClause, CsAnonymousObjectCreationExpression)

method add*(parent: var CsGroupClause; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsGroupClause; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsGroupClause, CsMemberAccessExpression)

method add*(parent: var CsFromClause; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsFromClause; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsFromClause, CsImplicitArrayCreationExpression)

method add*(parent: var CsQueryBody; item: CsQueryContinuation) = # QC
  echo "in method add*(parent: var CsQueryBody; item: CsQueryContinuation)"
  todoimpl # TODO(add: CsQueryBody, CsQueryContinuation)

method add*(parent: var CsSelectClause; item: CsObjectCreationExpression) = # OCE
  echo "in method add*(parent: var CsSelectClause; item: CsObjectCreationExpression)"
  todoimpl # TODO(add: CsSelectClause, CsObjectCreationExpression)

method add*(parent: var CsQueryContinuation; item: CsQueryBody) = # QB
  echo "in method add*(parent: var CsQueryContinuation; item: CsQueryBody)"
  todoimpl # TODO(add: CsQueryContinuation, CsQueryBody)

method add*(parent: var CsGroupClause; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsGroupClause; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsGroupClause, CsLiteralExpression)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsQueryExpression) = # QE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsQueryExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsQueryExpression)

method add*(parent: var CsWhereClause; item: CsPrefixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsWhereClause; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsWhereClause, CsPrefixUnaryExpression)

method add*(parent: var CsSelectClause; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsSelectClause; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsSelectClause, CsLiteralExpression)

method add*(parent: var CsOrdering; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsOrdering; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsOrdering, CsMemberAccessExpression)

method add*(parent: var CsGroupClause; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsGroupClause; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsGroupClause, CsBinaryExpression)

method add*(parent: var CsFromClause; item: CsThisExpression) = # TE
  echo "in method add*(parent: var CsFromClause; item: CsThisExpression)"
  todoimpl # TODO(add: CsFromClause, CsThisExpression)

method add*(parent: var CsWhereClause; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsWhereClause; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsWhereClause, CsMemberAccessExpression)

method add*(parent: var CsWhereClause; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsWhereClause; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsWhereClause, CsParenthesizedExpression)

method add*(parent: var CsSelectClause; item: CsQueryExpression) = # QE
  echo "in method add*(parent: var CsSelectClause; item: CsQueryExpression)"
  todoimpl # TODO(add: CsSelectClause, CsQueryExpression)

method add*(parent: var CsOrdering; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsOrdering; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsOrdering, CsElementAccessExpression)

method add*(parent: var CsGroupClause; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsGroupClause; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsGroupClause, CsInvocationExpression)

method add*(parent: var CsOperator; item: CsPointerType) = # PT
  echo "in method add*(parent: var CsOperator; item: CsPointerType)"
  todoimpl # TODO(add: CsOperator, CsPointerType)

method add*(parent: var CsJoinClause; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsJoinClause; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsJoinClause, CsMemberAccessExpression)

method add*(parent: var CsLetClause; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsLetClause; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsLetClause, CsLiteralExpression)

method add*(parent: var CsOrdering; item: CsBinaryExpression) = # BE
  echo "in method add*(parent: var CsOrdering; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsOrdering, CsBinaryExpression)

method add*(parent: var CsJoinClause; item: CsJoinIntoClause) = # JIC
  echo "in method add*(parent: var CsJoinClause; item: CsJoinIntoClause)"
  todoimpl # TODO(add: CsJoinClause, CsJoinIntoClause)

method add*(parent: var CsTypePattern; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsTypePattern; item: CsPredefinedType)"
  todoimpl # TODO(add: CsTypePattern, CsPredefinedType)

method add*(parent: var CsArrayRankSpecifier; item: CsAssignmentExpression) = # AE
  echo "in method add*(parent: var CsArrayRankSpecifier; item: CsAssignmentExpression)"
  todoimpl # TODO(add: CsArrayRankSpecifier, CsAssignmentExpression)

method add*(parent: var CsArrayRankSpecifier; item: CsRangeExpression) = # RE
  echo "in method add*(parent: var CsArrayRankSpecifier; item: CsRangeExpression)"
  todoimpl # TODO(add: CsArrayRankSpecifier, CsRangeExpression)

method add*(parent: var CsIsPatternExpression; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsIsPatternExpression; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsIsPatternExpression, CsAwaitExpression)

method add*(parent: var CsYieldStatement; item: CsSimpleLambdaExpression) = # SLE
  echo "in method add*(parent: var CsYieldStatement; item: CsSimpleLambdaExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsSimpleLambdaExpression)

method add*(parent: var CsDoStatement; item: CsAwaitExpression) = # AE
  echo "in method add*(parent: var CsDoStatement; item: CsAwaitExpression)"
  todoimpl # TODO(add: CsDoStatement, CsAwaitExpression)

method add*(parent: var CsInitializerExpression; item: CsBaseExpression) = # BE
  echo "in method add*(parent: var CsInitializerExpression; item: CsBaseExpression)"
  todoimpl # TODO(add: CsInitializerExpression, CsBaseExpression)

method add*(parent: var CsExpressionStatement; item: CsConditionalExpression) = # CE
  echo "in method add*(parent: var CsExpressionStatement; item: CsConditionalExpression)"
  todoimpl # TODO(add: CsExpressionStatement, CsConditionalExpression)

method add*(parent: var CsSwitchStatement; item: CsBaseExpression) = # BE
  echo "in method add*(parent: var CsSwitchStatement; item: CsBaseExpression)"
  todoimpl # TODO(add: CsSwitchStatement, CsBaseExpression)

method add*(parent: var CsParenthesizedExpression; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsDefaultExpression)

method add*(parent: var CsParenthesizedExpression; item: CsRangeExpression) = # RE
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsRangeExpression)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsRangeExpression)

method add*(parent: var CsForEachVariableStatement; item: CsDeclarationExpression) = # DE
  echo "in method add*(parent: var CsForEachVariableStatement; item: CsDeclarationExpression)"
  todoimpl # TODO(add: CsForEachVariableStatement, CsDeclarationExpression)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsParenthesizedExpression)

method add*(parent: var CsAssignmentExpression; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsAssignmentExpression; item: CsPredefinedType)"
  todoimpl # TODO(add: CsAssignmentExpression, CsPredefinedType)

method add*(parent: var CsUsingStatement; item: CsLockStatement) = # LS
  echo "in method add*(parent: var CsUsingStatement; item: CsLockStatement)"
  todoimpl # TODO(add: CsUsingStatement, CsLockStatement)

method add*(parent: var CsUsingStatement; item: CsThrowStatement) = # TS
  echo "in method add*(parent: var CsUsingStatement; item: CsThrowStatement)"
  todoimpl # TODO(add: CsUsingStatement, CsThrowStatement)

method add*(parent: var CsElseClause; item: CsTryStatement) = # TS
  echo "in method add*(parent: var CsElseClause; item: CsTryStatement)"
  todoimpl # TODO(add: CsElseClause, CsTryStatement)

method add*(parent: var CsElseClause; item: CsUsingStatement) = # US
  echo "in method add*(parent: var CsElseClause; item: CsUsingStatement)"
  todoimpl # TODO(add: CsElseClause, CsUsingStatement)

method add*(parent: var CsInvocationExpression; item: CsSimpleLambdaExpression) = # SLE
  echo "in method add*(parent: var CsInvocationExpression; item: CsSimpleLambdaExpression)"
  todoimpl # TODO(add: CsInvocationExpression, CsSimpleLambdaExpression)

method add*(parent: var CsWhileStatement; item: CsCheckedStatement) = # CS
  echo "in method add*(parent: var CsWhileStatement; item: CsCheckedStatement)"
  todoimpl # TODO(add: CsWhileStatement, CsCheckedStatement)

method add*(parent: var CsWhileStatement; item: CsTryStatement) = # TS
  echo "in method add*(parent: var CsWhileStatement; item: CsTryStatement)"
  todoimpl # TODO(add: CsWhileStatement, CsTryStatement)

method add*(parent: var CsThrowStatement; item: CsSwitchExpression) = # SE
  echo "in method add*(parent: var CsThrowStatement; item: CsSwitchExpression)"
  todoimpl # TODO(add: CsThrowStatement, CsSwitchExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsCheckedExpression)

method add*(parent: var CsCheckedExpression; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsCheckedExpression; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsCheckedExpression, CsImplicitArrayCreationExpression)

method add*(parent: var CsForEachStatement; item: CsForStatement) = # FS
  echo "in method add*(parent: var CsForEachStatement; item: CsForStatement)"
  todoimpl # TODO(add: CsForEachStatement, CsForStatement)

method add*(parent: var CsForEachStatement; item: CsThrowStatement) = # TS
  echo "in method add*(parent: var CsForEachStatement; item: CsThrowStatement)"
  todoimpl # TODO(add: CsForEachStatement, CsThrowStatement)

method add*(parent: var CsWhenClause; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsWhenClause; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsWhenClause, CsMemberAccessExpression)

method add*(parent: var CsWhenClause; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsWhenClause; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsWhenClause, CsParenthesizedExpression)

method add*(parent: var CsFromClause; item: CsQueryExpression) = # QE
  echo "in method add*(parent: var CsFromClause; item: CsQueryExpression)"
  todoimpl # TODO(add: CsFromClause, CsQueryExpression)

method add*(parent: var CsLetClause; item: CsObjectCreationExpression) = # OCE
  echo "in method add*(parent: var CsLetClause; item: CsObjectCreationExpression)"
  todoimpl # TODO(add: CsLetClause, CsObjectCreationExpression)

method add*(parent: var CsFromClause; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsFromClause; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsFromClause, CsParenthesizedExpression)

method add*(parent: var CsDestructor; item: CsLocalDeclarationStatement) = # LDS
  echo "in method add*(parent: var CsDestructor; item: CsLocalDeclarationStatement)"
  todoimpl # TODO(add: CsDestructor, CsLocalDeclarationStatement)

method add*(parent: var CsAnonymousMethodExpression; item: CsLocalDeclarationStatement) = # LDS
  echo "in method add*(parent: var CsAnonymousMethodExpression; item: CsLocalDeclarationStatement)"
  todoimpl # TODO(add: CsAnonymousMethodExpression, CsLocalDeclarationStatement)

method add*(parent: var CsAnonymousMethodExpression; item: CsReturnStatement) = # RS
  echo "in method add*(parent: var CsAnonymousMethodExpression; item: CsReturnStatement)"
  todoimpl # TODO(add: CsAnonymousMethodExpression, CsReturnStatement)

method add*(parent: var CsConversionOperator; item: CsThrowStatement) = # TS
  echo "in method add*(parent: var CsConversionOperator; item: CsThrowStatement)"
  todoimpl # TODO(add: CsConversionOperator, CsThrowStatement)

method add*(parent: var CsAccessor; item: CsSwitchStatement) = # SS
  echo "in method add*(parent: var CsAccessor; item: CsSwitchStatement)"
  todoimpl # TODO(add: CsAccessor, CsSwitchStatement)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsIfStatement) = # IS
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsIfStatement)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsIfStatement)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsLocalDeclarationStatement) = # LDS
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsLocalDeclarationStatement)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsLocalDeclarationStatement)

method add*(parent: var CsDestructor; item: CsThrowStatement) = # TS
  echo "in method add*(parent: var CsDestructor; item: CsThrowStatement)"
  todoimpl # TODO(add: CsDestructor, CsThrowStatement)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsTryStatement) = # TS
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsTryStatement)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsTryStatement)

method add*(parent: var CsTryStatement; item: CsReturnStatement) = # RS
  echo "in method add*(parent: var CsTryStatement; item: CsReturnStatement)"
  todoimpl # TODO(add: CsTryStatement, CsReturnStatement)

method add*(parent: var CsConversionOperator; item: CsYieldStatement) = # YS
  echo "in method add*(parent: var CsConversionOperator; item: CsYieldStatement)"
  todoimpl # TODO(add: CsConversionOperator, CsYieldStatement)

method add*(parent: var CsConstructor; item: CsSwitchStatement) = # SS
  echo "in method add*(parent: var CsConstructor; item: CsSwitchStatement)"
  todoimpl # TODO(add: CsConstructor, CsSwitchStatement)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsReturnStatement) = # RS
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsReturnStatement)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsReturnStatement)

method add*(parent: var CsGlobalStatement; item: CsLocalDeclarationStatement) = # LDS
  echo "in method add*(parent: var CsGlobalStatement; item: CsLocalDeclarationStatement)"
  todoimpl # TODO(add: CsGlobalStatement, CsLocalDeclarationStatement)

method add*(parent: var CsMethod; item: CsCheckedStatement) = # CS
  echo "in method add*(parent: var CsMethod; item: CsCheckedStatement)"
  todoimpl # TODO(add: CsMethod, CsCheckedStatement)

method add*(parent: var CsMethod; item: CsLabeledStatement) = # LS
  echo "in method add*(parent: var CsMethod; item: CsLabeledStatement)"
  todoimpl # TODO(add: CsMethod, CsLabeledStatement)

method add*(parent: var CsGlobalStatement; item: CsExpressionStatement) = # ES
  echo "in method add*(parent: var CsGlobalStatement; item: CsExpressionStatement)"
  todoimpl # TODO(add: CsGlobalStatement, CsExpressionStatement)

method add*(parent: var CsLabeledStatement; item: CsReturnStatement) = # RS
  echo "in method add*(parent: var CsLabeledStatement; item: CsReturnStatement)"
  todoimpl # TODO(add: CsLabeledStatement, CsReturnStatement)

method add*(parent: var CsParenthesizedExpression; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsGenericName)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsGenericName)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsLabeledStatement) = # LS
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsLabeledStatement)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsLabeledStatement)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsUsingStatement) = # US
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsUsingStatement)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsUsingStatement)

method add*(parent: var CsAnonymousMethodExpression; item: CsGotoStatement) = # GS
  echo "in method add*(parent: var CsAnonymousMethodExpression; item: CsGotoStatement)"
  todoimpl # TODO(add: CsAnonymousMethodExpression, CsGotoStatement)

method add*(parent: var CsLabeledStatement; item: CsIfStatement) = # IS
  echo "in method add*(parent: var CsLabeledStatement; item: CsIfStatement)"
  todoimpl # TODO(add: CsLabeledStatement, CsIfStatement)

method add*(parent: var CsExpressionStatement; item: CsArrayCreationExpression) = # ACE
  echo "in method add*(parent: var CsExpressionStatement; item: CsArrayCreationExpression)"
  todoimpl # TODO(add: CsExpressionStatement, CsArrayCreationExpression)

method add*(parent: var CsExpressionStatement; item: CsParenthesizedLambdaExpression) = # PLE
  echo "in method add*(parent: var CsExpressionStatement; item: CsParenthesizedLambdaExpression)"
  todoimpl # TODO(add: CsExpressionStatement, CsParenthesizedLambdaExpression)

method add*(parent: var CsGlobalStatement; item: CsEmptyStatement) = # ES
  echo "in method add*(parent: var CsGlobalStatement; item: CsEmptyStatement)"
  todoimpl # TODO(add: CsGlobalStatement, CsEmptyStatement)

method add*(parent: var CsGlobalStatement; item: CsLabeledStatement) = # LS
  echo "in method add*(parent: var CsGlobalStatement; item: CsLabeledStatement)"
  todoimpl # TODO(add: CsGlobalStatement, CsLabeledStatement)

method add*(parent: var CsGlobalStatement; item: CsLocalFunctionStatement) = # LFS
  echo "in method add*(parent: var CsGlobalStatement; item: CsLocalFunctionStatement)"
  todoimpl # TODO(add: CsGlobalStatement, CsLocalFunctionStatement)

method add*(parent: var CsGlobalStatement; item: CsTryStatement) = # TS
  echo "in method add*(parent: var CsGlobalStatement; item: CsTryStatement)"
  todoimpl # TODO(add: CsGlobalStatement, CsTryStatement)

method add*(parent: var CsGlobalStatement; item: CsUsingStatement) = # US
  echo "in method add*(parent: var CsGlobalStatement; item: CsUsingStatement)"
  todoimpl # TODO(add: CsGlobalStatement, CsUsingStatement)

method add*(parent: var CsParenthesizedExpression; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsPredefinedType)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsPredefinedType)

method add*(parent: var CsTryStatement; item: CsTryStatement) = # TS
  echo "in method add*(parent: var CsTryStatement; item: CsTryStatement)"
  todoimpl # TODO(add: CsTryStatement, CsTryStatement)

method add*(parent: var CsIfStatement; item: CsDoStatement) = # DS
  echo "in method add*(parent: var CsIfStatement; item: CsDoStatement)"
  todoimpl # TODO(add: CsIfStatement, CsDoStatement)

method add*(parent: var CsIfStatement; item: CsLabeledStatement) = # LS
  echo "in method add*(parent: var CsIfStatement; item: CsLabeledStatement)"
  todoimpl # TODO(add: CsIfStatement, CsLabeledStatement)

method add*(parent: var CsForStatement; item: CsGotoStatement) = # GS
  echo "in method add*(parent: var CsForStatement; item: CsGotoStatement)"
  todoimpl # TODO(add: CsForStatement, CsGotoStatement)

method add*(parent: var CsForStatement; item: CsReturnStatement) = # RS
  echo "in method add*(parent: var CsForStatement; item: CsReturnStatement)"
  todoimpl # TODO(add: CsForStatement, CsReturnStatement)

method add*(parent: var CsForEachStatement; item: CsCheckedStatement) = # CS
  echo "in method add*(parent: var CsForEachStatement; item: CsCheckedStatement)"
  todoimpl # TODO(add: CsForEachStatement, CsCheckedStatement)

method add*(parent: var CsForEachStatement; item: CsLocalDeclarationStatement) = # LDS
  echo "in method add*(parent: var CsForEachStatement; item: CsLocalDeclarationStatement)"
  todoimpl # TODO(add: CsForEachStatement, CsLocalDeclarationStatement)

method add*(parent: var CsGlobalStatement; item: CsReturnStatement) = # RS
  echo "in method add*(parent: var CsGlobalStatement; item: CsReturnStatement)"
  todoimpl # TODO(add: CsGlobalStatement, CsReturnStatement)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsSwitchStatement) = # SS
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsSwitchStatement)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsSwitchStatement)

method add*(parent: var CsAnonymousMethodExpression; item: CsLabeledStatement) = # LS
  echo "in method add*(parent: var CsAnonymousMethodExpression; item: CsLabeledStatement)"
  todoimpl # TODO(add: CsAnonymousMethodExpression, CsLabeledStatement)

method add*(parent: var CsAnonymousMethodExpression; item: CsSwitchStatement) = # SS
  echo "in method add*(parent: var CsAnonymousMethodExpression; item: CsSwitchStatement)"
  todoimpl # TODO(add: CsAnonymousMethodExpression, CsSwitchStatement)

method add*(parent: var CsLabeledStatement; item: CsLocalDeclarationStatement) = # LDS
  echo "in method add*(parent: var CsLabeledStatement; item: CsLocalDeclarationStatement)"
  todoimpl # TODO(add: CsLabeledStatement, CsLocalDeclarationStatement)

method add*(parent: var CsLabeledStatement; item: CsSwitchStatement) = # SS
  echo "in method add*(parent: var CsLabeledStatement; item: CsSwitchStatement)"
  todoimpl # TODO(add: CsLabeledStatement, CsSwitchStatement)

method add*(parent: var CsLabeledStatement; item: CsThrowStatement) = # TS
  echo "in method add*(parent: var CsLabeledStatement; item: CsThrowStatement)"
  todoimpl # TODO(add: CsLabeledStatement, CsThrowStatement)

method add*(parent: var CsDestructor; item: CsLockStatement) = # LS
  echo "in method add*(parent: var CsDestructor; item: CsLockStatement)"
  todoimpl # TODO(add: CsDestructor, CsLockStatement)

method add*(parent: var CsGlobalStatement; item: CsIfStatement) = # IS
  echo "in method add*(parent: var CsGlobalStatement; item: CsIfStatement)"
  todoimpl # TODO(add: CsGlobalStatement, CsIfStatement)

method add*(parent: var CsLocalFunctionStatement; item: CsParameterList) = # PL
  echo "in method add*(parent: var CsLocalFunctionStatement; item: CsParameterList)"
  todoimpl # TODO(add: CsLocalFunctionStatement, CsParameterList)

method add*(parent: var CsLocalFunctionStatement; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsLocalFunctionStatement; item: CsPredefinedType)"
  todoimpl # TODO(add: CsLocalFunctionStatement, CsPredefinedType)

method add*(parent: var CsLocalFunctionStatement; item: CsTupleType) = # TT
  echo "in method add*(parent: var CsLocalFunctionStatement; item: CsTupleType)"
  todoimpl # TODO(add: CsLocalFunctionStatement, CsTupleType)

method add*(parent: var CsAccessor; item: CsCheckedStatement) = # CS
  echo "in method add*(parent: var CsAccessor; item: CsCheckedStatement)"
  todoimpl # TODO(add: CsAccessor, CsCheckedStatement)

method add*(parent: var CsOperator; item: CsLocalDeclarationStatement) = # LDS
  echo "in method add*(parent: var CsOperator; item: CsLocalDeclarationStatement)"
  todoimpl # TODO(add: CsOperator, CsLocalDeclarationStatement)

method add*(parent: var CsTryStatement; item: CsCheckedStatement) = # CS
  echo "in method add*(parent: var CsTryStatement; item: CsCheckedStatement)"
  todoimpl # TODO(add: CsTryStatement, CsCheckedStatement)

method add*(parent: var CsTryStatement; item: CsGotoStatement) = # GS
  echo "in method add*(parent: var CsTryStatement; item: CsGotoStatement)"
  todoimpl # TODO(add: CsTryStatement, CsGotoStatement)

method add*(parent: var CsTryStatement; item: CsLocalDeclarationStatement) = # LDS
  echo "in method add*(parent: var CsTryStatement; item: CsLocalDeclarationStatement)"
  todoimpl # TODO(add: CsTryStatement, CsLocalDeclarationStatement)

method add*(parent: var CsTryStatement; item: CsUsingStatement) = # US
  echo "in method add*(parent: var CsTryStatement; item: CsUsingStatement)"
  todoimpl # TODO(add: CsTryStatement, CsUsingStatement)

method add*(parent: var CsElseClause; item: CsLabeledStatement) = # LS
  echo "in method add*(parent: var CsElseClause; item: CsLabeledStatement)"
  todoimpl # TODO(add: CsElseClause, CsLabeledStatement)

method add*(parent: var CsConstructor; item: CsCheckedStatement) = # CS
  echo "in method add*(parent: var CsConstructor; item: CsCheckedStatement)"
  todoimpl # TODO(add: CsConstructor, CsCheckedStatement)

method add*(parent: var CsLetClause; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsLetClause; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsLetClause, CsElementAccessExpression)

method add*(parent: var CsLetClause; item: CsTypeOfExpression) = # TOE
  echo "in method add*(parent: var CsLetClause; item: CsTypeOfExpression)"
  todoimpl # TODO(add: CsLetClause, CsTypeOfExpression)

method add*(parent: var CsRefExpression; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsRefExpression; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsRefExpression, CsPostfixUnaryExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsWhileStatement) = # WS
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsWhileStatement)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsWhileStatement)

method add*(parent: var CsParenthesizedExpression; item: CsAnonymousObjectCreationExpression) = # AOCE
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsAnonymousObjectCreationExpression)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsAnonymousObjectCreationExpression)

method add*(parent: var CsFromClause; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsFromClause; item: CsNullableType)"
  todoimpl # TODO(add: CsFromClause, CsNullableType)

method add*(parent: var CsWhereClause; item: CsIsPatternExpression) = # IPE
  echo "in method add*(parent: var CsWhereClause; item: CsIsPatternExpression)"
  todoimpl # TODO(add: CsWhereClause, CsIsPatternExpression)

method add*(parent: var CsElseClause; item: CsCheckedStatement) = # CS
  echo "in method add*(parent: var CsElseClause; item: CsCheckedStatement)"
  todoimpl # TODO(add: CsElseClause, CsCheckedStatement)

method add*(parent: var CsOrdering; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsOrdering; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsOrdering, CsInvocationExpression)

method add*(parent: var CsLetClause; item: CsAnonymousObjectCreationExpression) = # AOCE
  echo "in method add*(parent: var CsLetClause; item: CsAnonymousObjectCreationExpression)"
  todoimpl # TODO(add: CsLetClause, CsAnonymousObjectCreationExpression)

method add*(parent: var CsLabeledStatement; item: CsForEachVariableStatement) = # FEVS
  echo "in method add*(parent: var CsLabeledStatement; item: CsForEachVariableStatement)"
  todoimpl # TODO(add: CsLabeledStatement, CsForEachVariableStatement)

method add*(parent: var CsLabeledStatement; item: CsLabeledStatement) = # LS
  echo "in method add*(parent: var CsLabeledStatement; item: CsLabeledStatement)"
  todoimpl # TODO(add: CsLabeledStatement, CsLabeledStatement)

method add*(parent: var CsLabeledStatement; item: CsTryStatement) = # TS
  echo "in method add*(parent: var CsLabeledStatement; item: CsTryStatement)"
  todoimpl # TODO(add: CsLabeledStatement, CsTryStatement)

method add*(parent: var CsLabeledStatement; item: CsWhileStatement) = # WS
  echo "in method add*(parent: var CsLabeledStatement; item: CsWhileStatement)"
  todoimpl # TODO(add: CsLabeledStatement, CsWhileStatement)

method add*(parent: var CsConversionOperator; item: CsSwitchStatement) = # SS
  echo "in method add*(parent: var CsConversionOperator; item: CsSwitchStatement)"
  todoimpl # TODO(add: CsConversionOperator, CsSwitchStatement)

method add*(parent: var CsForEachVariableStatement; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsForEachVariableStatement; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsForEachVariableStatement, CsMemberAccessExpression)

method add*(parent: var CsLocalFunctionStatement; item: CsArrowExpressionClause) = # AEC
  echo "in method add*(parent: var CsLocalFunctionStatement; item: CsArrowExpressionClause)"
  todoimpl # TODO(add: CsLocalFunctionStatement, CsArrowExpressionClause)

method add*(parent: var CsLocalFunctionStatement; item: CsGenericName) = # GN
  echo "in method add*(parent: var CsLocalFunctionStatement; item: CsGenericName)"
  todoimpl # TODO(add: CsLocalFunctionStatement, CsGenericName)

method add*(parent: var CsTryStatement; item: CsLabeledStatement) = # LS
  echo "in method add*(parent: var CsTryStatement; item: CsLabeledStatement)"
  todoimpl # TODO(add: CsTryStatement, CsLabeledStatement)

method add*(parent: var CsTryStatement; item: CsSwitchStatement) = # SS
  echo "in method add*(parent: var CsTryStatement; item: CsSwitchStatement)"
  todoimpl # TODO(add: CsTryStatement, CsSwitchStatement)

method add*(parent: var CsTryStatement; item: CsWhileStatement) = # WS
  echo "in method add*(parent: var CsTryStatement; item: CsWhileStatement)"
  todoimpl # TODO(add: CsTryStatement, CsWhileStatement)

method add*(parent: var CsForStatement; item: CsDoStatement) = # DS
  echo "in method add*(parent: var CsForStatement; item: CsDoStatement)"
  todoimpl # TODO(add: CsForStatement, CsDoStatement)

method add*(parent: var CsForStatement; item: CsLabeledStatement) = # LS
  echo "in method add*(parent: var CsForStatement; item: CsLabeledStatement)"
  todoimpl # TODO(add: CsForStatement, CsLabeledStatement)

method add*(parent: var CsElseClause; item: CsDoStatement) = # DS
  echo "in method add*(parent: var CsElseClause; item: CsDoStatement)"
  todoimpl # TODO(add: CsElseClause, CsDoStatement)

method add*(parent: var CsCheckedExpression; item: CsAnonymousObjectCreationExpression) = # AOCE
  echo "in method add*(parent: var CsCheckedExpression; item: CsAnonymousObjectCreationExpression)"
  todoimpl # TODO(add: CsCheckedExpression, CsAnonymousObjectCreationExpression)

method add*(parent: var CsForEachStatement; item: CsDoStatement) = # DS
  echo "in method add*(parent: var CsForEachStatement; item: CsDoStatement)"
  todoimpl # TODO(add: CsForEachStatement, CsDoStatement)

method add*(parent: var CsJoinClause; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsJoinClause; item: CsPredefinedType)"
  todoimpl # TODO(add: CsJoinClause, CsPredefinedType)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsLockStatement) = # LS
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsLockStatement)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsLockStatement)

method add*(parent: var CsLabeledStatement; item: CsForStatement) = # FS
  echo "in method add*(parent: var CsLabeledStatement; item: CsForStatement)"
  todoimpl # TODO(add: CsLabeledStatement, CsForStatement)

method add*(parent: var CsGlobalStatement; item: CsBreakStatement) = # BS
  echo "in method add*(parent: var CsGlobalStatement; item: CsBreakStatement)"
  todoimpl # TODO(add: CsGlobalStatement, CsBreakStatement)

method add*(parent: var CsGlobalStatement; item: CsForEachStatement) = # FES
  echo "in method add*(parent: var CsGlobalStatement; item: CsForEachStatement)"
  todoimpl # TODO(add: CsGlobalStatement, CsForEachStatement)

method add*(parent: var CsProperty; item: CsAliasQualifiedName) = # AQN
  echo "in method add*(parent: var CsProperty; item: CsAliasQualifiedName)"
  todoimpl # TODO(add: CsProperty, CsAliasQualifiedName)

method add*(parent: var CsCastExpression; item: CsInterpolatedStringExpression) = # ISE
  echo "in method add*(parent: var CsCastExpression; item: CsInterpolatedStringExpression)"
  todoimpl # TODO(add: CsCastExpression, CsInterpolatedStringExpression)

method add*(parent: var CsOperator; item: CsCheckedStatement) = # CS
  echo "in method add*(parent: var CsOperator; item: CsCheckedStatement)"
  todoimpl # TODO(add: CsOperator, CsCheckedStatement)

method add*(parent: var CsTryStatement; item: CsLockStatement) = # LS
  echo "in method add*(parent: var CsTryStatement; item: CsLockStatement)"
  todoimpl # TODO(add: CsTryStatement, CsLockStatement)

method add*(parent: var CsBinaryPattern; item: CsConstantPattern) = # CP
  echo "in method add*(parent: var CsBinaryPattern; item: CsConstantPattern)"
  todoimpl # TODO(add: CsBinaryPattern, CsConstantPattern)

method add*(parent: var CsElseClause; item: CsLockStatement) = # LS
  echo "in method add*(parent: var CsElseClause; item: CsLockStatement)"
  todoimpl # TODO(add: CsElseClause, CsLockStatement)

method add*(parent: var CsRefType; item: CsTupleType) = # TT
  echo "in method add*(parent: var CsRefType; item: CsTupleType)"
  todoimpl # TODO(add: CsRefType, CsTupleType)

method add*(parent: var CsForEachStatement; item: CsWhileStatement) = # WS
  echo "in method add*(parent: var CsForEachStatement; item: CsWhileStatement)"
  todoimpl # TODO(add: CsForEachStatement, CsWhileStatement)

method add*(parent: var CsExpressionStatement; item: CsRangeExpression) = # RE
  echo "in method add*(parent: var CsExpressionStatement; item: CsRangeExpression)"
  todoimpl # TODO(add: CsExpressionStatement, CsRangeExpression)

method add*(parent: var CsGlobalStatement; item: CsForEachVariableStatement) = # FEVS
  echo "in method add*(parent: var CsGlobalStatement; item: CsForEachVariableStatement)"
  todoimpl # TODO(add: CsGlobalStatement, CsForEachVariableStatement)

method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsAnonymousObjectMemberDeclarator; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsAnonymousObjectMemberDeclarator, CsCheckedExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsCheckedExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsDoStatement) = # DS
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsDoStatement)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsDoStatement)

method add*(parent: var CsArrayType; item: CsAliasQualifiedName) = # AQN
  echo "in method add*(parent: var CsArrayType; item: CsAliasQualifiedName)"
  todoimpl # TODO(add: CsArrayType, CsAliasQualifiedName)

method add*(parent: var CsTryStatement; item: CsDoStatement) = # DS
  echo "in method add*(parent: var CsTryStatement; item: CsDoStatement)"
  todoimpl # TODO(add: CsTryStatement, CsDoStatement)

method add*(parent: var CsConstructor; item: CsLabeledStatement) = # LS
  echo "in method add*(parent: var CsConstructor; item: CsLabeledStatement)"
  todoimpl # TODO(add: CsConstructor, CsLabeledStatement)

method add*(parent: var CsForEachStatement; item: CsLockStatement) = # LS
  echo "in method add*(parent: var CsForEachStatement; item: CsLockStatement)"
  todoimpl # TODO(add: CsForEachStatement, CsLockStatement)

method add*(parent: var CsJoinClause; item: CsAnonymousObjectCreationExpression) = # AOCE
  echo "in method add*(parent: var CsJoinClause; item: CsAnonymousObjectCreationExpression)"
  todoimpl # TODO(add: CsJoinClause, CsAnonymousObjectCreationExpression)

method add*(parent: var CsArrowExpressionClause; item: CsAnonymousMethodExpression) = # AME
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsAnonymousMethodExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsAnonymousMethodExpression)

method add*(parent: var CsParameter; item: CsFunctionPointerType) = # FPT
  echo "in method add*(parent: var CsParameter; item: CsFunctionPointerType)"
  todoimpl # TODO(add: CsParameter, CsFunctionPointerType)

method add*(parent: var CsJoinClause; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsJoinClause; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsJoinClause, CsLiteralExpression)

method add*(parent: var CsExpressionStatement; item: CsBaseExpression) = # BE
  echo "in method add*(parent: var CsExpressionStatement; item: CsBaseExpression)"
  todoimpl # TODO(add: CsExpressionStatement, CsBaseExpression)

method add*(parent: var CsGlobalStatement; item: CsForStatement) = # FS
  echo "in method add*(parent: var CsGlobalStatement; item: CsForStatement)"
  todoimpl # TODO(add: CsGlobalStatement, CsForStatement)

method add*(parent: var CsRefValueExpression; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsRefValueExpression; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsRefValueExpression, CsParenthesizedExpression)

method add*(parent: var CsElementAccessExpression; item: CsRefValueExpression) = # RVE
  echo "in method add*(parent: var CsElementAccessExpression; item: CsRefValueExpression)"
  todoimpl # TODO(add: CsElementAccessExpression, CsRefValueExpression)

method add*(parent: var CsAnonymousMethodExpression; item: CsWhileStatement) = # WS
  echo "in method add*(parent: var CsAnonymousMethodExpression; item: CsWhileStatement)"
  todoimpl # TODO(add: CsAnonymousMethodExpression, CsWhileStatement)

method add*(parent: var CsBinaryExpression; item: CsRefTypeExpression) = # RTE
  echo "in method add*(parent: var CsBinaryExpression; item: CsRefTypeExpression)"
  todoimpl # TODO(add: CsBinaryExpression, CsRefTypeExpression)

method add*(parent: var CsUsingStatement; item: CsLocalDeclarationStatement) = # LDS
  echo "in method add*(parent: var CsUsingStatement; item: CsLocalDeclarationStatement)"
  todoimpl # TODO(add: CsUsingStatement, CsLocalDeclarationStatement)

method add*(parent: var CsStruct; item: CsDestructor) =
  echo "in method add*(parent: var CsStruct; item: CsDestructor)"
  todoimpl # TODO(add: CsStruct, CsDestructor)

method add*(parent: var CsForStatement; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsForStatement; item: CsCastExpression)"
  todoimpl # TODO(add: CsForStatement, CsCastExpression)

method add*(parent: var CsForStatement; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsForStatement; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsForStatement, CsElementAccessExpression)

method add*(parent: var CsWhileStatement; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsWhileStatement; item: CsCastExpression)"
  todoimpl # TODO(add: CsWhileStatement, CsCastExpression)

method add*(parent: var CsWhileStatement; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsWhileStatement; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsWhileStatement, CsCheckedExpression)

method add*(parent: var CsWhileStatement; item: CsReturnStatement) = # RS
  echo "in method add*(parent: var CsWhileStatement; item: CsReturnStatement)"
  todoimpl # TODO(add: CsWhileStatement, CsReturnStatement)

method add*(parent: var CsWhileStatement; item: CsWhileStatement) = # WS
  echo "in method add*(parent: var CsWhileStatement; item: CsWhileStatement)"
  todoimpl # TODO(add: CsWhileStatement, CsWhileStatement)

method add*(parent: var CsConditionalExpression; item: CsMakeRefExpression) = # MRE
  echo "in method add*(parent: var CsConditionalExpression; item: CsMakeRefExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsMakeRefExpression)

method add*(parent: var CsRefValueExpression; item: CsMakeRefExpression) = # MRE
  echo "in method add*(parent: var CsRefValueExpression; item: CsMakeRefExpression)"
  todoimpl # TODO(add: CsRefValueExpression, CsMakeRefExpression)

method add*(parent: var CsDoStatement; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsDoStatement; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsDoStatement, CsElementAccessExpression)

method add*(parent: var CsExpressionStatement; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsExpressionStatement; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsExpressionStatement, CsImplicitArrayCreationExpression)

method add*(parent: var CsSelectClause; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsSelectClause; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsSelectClause, CsElementAccessExpression)

method add*(parent: var CsAssignmentExpression; item: CsMakeRefExpression) = # MRE
  echo "in method add*(parent: var CsAssignmentExpression; item: CsMakeRefExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsMakeRefExpression)

method add*(parent: var CsFunctionPointerType; item: CsParameter) =
  echo "in method add*(parent: var CsFunctionPointerType; item: CsParameter)"
  todoimpl # TODO(add: CsFunctionPointerType, CsParameter)

method add*(parent: var CsMakeRefExpression; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsMakeRefExpression; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsMakeRefExpression, CsElementAccessExpression)

method add*(parent: var CsWhileStatement; item: CsThrowStatement) = # TS
  echo "in method add*(parent: var CsWhileStatement; item: CsThrowStatement)"
  todoimpl # TODO(add: CsWhileStatement, CsThrowStatement)

method add*(parent: var CsInterpolation; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsInterpolation; item: CsPredefinedType)"
  todoimpl # TODO(add: CsInterpolation, CsPredefinedType)

method add*(parent: var CsIsPatternExpression; item: CsBinaryPattern) = # BP
  echo "in method add*(parent: var CsIsPatternExpression; item: CsBinaryPattern)"
  todoimpl # TODO(add: CsIsPatternExpression, CsBinaryPattern)

method add*(parent: var CsRefValueExpression; item: CsArrayType) = # AT
  echo "in method add*(parent: var CsRefValueExpression; item: CsArrayType)"
  todoimpl # TODO(add: CsRefValueExpression, CsArrayType)

method add*(parent: var CsDoStatement; item: CsCastExpression) = # CE
  echo "in method add*(parent: var CsDoStatement; item: CsCastExpression)"
  todoimpl # TODO(add: CsDoStatement, CsCastExpression)

method add*(parent: var CsDoStatement; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsDoStatement; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsDoStatement, CsCheckedExpression)

method add*(parent: var CsDoStatement; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsDoStatement; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsDoStatement, CsParenthesizedExpression)

method add*(parent: var CsAnonymousMethodExpression; item: CsUsingStatement) = # US
  echo "in method add*(parent: var CsAnonymousMethodExpression; item: CsUsingStatement)"
  todoimpl # TODO(add: CsAnonymousMethodExpression, CsUsingStatement)

method add*(parent: var CsBinaryExpression; item: CsRefValueExpression) = # RVE
  echo "in method add*(parent: var CsBinaryExpression; item: CsRefValueExpression)"
  todoimpl # TODO(add: CsBinaryExpression, CsRefValueExpression)

method add*(parent: var CsUsingStatement; item: CsForEachStatement) = # FES
  echo "in method add*(parent: var CsUsingStatement; item: CsForEachStatement)"
  todoimpl # TODO(add: CsUsingStatement, CsForEachStatement)

method add*(parent: var CsForStatement; item: CsObjectCreationExpression) = # OCE
  echo "in method add*(parent: var CsForStatement; item: CsObjectCreationExpression)"
  todoimpl # TODO(add: CsForStatement, CsObjectCreationExpression)

method add*(parent: var CsMakeRefExpression; item: CsMemberAccessExpression) = # MAE
  echo "in method add*(parent: var CsMakeRefExpression; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsMakeRefExpression, CsMemberAccessExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsPostfixUnaryExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsSimpleLambdaExpression) = # SLE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsSimpleLambdaExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsSimpleLambdaExpression)

method add*(parent: var CsAnonymousMethodExpression; item: CsLockStatement) = # LS
  echo "in method add*(parent: var CsAnonymousMethodExpression; item: CsLockStatement)"
  todoimpl # TODO(add: CsAnonymousMethodExpression, CsLockStatement)

method add*(parent: var CsSwitchStatement; item: CsTupleExpression) = # TE
  echo "in method add*(parent: var CsSwitchStatement; item: CsTupleExpression)"
  todoimpl # TODO(add: CsSwitchStatement, CsTupleExpression)

method add*(parent: var CsFromClause; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsFromClause; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsFromClause, CsConditionalAccessExpression)

method add*(parent: var CsAssignmentExpression; item: CsStackAllocArrayCreationExpression) = # SAACE
  echo "in method add*(parent: var CsAssignmentExpression; item: CsStackAllocArrayCreationExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsStackAllocArrayCreationExpression)

method add*(parent: var CsCaseSwitchLabel; item: CsDefaultExpression) = # DE
  echo "in method add*(parent: var CsCaseSwitchLabel; item: CsDefaultExpression)"
  todoimpl # TODO(add: CsCaseSwitchLabel, CsDefaultExpression)

method add*(parent: var CsConditionalExpression; item: CsRefValueExpression) = # RVE
  echo "in method add*(parent: var CsConditionalExpression; item: CsRefValueExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsRefValueExpression)

method add*(parent: var CsThrowExpression; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsThrowExpression; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsThrowExpression, CsPostfixUnaryExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsCheckedExpression)

method add*(parent: var CsSwitchExpressionArm; item: CsSwitchExpression) = # SE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsSwitchExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsSwitchExpression)

method add*(parent: var CsGroupClause; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsGroupClause; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsGroupClause, CsParenthesizedExpression)

method add*(parent: var CsProperty; item: CsReturnStatement) = # RS
  echo "in method add*(parent: var CsProperty; item: CsReturnStatement)"
  todoimpl # TODO(add: CsProperty, CsReturnStatement)

method add*(parent: var CsUnaryPattern; item: CsRecursivePattern) = # RP
  echo "in method add*(parent: var CsUnaryPattern; item: CsRecursivePattern)"
  todoimpl # TODO(add: CsUnaryPattern, CsRecursivePattern)

method add*(parent: var CsBinaryPattern; item: CsRelationalPattern) = # RP
  echo "in method add*(parent: var CsBinaryPattern; item: CsRelationalPattern)"
  todoimpl # TODO(add: CsBinaryPattern, CsRelationalPattern)

method add*(parent: var CsBinaryPattern; item: CsUnaryPattern) = # UP
  echo "in method add*(parent: var CsBinaryPattern; item: CsUnaryPattern)"
  todoimpl # TODO(add: CsBinaryPattern, CsUnaryPattern)

method add*(parent: var CsIndexer; item: CsLockStatement) = # LS
  echo "in method add*(parent: var CsIndexer; item: CsLockStatement)"
  todoimpl # TODO(add: CsIndexer, CsLockStatement)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsThrowStatement) = # TS
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsThrowStatement)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsThrowStatement)

method add*(parent: var CsGlobalStatement; item: CsThrowStatement) = # TS
  echo "in method add*(parent: var CsGlobalStatement; item: CsThrowStatement)"
  todoimpl # TODO(add: CsGlobalStatement, CsThrowStatement)

method add*(parent: var CsArrowExpressionClause; item: CsAnonymousObjectCreationExpression) = # AOCE
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsAnonymousObjectCreationExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsAnonymousObjectCreationExpression)

method add*(parent: var CsTryStatement; item: CsThrowStatement) = # TS
  echo "in method add*(parent: var CsTryStatement; item: CsThrowStatement)"
  todoimpl # TODO(add: CsTryStatement, CsThrowStatement)

method add*(parent: var CsVariable; item: CsFunctionPointerType) = # FPT
  echo "in method add*(parent: var CsVariable; item: CsFunctionPointerType)"
  todoimpl # TODO(add: CsVariable, CsFunctionPointerType)

method add*(parent: var CsInitializerExpression; item: CsPredefinedType) = # PT
  echo "in method add*(parent: var CsInitializerExpression; item: CsPredefinedType)"
  todoimpl # TODO(add: CsInitializerExpression, CsPredefinedType)

method add*(parent: var CsCastExpression; item: CsFunctionPointerType) = # FPT
  echo "in method add*(parent: var CsCastExpression; item: CsFunctionPointerType)"
  todoimpl # TODO(add: CsCastExpression, CsFunctionPointerType)

method add*(parent: var CsLabeledStatement; item: CsForEachStatement) = # FES
  echo "in method add*(parent: var CsLabeledStatement; item: CsForEachStatement)"
  todoimpl # TODO(add: CsLabeledStatement, CsForEachStatement)

method add*(parent: var CsForEachStatement; item: CsContinueStatement) = # CS
  echo "in method add*(parent: var CsForEachStatement; item: CsContinueStatement)"
  todoimpl # TODO(add: CsForEachStatement, CsContinueStatement)

method add*(parent: var CsForStatement; item: CsRangeExpression) = # RE
  echo "in method add*(parent: var CsForStatement; item: CsRangeExpression)"
  todoimpl # TODO(add: CsForStatement, CsRangeExpression)

method add*(parent: var CsForStatement; item: CsImplicitArrayCreationExpression) = # IACE
  echo "in method add*(parent: var CsForStatement; item: CsImplicitArrayCreationExpression)"
  todoimpl # TODO(add: CsForStatement, CsImplicitArrayCreationExpression)

method add*(parent: var CsProperty; item: CsForStatement) = # FS
  echo "in method add*(parent: var CsProperty; item: CsForStatement)"
  todoimpl # TODO(add: CsProperty, CsForStatement)

method add*(parent: var CsOperator; item: CsThrowStatement) = # TS
  echo "in method add*(parent: var CsOperator; item: CsThrowStatement)"
  todoimpl # TODO(add: CsOperator, CsThrowStatement)

method add*(parent: var CsDestructor; item: CsIfStatement) = # IS
  echo "in method add*(parent: var CsDestructor; item: CsIfStatement)"
  todoimpl # TODO(add: CsDestructor, CsIfStatement)

method add*(parent: var CsDestructor; item: CsTryStatement) = # TS
  echo "in method add*(parent: var CsDestructor; item: CsTryStatement)"
  todoimpl # TODO(add: CsDestructor, CsTryStatement)

method add*(parent: var CsConversionOperator; item: CsIfStatement) = # IS
  echo "in method add*(parent: var CsConversionOperator; item: CsIfStatement)"
  todoimpl # TODO(add: CsConversionOperator, CsIfStatement)

method add*(parent: var CsProperty; item: CsForEachStatement) = # FES
  echo "in method add*(parent: var CsProperty; item: CsForEachStatement)"
  todoimpl # TODO(add: CsProperty, CsForEachStatement)

method add*(parent: var CsProperty; item: CsIfStatement) = # IS
  echo "in method add*(parent: var CsProperty; item: CsIfStatement)"
  todoimpl # TODO(add: CsProperty, CsIfStatement)

method add*(parent: var CsProperty; item: CsThrowStatement) = # TS
  echo "in method add*(parent: var CsProperty; item: CsThrowStatement)"
  todoimpl # TODO(add: CsProperty, CsThrowStatement)

method add*(parent: var CsProperty; item: CsTryStatement) = # TS
  echo "in method add*(parent: var CsProperty; item: CsTryStatement)"
  todoimpl # TODO(add: CsProperty, CsTryStatement)

method add*(parent: var CsProperty; item: CsWhileStatement) = # WS
  echo "in method add*(parent: var CsProperty; item: CsWhileStatement)"
  todoimpl # TODO(add: CsProperty, CsWhileStatement)

method add*(parent: var CsProperty; item: CsDoStatement) = # DS
  echo "in method add*(parent: var CsProperty; item: CsDoStatement)"
  todoimpl # TODO(add: CsProperty, CsDoStatement)

method add*(parent: var CsOperator; item: CsIfStatement) = # IS
  echo "in method add*(parent: var CsOperator; item: CsIfStatement)"
  todoimpl # TODO(add: CsOperator, CsIfStatement)

method add*(parent: var CsIndexer; item: CsReturnStatement) = # RS
  echo "in method add*(parent: var CsIndexer; item: CsReturnStatement)"
  todoimpl # TODO(add: CsIndexer, CsReturnStatement)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsForEachStatement) = # FES
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsForEachStatement)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsForEachStatement)

method add*(parent: var CsAnonymousMethodExpression; item: CsIfStatement) = # IS
  echo "in method add*(parent: var CsAnonymousMethodExpression; item: CsIfStatement)"
  todoimpl # TODO(add: CsAnonymousMethodExpression, CsIfStatement)

method add*(parent: var CsProperty; item: CsCheckedStatement) = # CS
  echo "in method add*(parent: var CsProperty; item: CsCheckedStatement)"
  todoimpl # TODO(add: CsProperty, CsCheckedStatement)

method add*(parent: var CsProperty; item: CsLockStatement) = # LS
  echo "in method add*(parent: var CsProperty; item: CsLockStatement)"
  todoimpl # TODO(add: CsProperty, CsLockStatement)

method add*(parent: var CsProperty; item: CsSwitchStatement) = # SS
  echo "in method add*(parent: var CsProperty; item: CsSwitchStatement)"
  todoimpl # TODO(add: CsProperty, CsSwitchStatement)

method add*(parent: var CsProperty; item: CsUsingStatement) = # US
  echo "in method add*(parent: var CsProperty; item: CsUsingStatement)"
  todoimpl # TODO(add: CsProperty, CsUsingStatement)

method add*(parent: var CsIndexer; item: CsForEachStatement) = # FES
  echo "in method add*(parent: var CsIndexer; item: CsForEachStatement)"
  todoimpl # TODO(add: CsIndexer, CsForEachStatement)

method add*(parent: var CsIndexer; item: CsIfStatement) = # IS
  echo "in method add*(parent: var CsIndexer; item: CsIfStatement)"
  todoimpl # TODO(add: CsIndexer, CsIfStatement)

method add*(parent: var CsIndexer; item: CsLocalDeclarationStatement) = # LDS
  echo "in method add*(parent: var CsIndexer; item: CsLocalDeclarationStatement)"
  todoimpl # TODO(add: CsIndexer, CsLocalDeclarationStatement)

method add*(parent: var CsIndexer; item: CsSwitchStatement) = # SS
  echo "in method add*(parent: var CsIndexer; item: CsSwitchStatement)"
  todoimpl # TODO(add: CsIndexer, CsSwitchStatement)

method add*(parent: var CsDestructor; item: CsForStatement) = # FS
  echo "in method add*(parent: var CsDestructor; item: CsForStatement)"
  todoimpl # TODO(add: CsDestructor, CsForStatement)

method add*(parent: var CsDestructor; item: CsReturnStatement) = # RS
  echo "in method add*(parent: var CsDestructor; item: CsReturnStatement)"
  todoimpl # TODO(add: CsDestructor, CsReturnStatement)

method add*(parent: var CsIndexer; item: CsThrowStatement) = # TS
  echo "in method add*(parent: var CsIndexer; item: CsThrowStatement)"
  todoimpl # TODO(add: CsIndexer, CsThrowStatement)

method add*(parent: var CsIndexer; item: CsForStatement) = # FS
  echo "in method add*(parent: var CsIndexer; item: CsForStatement)"
  todoimpl # TODO(add: CsIndexer, CsForStatement)

method add*(parent: var CsTryStatement; item: CsIfStatement) = # IS
  echo "in method add*(parent: var CsTryStatement; item: CsIfStatement)"
  todoimpl # TODO(add: CsTryStatement, CsIfStatement)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsForStatement) = # FS
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsForStatement)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsForStatement)

method add*(parent: var CsProperty; item: CsLabeledStatement) = # LS
  echo "in method add*(parent: var CsProperty; item: CsLabeledStatement)"
  todoimpl # TODO(add: CsProperty, CsLabeledStatement)

method add*(parent: var CsDestructor; item: CsUsingStatement) = # US
  echo "in method add*(parent: var CsDestructor; item: CsUsingStatement)"
  todoimpl # TODO(add: CsDestructor, CsUsingStatement)

method add*(parent: var CsYieldStatement; item: CsAnonymousObjectCreationExpression) = # AOCE
  echo "in method add*(parent: var CsYieldStatement; item: CsAnonymousObjectCreationExpression)"
  todoimpl # TODO(add: CsYieldStatement, CsAnonymousObjectCreationExpression)

method add*(parent: var CsProperty; item: CsGotoStatement) = # GS
  echo "in method add*(parent: var CsProperty; item: CsGotoStatement)"
  todoimpl # TODO(add: CsProperty, CsGotoStatement)

method add*(parent: var CsInvocationExpression; item: CsThisExpression) = # TE
  echo "in method add*(parent: var CsInvocationExpression; item: CsThisExpression)"
  todoimpl # TODO(add: CsInvocationExpression, CsThisExpression)

method add*(parent: var CsAnonymousMethodExpression; item: CsTryStatement) = # TS
  echo "in method add*(parent: var CsAnonymousMethodExpression; item: CsTryStatement)"
  todoimpl # TODO(add: CsAnonymousMethodExpression, CsTryStatement)

method add*(parent: var CsAnonymousMethodExpression; item: CsForEachStatement) = # FES
  echo "in method add*(parent: var CsAnonymousMethodExpression; item: CsForEachStatement)"
  todoimpl # TODO(add: CsAnonymousMethodExpression, CsForEachStatement)

method add*(parent: var CsAnonymousMethodExpression; item: CsThrowStatement) = # TS
  echo "in method add*(parent: var CsAnonymousMethodExpression; item: CsThrowStatement)"
  todoimpl # TODO(add: CsAnonymousMethodExpression, CsThrowStatement)

method add*(parent: var CsGlobalStatement; item: CsSwitchStatement) = # SS
  echo "in method add*(parent: var CsGlobalStatement; item: CsSwitchStatement)"
  todoimpl # TODO(add: CsGlobalStatement, CsSwitchStatement)

method add*(parent: var CsConversionOperator; item: CsTryStatement) = # TS
  echo "in method add*(parent: var CsConversionOperator; item: CsTryStatement)"
  todoimpl # TODO(add: CsConversionOperator, CsTryStatement)

method add*(parent: var CsNamespace; item: CsOperator) =
  echo "in method add*(parent: var CsNamespace; item: CsOperator)"
  todoimpl # TODO(add: CsNamespace, CsOperator)

method add*(parent: var CsConversionOperator; item: CsUnsafeStatement) = # US
  echo "in method add*(parent: var CsConversionOperator; item: CsUnsafeStatement)"
  todoimpl # TODO(add: CsConversionOperator, CsUnsafeStatement)

method add*(parent: var CsMethod; item: CsFixedStatement) = # FS
  echo "in method add*(parent: var CsMethod; item: CsFixedStatement)"
  todoimpl # TODO(add: CsMethod, CsFixedStatement)

method add*(parent: var CsMethod; item: CsUnsafeStatement) = # US
  echo "in method add*(parent: var CsMethod; item: CsUnsafeStatement)"
  todoimpl # TODO(add: CsMethod, CsUnsafeStatement)

method add*(parent: var CsConstructor; item: CsFixedStatement) = # FS
  echo "in method add*(parent: var CsConstructor; item: CsFixedStatement)"
  todoimpl # TODO(add: CsConstructor, CsFixedStatement)

method add*(parent: var CsConstructor; item: CsUnsafeStatement) = # US
  echo "in method add*(parent: var CsConstructor; item: CsUnsafeStatement)"
  todoimpl # TODO(add: CsConstructor, CsUnsafeStatement)

method add*(parent: var CsConstructor; item: CsYieldStatement) = # YS
  echo "in method add*(parent: var CsConstructor; item: CsYieldStatement)"
  todoimpl # TODO(add: CsConstructor, CsYieldStatement)

method add*(parent: var CsFixedStatement; item: CsExpressionStatement) = # ES
  echo "in method add*(parent: var CsFixedStatement; item: CsExpressionStatement)"
  todoimpl # TODO(add: CsFixedStatement, CsExpressionStatement)

method add*(parent: var CsProperty; item: CsYieldStatement) = # YS
  echo "in method add*(parent: var CsProperty; item: CsYieldStatement)"
  todoimpl # TODO(add: CsProperty, CsYieldStatement)

method add*(parent: var CsLocalFunctionStatement; item: CsReturnStatement) = # RS
  echo "in method add*(parent: var CsLocalFunctionStatement; item: CsReturnStatement)"
  todoimpl # TODO(add: CsLocalFunctionStatement, CsReturnStatement)

method add*(parent: var CsDefaultExpression; item: CsPointerType) = # PT
  echo "in method add*(parent: var CsDefaultExpression; item: CsPointerType)"
  todoimpl # TODO(add: CsDefaultExpression, CsPointerType)

method add*(parent: var CsMethod; item: CsForEachVariableStatement) = # FEVS
  echo "in method add*(parent: var CsMethod; item: CsForEachVariableStatement)"
  todoimpl # TODO(add: CsMethod, CsForEachVariableStatement)

method add*(parent: var CsFixedStatement; item: CsFixedStatement) = # FS
  echo "in method add*(parent: var CsFixedStatement; item: CsFixedStatement)"
  todoimpl # TODO(add: CsFixedStatement, CsFixedStatement)

method add*(parent: var CsClass; item: CsLocalDeclarationStatement) = # LDS
  echo "in method add*(parent: var CsClass; item: CsLocalDeclarationStatement)"
  todoimpl # TODO(add: CsClass, CsLocalDeclarationStatement)

method add*(parent: var CsOperator; item: CsUnsafeStatement) = # US
  echo "in method add*(parent: var CsOperator; item: CsUnsafeStatement)"
  todoimpl # TODO(add: CsOperator, CsUnsafeStatement)

method add*(parent: var CsLabeledStatement; item: CsYieldStatement) = # YS
  echo "in method add*(parent: var CsLabeledStatement; item: CsYieldStatement)"
  todoimpl # TODO(add: CsLabeledStatement, CsYieldStatement)

method add*(parent: var CsForEachVariableStatement; item: CsExpressionStatement) = # ES
  echo "in method add*(parent: var CsForEachVariableStatement; item: CsExpressionStatement)"
  todoimpl # TODO(add: CsForEachVariableStatement, CsExpressionStatement)

method add*(parent: var CsForEachVariableStatement; item: CsTupleExpression) = # TE
  echo "in method add*(parent: var CsForEachVariableStatement; item: CsTupleExpression)"
  todoimpl # TODO(add: CsForEachVariableStatement, CsTupleExpression)

method add*(parent: var CsLocalDeclarationStatement; item: CsLocalFunctionStatement) = # LFS
  echo "in method add*(parent: var CsLocalDeclarationStatement; item: CsLocalFunctionStatement)"
  todoimpl # TODO(add: CsLocalDeclarationStatement, CsLocalFunctionStatement)

method add*(parent: var CsDestructor; item: CsForEachStatement) = # FES
  echo "in method add*(parent: var CsDestructor; item: CsForEachStatement)"
  todoimpl # TODO(add: CsDestructor, CsForEachStatement)

method add*(parent: var CsConversionOperator; item: CsForEachStatement) = # FES
  echo "in method add*(parent: var CsConversionOperator; item: CsForEachStatement)"
  todoimpl # TODO(add: CsConversionOperator, CsForEachStatement)

method add*(parent: var CsMethod; item: CsLocalFunctionStatement) = # LFS
  echo "in method add*(parent: var CsMethod; item: CsLocalFunctionStatement)"
  todoimpl # TODO(add: CsMethod, CsLocalFunctionStatement)

method add*(parent: var CsFixedStatement; item: CsReturnStatement) = # RS
  echo "in method add*(parent: var CsFixedStatement; item: CsReturnStatement)"
  todoimpl # TODO(add: CsFixedStatement, CsReturnStatement)

method add*(parent: var CsProperty; item: CsFixedStatement) = # FS
  echo "in method add*(parent: var CsProperty; item: CsFixedStatement)"
  todoimpl # TODO(add: CsProperty, CsFixedStatement)

method add*(parent: var CsProperty; item: CsUnsafeStatement) = # US
  echo "in method add*(parent: var CsProperty; item: CsUnsafeStatement)"
  todoimpl # TODO(add: CsProperty, CsUnsafeStatement)

method add*(parent: var CsForEachVariableStatement; item: CsInvocationExpression) = # IE
  echo "in method add*(parent: var CsForEachVariableStatement; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsForEachVariableStatement, CsInvocationExpression)

method add*(parent: var CsForEachVariableStatement; item: CsObjectCreationExpression) = # OCE
  echo "in method add*(parent: var CsForEachVariableStatement; item: CsObjectCreationExpression)"
  todoimpl # TODO(add: CsForEachVariableStatement, CsObjectCreationExpression)

method add*(parent: var CsIndexer; item: CsFixedStatement) = # FS
  echo "in method add*(parent: var CsIndexer; item: CsFixedStatement)"
  todoimpl # TODO(add: CsIndexer, CsFixedStatement)

method add*(parent: var CsLocalFunctionStatement; item: CsIfStatement) = # IS
  echo "in method add*(parent: var CsLocalFunctionStatement; item: CsIfStatement)"
  todoimpl # TODO(add: CsLocalFunctionStatement, CsIfStatement)

method add*(parent: var CsIfStatement; item: CsFixedStatement) = # FS
  echo "in method add*(parent: var CsIfStatement; item: CsFixedStatement)"
  todoimpl # TODO(add: CsIfStatement, CsFixedStatement)

method add*(parent: var CsSimpleLambdaExpression; item: CsIfStatement) = # IS
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsIfStatement)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsIfStatement)

method add*(parent: var CsSimpleLambdaExpression; item: CsReturnStatement) = # RS
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsReturnStatement)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsReturnStatement)

method add*(parent: var CsLocalFunctionStatement; item: CsForStatement) = # FS
  echo "in method add*(parent: var CsLocalFunctionStatement; item: CsForStatement)"
  todoimpl # TODO(add: CsLocalFunctionStatement, CsForStatement)

method add*(parent: var CsLocalFunctionStatement; item: CsTypeParameterList) = # TPL
  echo "in method add*(parent: var CsLocalFunctionStatement; item: CsTypeParameterList)"
  todoimpl # TODO(add: CsLocalFunctionStatement, CsTypeParameterList)

method add*(parent: var CsAccessor; item: CsLocalFunctionStatement) = # LFS
  echo "in method add*(parent: var CsAccessor; item: CsLocalFunctionStatement)"
  todoimpl # TODO(add: CsAccessor, CsLocalFunctionStatement)

method add*(parent: var CsConstructor; item: CsForEachVariableStatement) = # FEVS
  echo "in method add*(parent: var CsConstructor; item: CsForEachVariableStatement)"
  todoimpl # TODO(add: CsConstructor, CsForEachVariableStatement)

method add*(parent: var CsConstructor; item: CsLocalFunctionStatement) = # LFS
  echo "in method add*(parent: var CsConstructor; item: CsLocalFunctionStatement)"
  todoimpl # TODO(add: CsConstructor, CsLocalFunctionStatement)

method add*(parent: var CsSimpleLambdaExpression; item: CsForEachStatement) = # FES
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsForEachStatement)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsForEachStatement)

method add*(parent: var CsSimpleLambdaExpression; item: CsThrowStatement) = # TS
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsThrowStatement)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsThrowStatement)

method add*(parent: var CsLocalFunctionStatement; item: CsTypeParameterConstraintClause) = # TPCC
  echo "in method add*(parent: var CsLocalFunctionStatement; item: CsTypeParameterConstraintClause)"
  todoimpl # TODO(add: CsLocalFunctionStatement, CsTypeParameterConstraintClause)

method add*(parent: var CsProperty; item: CsForEachVariableStatement) = # FEVS
  echo "in method add*(parent: var CsProperty; item: CsForEachVariableStatement)"
  todoimpl # TODO(add: CsProperty, CsForEachVariableStatement)

method add*(parent: var CsSimpleLambdaExpression; item: CsUsingStatement) = # US
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsUsingStatement)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsUsingStatement)

method add*(parent: var CsConversionOperator; item: CsForStatement) = # FS
  echo "in method add*(parent: var CsConversionOperator; item: CsForStatement)"
  todoimpl # TODO(add: CsConversionOperator, CsForStatement)

method add*(parent: var CsIndexer; item: CsWhileStatement) = # WS
  echo "in method add*(parent: var CsIndexer; item: CsWhileStatement)"
  todoimpl # TODO(add: CsIndexer, CsWhileStatement)

method add*(parent: var CsFixedStatement; item: CsForStatement) = # FS
  echo "in method add*(parent: var CsFixedStatement; item: CsForStatement)"
  todoimpl # TODO(add: CsFixedStatement, CsForStatement)

method add*(parent: var CsSimpleLambdaExpression; item: CsTryStatement) = # TS
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsTryStatement)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsTryStatement)

method add*(parent: var CsFixedStatement; item: CsIfStatement) = # IS
  echo "in method add*(parent: var CsFixedStatement; item: CsIfStatement)"
  todoimpl # TODO(add: CsFixedStatement, CsIfStatement)

method add*(parent: var CsForEachVariableStatement; item: CsElementAccessExpression) = # EAE
  echo "in method add*(parent: var CsForEachVariableStatement; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsForEachVariableStatement, CsElementAccessExpression)

method add*(parent: var CsReturnStatement; item: CsBaseExpression) = # BE
  echo "in method add*(parent: var CsReturnStatement; item: CsBaseExpression)"
  todoimpl # TODO(add: CsReturnStatement, CsBaseExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsCheckedStatement) = # CS
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsCheckedStatement)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsCheckedStatement)

method add*(parent: var CsCatchClause; item: CsContinueStatement) = # CS
  echo "in method add*(parent: var CsCatchClause; item: CsContinueStatement)"
  todoimpl # TODO(add: CsCatchClause, CsContinueStatement)

method add*(parent: var CsLocalFunctionStatement; item: CsArrayType) = # AT
  echo "in method add*(parent: var CsLocalFunctionStatement; item: CsArrayType)"
  todoimpl # TODO(add: CsLocalFunctionStatement, CsArrayType)

method add*(parent: var CsDoStatement; item: CsContinueStatement) = # CS
  echo "in method add*(parent: var CsDoStatement; item: CsContinueStatement)"
  todoimpl # TODO(add: CsDoStatement, CsContinueStatement)

method add*(parent: var CsWhileStatement; item: CsContinueStatement) = # CS
  echo "in method add*(parent: var CsWhileStatement; item: CsContinueStatement)"
  todoimpl # TODO(add: CsWhileStatement, CsContinueStatement)

method add*(parent: var CsThrowStatement; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsThrowStatement; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsThrowStatement, CsPostfixUnaryExpression)

method add*(parent: var CsReturnStatement; item: CsRefValueExpression) = # RVE
  echo "in method add*(parent: var CsReturnStatement; item: CsRefValueExpression)"
  todoimpl # TODO(add: CsReturnStatement, CsRefValueExpression)

method add*(parent: var CsLocalFunctionStatement; item: CsNullableType) = # NT
  echo "in method add*(parent: var CsLocalFunctionStatement; item: CsNullableType)"
  todoimpl # TODO(add: CsLocalFunctionStatement, CsNullableType)

method add*(parent: var CsLocalFunctionStatement; item: CsRefType) = # RT
  echo "in method add*(parent: var CsLocalFunctionStatement; item: CsRefType)"
  todoimpl # TODO(add: CsLocalFunctionStatement, CsRefType)

method add*(parent: var CsSelectClause; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsSelectClause; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsSelectClause, CsParenthesizedExpression)

method add*(parent: var CsUnaryPattern; item: CsParenthesizedPattern) = # PP
  echo "in method add*(parent: var CsUnaryPattern; item: CsParenthesizedPattern)"
  todoimpl # TODO(add: CsUnaryPattern, CsParenthesizedPattern)

method add*(parent: var CsRelationalPattern; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsRelationalPattern; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsRelationalPattern, CsParenthesizedExpression)

method add*(parent: var CsSwitchExpression; item: CsCheckedExpression) = # CE
  echo "in method add*(parent: var CsSwitchExpression; item: CsCheckedExpression)"
  todoimpl # TODO(add: CsSwitchExpression, CsCheckedExpression)

method add*(parent: var CsSwitchSection; item: CsLocalFunctionStatement) = # LFS
  echo "in method add*(parent: var CsSwitchSection; item: CsLocalFunctionStatement)"
  todoimpl # TODO(add: CsSwitchSection, CsLocalFunctionStatement)

method add*(parent: var CsFromClause; item: CsArrayType) = # AT
  echo "in method add*(parent: var CsFromClause; item: CsArrayType)"
  todoimpl # TODO(add: CsFromClause, CsArrayType)

method add*(parent: var CsVarPattern; item: CsDiscardDesignation) = # DD
  echo "in method add*(parent: var CsVarPattern; item: CsDiscardDesignation)"
  todoimpl # TODO(add: CsVarPattern, CsDiscardDesignation)

method add*(parent: var CsArrayRankSpecifier; item: CsObjectCreationExpression) = # OCE
  echo "in method add*(parent: var CsArrayRankSpecifier; item: CsObjectCreationExpression)"
  todoimpl # TODO(add: CsArrayRankSpecifier, CsObjectCreationExpression)

method add*(parent: var CsJoinClause; item: CsParenthesizedExpression) = # PE
  echo "in method add*(parent: var CsJoinClause; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsJoinClause, CsParenthesizedExpression)

method add*(parent: var CsParenthesizedPattern; item: CsBinaryPattern) = # BP
  echo "in method add*(parent: var CsParenthesizedPattern; item: CsBinaryPattern)"
  todoimpl # TODO(add: CsParenthesizedPattern, CsBinaryPattern)

method add*(parent: var CsLockStatement; item: CsPostfixUnaryExpression) = # PUE
  echo "in method add*(parent: var CsLockStatement; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsLockStatement, CsPostfixUnaryExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsForStatement) = # FS
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsForStatement)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsForStatement)

method add*(parent: var CsSwitchExpressionArm; item: CsConditionalAccessExpression) = # CAE
  echo "in method add*(parent: var CsSwitchExpressionArm; item: CsConditionalAccessExpression)"
  todoimpl # TODO(add: CsSwitchExpressionArm, CsConditionalAccessExpression)

method add*(parent: var CsForEachVariableStatement; item: CsLiteralExpression) = # LE
  echo "in method add*(parent: var CsForEachVariableStatement; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsForEachVariableStatement, CsLiteralExpression)

