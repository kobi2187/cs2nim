
# refactoring the body methods part:
type StatementExpressions* = enum # the possible body statements + expressions. # these are the only ones which should be BodyExpr. other things are added to them as fields inside. ( if needed )
  seInvocationExpression, seAnonymousMethodExpression,
      seAnonymousObjectCreationExpression, seArrayCreationExpression,
      seArrowExpressionClause, seAssignmentExpression, seAwaitExpression,
      seBaseExpression, seBinaryExpression, seBreakStatement, seCastExpression,
      seCheckedExpression, seCheckedStatement, seConditionalAccessExpression,
      seConditionalExpression, seContinueStatement, seDeclarationExpression,
      seDefaultExpression, seDoStatement, seElementAccessExpression,
      seElementBindingExpression, seEmptyStatement, seExpressionStatement,
      seFixedStatement, seForEachStatement, seForEachVariableStatement,
      seForStatement, seGlobalStatement, seGotoStatement, seIfStatement,
      seImplicitArrayCreationExpression, seImplicitObjectCreationExpression,
      seImplicitStackAllocArrayCreationExpression, seInitializerExpression,
      seInterpolatedStringExpression, seIsPatternExpression, seLabeledStatement,
      seLiteralExpression, seLocalDeclarationStatement,
      seLocalFunctionStatement, seLockStatement, seMakeRefExpression,
      seMemberAccessExpression, seMemberBindingExpression,
      seObjectCreationExpression, seOmittedArraySizeExpression,
      seParenthesizedExpression, seParenthesizedLambdaExpression,
      sePostfixUnaryExpression, sePrefixUnaryExpression, seQueryExpression,
      seRangeExpression, seRefExpression, seRefTypeExpression,
      seRefValueExpression, seReturnStatement, seSimpleLambdaExpression,
      seSizeOfExpression, seStackAllocArrayCreationExpression,
      seSwitchExpression, seSwitchExpressionArm, seSwitchStatement,
      seThisExpression, seThrowExpression, seThrowStatement, seTryStatement,
      seTupleExpression, seTypeOfExpression, seUnsafeStatement,
      seUsingStatement, seWhileStatement, seWithExpression, seYieldStatement

type BodyExpression = ref object of RootRef
  kind*: StatementExpressions

# all these have lastmethod/lastCtor etc. as parent. they are all added to the body sequence.
# declarations otoh, need to be figured out as we've done so far. but this should simplify that part for us. (parent finder)


# all the rest should inherit from it, their methods are figured out in run time
# wait, we're missing some. for example variable declarator.
