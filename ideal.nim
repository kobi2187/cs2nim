import constructs/[cs_all_constructs, justtypes]
import types, constructs/cs_root, construct, parent_finder#, block_utils
# , state,
import uuids, options,sequtils
# ideal flow
# the api that we want.

# get last block, decide with the new item's type whether it fits the block or its last stored item (probably the type strings are enough?)
# also, if last item expects more and which fields are missing for it, or which decltypes are missing.

# we can have global uuid tables, held in an object inside root, for each construct or grouped according to variants.
# or follow the path correctly, then get the info from a smaller table within a more specific type.
# type B = object
#   kind*: ConstructKind
#   id*: UUID
#   name*: string

# proc pathOfBlocks(): seq[B] = discard # TODO

# TODO: a sprawling giant. how to refactor? is it even possible to refactor this?
proc add*(parent, child: Construct; data: AllNeededData) =
  echo "in add <Construct>"
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
    else: assert false, "plz impl for child: " & $child.kind

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

    else: assert false, "plz impl for child: " & $child.kind

  of ckMethod:
    var m = parent.cmethod
    case child.kind
    of ckPredefinedType:
      var pt = child.predefinedType
      pt.parentId = m.id; m.add pt
    of ckParameterList:
      var c = child.parameterlist
      c.parentId = m.id; m.add c
    of ckLocalDeclarationStatement:
      var c = child.localDeclarationStatement
      c.parentId = m.id; m.add c
    of ckReturnStatement:
      var c = child.returnStatement
      c.parentId = m.id; m.add c
    of ckExpressionStatement:
      var c = child.expressionStatement
      c.parentId = m.id; m.add c
    of ckAssignmentExpression:
      var c = child.assignmentExpression
      c.parentId = m.id; m.add c
    of ckVariableDeclarator: # just add to method body.
      var c = child.variableDeclarator
      c.parentId = m.id; m.add c
    # of ckMemberAccessExpression:
    #   var c = child.memberAccessExpression
    #   c.parentId = m.id; m.add c

    else: assert false, "plz impl for child: " & $child.kind
  of ckEnum:
    var m = parent.cenum
    case child.kind
    of ckEnumMember:
      var c = child.enumMember
      c.parentId = m.id; m.add c
    else: assert false, "plz impl for child: " & $child.kind

  of ckEnumMember:
    var p = parent.enumMember
    case child.kind
    of ckEqualsValueClause: # the only possibility i think
      var c = child.equalsValueClause
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id; p.add c
    else: assert false, "plz impl for child: " & $child.kind
  of ckParameterList:
    var p = parent.parameterList
    case child.kind
    of ckParameter:
      var c = child.parameter
      c.parentId = p.id; p.add c
    else: assert false, "plz impl for child: " & $child.kind
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
    else: assert false, "plz impl for child: " & $child.kind
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

    else: assert false, "plz impl for child: " & $child.kind
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
    else: assert false, "plz impl for child: " & $child.kind

  of ckAccessorList:
    var p = parent.accessorlist
    case child.kind
    of ckAccessor:
      var c = child.accessor
      c.parentId = p.id; p.add c
    else: assert false, "plz impl for child: " & $child.kind
  of ckProperty:
    var p = parent.property
    case child.kind
    of ckPredefinedType:
      var c = child.predefinedType
      c.parentId = p.id; p.add c
    of ckAccessorList:
      var c = child.accessorList
      c.parentId = p.id; p.add c
    else: assert false, "plz impl for child: " & $child.kind

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


    else: assert false, "plz impl for child: " & $child.kind
  of ckLocalDeclarationStatement:
    var p = parent.localDeclarationStatement
    case child.kind
    of ckVariable:
      let c = child.variable
      c.parentId = p.id; p.add c
    of ckGenericName:
      let c= child.genericName
      c.parentId = p.id; p.add c
    of ckTypeArgumentList:
      let c= child.typeArgumentList
      c.parentId = p.id; p.add c
    of ckVariableDeclarator:
      let c= child.variableDeclarator
      c.parentId = p.id; p.add c
    of ckArgumentList: # TODO CONTINUE HERE... add needs to drill until reaching rhs, maybe add field arglist. annoying.
      let c = child.argumentList
      c.parentId = p.id; p.add c
    of ckLiteralExpression:
      let c = child.literalExpression
      c.parentId = p.id; p.add c

    else: assert false, "plz impl for child: " & $child.kind

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

    else: assert false, "plz impl for child: " & $child.kind

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

    else: assert false, "plz impl for child: " & $child.kind
  of ckObjectCreationExpression:
    var p = parent.objectCreationExpression
    case child.kind
    of ckInitializerExpression:
      var c = child.initializerExpression
      c.parentId = p.id; p.add c
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id; p.add c

    else: assert false, "plz impl for child: " & $child.kind

  of ckInitializerExpression:
    var p = parent.initializerExpression
    case child.kind
    of ckLiteralExpression:
      var c = child.literalExpression
      c.parentId = p.id;  p.add c
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id;  p.add c
    else: assert false, "plz impl for child: " & $child.kind

  of ckLiteralExpression:
    var p = parent.literalExpression
    case child.kind
    of ckPrefixUnaryExpression:
      var c = child.prefixUnaryExpression
      c.parentId = p.id;  p.add c

    else: assert false, "plz impl for child: " & $child.kind
  of ckVariable:
    var p = parent.variable
    case child.kind
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id;  p.add c
    # of ckVariableDeclarator:
    #   var c = child.variableDeclarator
    #   c.parentId = p.id;  p.add c

    else: assert false, "plz impl for child: " & $child.kind
  of ckGenericName:
    var p = parent.genericName
    case child.kind
    of ckTypeArgumentList:
      var c = child.typeArgumentList
      c.parentId = p.id;  p.add c
    else: assert false, "plz impl for child: " & $child.kind

  of ckUsingDirective:
    var p = parent.usingDirective
    case child.kind
    of ckNameEquals:
      var c = child.nameEquals
      c.parentId = p.id;  p.add c
    else: assert false, "plz impl for child: " & $child.kind
  of ckNameEquals:
    var p = parent.nameEquals
    case child.kind
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id;  p.add c
    else: assert false, "plz impl for child: " & $child.kind

  of ckParameter:
    var p = parent.parameter
    case child.kind
    of ckGenericName:
      var c = child.genericName
      c.parentId = p.id;  p.add c
    else: assert false, "plz impl for child: " & $child.kind
  of ckField:
    var p = parent.field
    case child.kind
    of ckVariable:
      var c = child.variable
      c.parentId = p.id;  p.add c
    of ckVariableDeclarator:
      var c = child.variableDeclarator
      c.parentId = p.id;  p.add c
    else: assert false, "plz impl for child: " & $child.kind
  of ckInvocationExpression:
    var p = parent.invocationExpression
    case child.kind
    of ckMemberAccessExpression:
      var c = child.memberAccessExpression
      c.parentId = p.id;  p.add c
    else: assert false, "plz impl for child: " & $child.kind

  else: assert false, "plz impl for parent: " & $parent.kind


import type_creator, parent_finder
import all_needed_data
# state_utils, block_utils
import sets #,tables
proc sameAsExisting(obj:Construct, data:AllNeededData):bool =
  # for namespaces and partial classes. other uses?
  var root = currentRoot
  case obj.kind
  of ckNamespace:
    # have to check global name here... TODO: possible place for bugs.
    let name = obj.namespace.name
    let res = root.ns.anyIt(it.name == name)
    return res
    # return obj.namespace in root.ns # already have it.
  of ckClass:
    let c = obj.class
    # adding class to current namespace. if current already has such class return true.
    # same if in the same namespace and class name already exists.
    let res = data.currentNamespace.classes.anyIt(it.name == c.name)
    return res
    # class name and namespace
  else:
    discard
    # assert false, $obj.kind

# import strutils



proc addToRoot2*(root: var CsRoot; src: string; info: Info; id: UUID; upcoming:seq[string]) =
  echo "in addToRoot2"
  echo " ==START== ","\n" , root

  # processTreeForData(root, info)
  # no need, lineparser.modifyPosition does that already.
  # if not info.isVisitBlock:
  #   blocks.updateBlocks(info)
  if info.declName in ["BlockStarts", "CompilationUnit"]:
    discard
  else:
    echo "creating the construct object"
    # NOTE: could be that blocks has ns but root didn't add it yet.
    var allData: AllNeededData = makeNeededData(root, info, src, upcoming)
    var obj: Construct = createType(info, id, allData)
    if obj.isNil: return
    obj.id = some(id)

    # allData.refresh(root,info,src)
    if obj.sameAsExisting(allData): return # for example, don't add a new namespace but fetch it based on name.
    root.register(id, obj)
    # special handling for root & ns:
    if obj.kind == ckNamespace:
      root.add(obj.namespace)
      return

    let (discarded, p) = getParent(root, obj, allData)
    if not discarded:
      assert p.isSome, "Failed assertion that all constructs should have a parent"
      var parent: Construct = p.get
      assert parent.cfits(obj, allData)
      echo "parent fits object: " , parent.kind , " --will add-- " , obj.kind
      echo "attempting to add to parent..."
      parent.add(obj, allData) # we let the parent decide how to store it. usually trivial, if not we look in allData for answers. (and add as needed to allData in the proc that generates it)
      obj.parentId = parent.id # connect them after adding.

    echo root,"\n"," ==END== "
    echo "NOTE: if didn't add, go to ideal::add method."
    echo "upcoming lines:" , allData.upcoming


### the construct types will now have such api: extract, fits, add, gen. newCs also exists but we don't call it from outside, so doesn't matter.
## quickly & gradually add to the ConstructKind enum
## but only after we have all convenience functions built.
## start with the blocks
