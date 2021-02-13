# parent_finder.nim
import options, sequtils, all_needed_data, block_utils #, strutils
import info_center, state_utils
import types, construct, constructs/[cs_all_constructs, justtypes]
import constructs/cs_root, uuids
import common_utils

# import cfits

import state, sugar

proc handleLiteralExpression(data: AllNeededData): Option[UUID] =
  echo "obj is LiteralExpression"
  let last = state.getLastBlock((c) => c.name notin ["IdentifierName" , "PrefixUnaryExpression", "LiteralExpression"])
  result = last.get.id.some
  # NOTE: make sure not inside annotation. we should remove those, as we don't support them at all!

  # let prevName = data.previousConstruct.get.name
  # case prevName
  # of "EqualsValueClause":
  #   # we'll need to get prevprev construct and assign the value to it.
  #   let prevprevName = data.previousPreviousConstruct.get.name
  #   case prevprevName
  #     of "EnumMemberDeclaration":
  #       result = data.lastEnumMember.id
  #     of "VariableDeclarator":
  #       result = data.lastBodyExprId
  #     else: assert false, prevprevName

  # of ["IdentifierName", "Argument"]: discard # TODO?
  # of "ReturnStatement":
  #   assert data.classLastAdded in [ClassParts.Methods, ClassParts.Properties,
  #       ClassParts.Ctors]
  #   result = data.lastBodyExprId
  # of "InitializerExpression":
  #   let ini = data.lastBlockType("InitializerExpression")
  #   assert ini.isSome
  #   result = ini

  # of ["PrefixUnaryExpression", "LiteralExpression"]:
  #   let last = state.getLastBlock((c) => c.name notin ["PrefixUnaryExpression",
  #       "LiteralExpression"])
  #   assert last.isSome
  #   echo "LAST:", last

  # else: assert false, prevName


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
# inconsistent results, maybe overwritten in hashtable??

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
    return (false, obj.parentId)

  let phint = parentHint(obj)
  # try numerical first.
  let tryMatch = getLastBlock(b=>b.info.rawKind == obj.parentRawKind)
  if tryMatch.isSome:
    echo "found the parent in blocks via object's numeric rawkind"
    let id = tryMatch.get.id.some
    let kind = tryMatch.get.info.rawkind
    if parentTable.hasKey(kind) and parentTable[kind] notin ["IdentifierName", "QualifiedName", "BlockStarts"]:
      return (false, id)

  elif phint.isSome():
    if phint.get notin ["IdentifierName", "QualifiedName", "BlockStarts"]:
      let lastMatch = getLastBlockType(phint.get)
      if lastMatch.isSome:
        echo "found parent ID thru Roslyn's parent Kind (string type)."
        let id = lastMatch.get.id.some
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
    # assert data.classLastAdded in [Methods, Properties, Ctors]
    # res = data.idLastClassPart
    let m = getLastBlockTypes(@[
      "MethodDeclaration", "PropertyDeclaration","DestructorDeclaration",
      "ConstructorDeclaration","ConversionOperatorDeclaration","AccessorDeclaration",
      "AnonymousMethodExpression","ParenthesizedLambdaExpression",

      ])
    assert m.isSome
    res = m.get.id.some
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

  # of ckReturnStatement:
  #   echo "obj is ReturnStatement"
  #   # echo "we should be inside ctor, method, indexer, or property"
  #   # res = data.idLastClassPart()
  #   let m = getLastBlockTypes(
  #     @[
  #     "AccessorDeclaration", "MethodDeclaration", "IndexerDeclaration",
  #     "ConstructorDeclaration", "OperatorDeclaration", "ConversionOperatorDeclaration",
  #     "AnonymousMethodExpression","IfStatement", "TryStatement",
  #     "ParenthesizedLambdaExpression",

  #     ])
  #   assert m.isSome
  #   res = m.get.id.some

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
    let last = state.getLastBlock((c) => c.name notin ["IdentifierName" ]) # FIXME: add more according to cases.
    res = last.get.id.some
    # assert data.classLastAdded in [ClassParts.Methods, ClassParts.Ctors],
    #     $data.classLastAdded
    # res = data.idLastClassPart

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
    assert data.nsLastAdded in [NamespaceParts.Interfaces, NamespaceParts.Classes]
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
    # NOTE: make sure not inside annotation. we should remove those, as we don't support them at all!

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
  of ckMemberAccessExpression: # NOTE!! make sure this isn't another annotation: check source code. if it is, run CsDisplay again to remove annotation.
    res = data.lastBlockType(@["VariableDeclarator", "InvocationExpression"])
    if res.isNone: # add more? sometimes fails because of C# annotation meta data so ignore in such cases.
      echo "ckMemberAccessExpression !! GOT NONE. Setting discarded to true, to ignore."
      discarded = true

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
        "InitializerExpression", "NameEquals"]) # TODO: add others as needed.
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
    res = data.lastUsing.id # could be related to inner annotation not being removed by CsDisplay, check cs source code first.

  of ckExternAliasDirective:
    # ignore, unsupported.
    discarded = true
    echo "got " & $ckExternAliasDirective & " which we don't support (doesn't make sense for nim modules)"

  of ckInterface:
    res = data.currentNamespace.id
  of ckDelegate:
    res = data.currentNamespace.id
  of ckStruct:
    res = data.currentNamespace.id
  of ckEvent:
    res = data.currentNamespace.id
  # of ckSwitchStatement: # gleaned from cfits. can also check ebnf spec and c#7 book.
  #   let m = getLastBlockTypes(@[
  #     "MethodDeclaration", "ForStatement", "ForEachStatement", "ElseClause", "IfStatement",
  #     "AccessorDeclaration","ConstructorDeclaration",
  #     "SwitchSection"
  #     ])
  #   assert m.isSome
  #   res = m.get.id.some

  of ckCaseSwitchLabel:
    assert false, "got: " & $obj.kind & data.sourceCode
  of ckSwitchSection:
    assert false, "got: " & $obj.kind & data.sourceCode
  of ckGotoStatement:
    assert false, "got: " & $obj.kind & data.sourceCode
  of ckThrowStatement:
    assert false, "got: " & $obj.kind & data.sourceCode
  of ckPostfixUnaryExpression:
    assert false, "got: " & $obj.kind & data.sourceCode
  of ckTryStatement:
    assert false, "got: " & $obj.kind & data.sourceCode
  of ckCatchClause:
    assert false, "got: " & $obj.kind & data.sourceCode
  of ckCatch:
    assert false, "got: " & $obj.kind & data.sourceCode
  of ckContinueStatement:
    assert false, "got: " & $obj.kind & data.sourceCode
  of ckFinallyClause:
    assert false, "got: " & $obj.kind & data.sourceCode
  of ckDefaultSwitchLabel:
    assert false, "got: " & $obj.kind & data.sourceCode
  of ckYieldStatement:
    assert false, "got: " & $obj.kind & data.sourceCode
  of ckThrowExpression:
    assert false, "got: " & $obj.kind & data.sourceCode
  of [
    ckSwitchStatement, ckReturnStatement, ckIfStatement, ckElseClause,
    ckForStatement,ckDoStatement,ckCastExpression,ckWhileStatement,
    ckForEachStatement,ckUsingStatement,ckLockStatement
    ]:
    echo "got " & $obj.kind
    let parents = @[
    "DestructorDeclaration",
    "AccessorDeclaration",
      "ConversionOperatorDeclaration", "ParenthesizedLambdaExpression",      # add more here.
       "MethodDeclaration", "ForStatement", "ForEachStatement", "ElseClause",
      "SwitchSection", "IndexerDeclaration",
      "ConstructorDeclaration", "OperatorDeclaration",
      "AnonymousMethodExpression","IfStatement", "TryStatement",

    ]
    echo "and looking for its parent in:", parents
    let lastMatch = getLastBlockTypes(parents)
    assert lastMatch.isSome
    res = lastMatch.get.id.some

  of ckBreakStatement: # if, case, else, while, do, ...others?
    let lastMatch = getLastBlockTypes(@["IfStatement", "TryStatement","ElseClause", "SwitchSection","LabeledStatement","WhileStatement", "MethodDeclaration"])
    assert lastMatch.isSome
    res = lastMatch.get.id.some
    # assert false # plz add more cases above.

  of ckThisExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckBracketedArgumentList:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckElementAccessExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckParenthesizedExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckArrayRankSpecifier:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckArrayType:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckOmittedArraySizeExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckTypeOfExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode

  of ckSimpleLambdaExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckArrayCreationExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckArrowExpressionClause:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckAliasQualifiedName:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckTypeParameter:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckAwaitExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckConditionalExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckTypeParameterList:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode

  of ckInterpolatedStringText:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckParenthesizedLambdaExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckNullableType:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckBaseExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckInterpolation:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckNameColon:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckTypeParameterConstraintClause:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckTypeConstraint:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode

  of ckSingleVariableDesignation:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckInterpolatedStringExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckImplicitArrayCreationExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckDeclarationExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckConditionalAccessExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckMemberBindingExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode

  of ckDefaultExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckPointerType:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckAnonymousObjectMemberDeclarator:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckCheckedExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckIsPatternExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckDeclarationPattern:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckConstantPattern:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckRefType:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckRefExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode

  of ckClassOrStructConstraint:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckOmittedTypeArgument:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckTupleElement:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckOperator:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckEventField:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckImplicitElementAccess:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckAnonymousMethodExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckTupleExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode

  of ckAnonymousObjectCreationExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckGlobalStatement:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckIncompleteMember:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckLocalFunctionStatement:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckConversionOperator:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckTupleType:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckFixedStatement:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckEmptyStatement:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckSizeOfExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode

  of ckQueryBody:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckCheckedStatement:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckQueryExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckCasePatternSwitchLabel:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckLabeledStatement:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckConstructorConstraint:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckUnsafeStatement:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckParenthesizedVariableDesignation:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode

  of ckInterpolationFormatClause:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckDestructor:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckDiscardDesignation:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckStackAllocArrayCreationExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckWhenClause:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckForEachVariableStatement:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckLetClause:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckElementBindingExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode

  of ckCatchFilterClause:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckOrdering:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckInterpolationAlignmentClause:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckQueryContinuation:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckMakeRefExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckRefValueExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckRefTypeExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckBlock:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckBinaryPattern:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckDiscardPattern:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode

  of ckFunctionPointerType:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckImplicitObjectCreationExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckParenthesizedPattern:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckPositionalPatternClause:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckPrimaryConstructorBaseType:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckPropertyPatternClause:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckRangeExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckRecord:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode

  of ckRecursivePattern:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckRelationalPattern:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckSubpattern:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckSwitchExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckSwitchExpressionArm:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckTypePattern:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckUnaryPattern:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckVarPattern:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckWithExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode

  of ckImplicitStackAllocArrayCreationExpression:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckOrderByClause:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckGroupClause:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckJoinClause:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckFromClause:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckSelectClause:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckWhereClause:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode
  of ckJoinIntoClause:
    assert false, "got: " & $obj.kind & "\nsource: " & data.sourceCode


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
      echo "--- couldn't find registered object for this id" ### NOTE: can happen for IdentifierName since we don't register it. it means the parent was wrongly identified as IdentifierName.
      # assert false
  result = (dis, res)
  assert (not dis and res.isSome) or (dis and res.isNone), "dis: " & $dis &
      ", res: " & (if res.isSome: $res.get.kind else: "none")
