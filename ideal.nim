import constructs/cs_all_constructs
import types, state, constructs/cs_root, construct, parent_finder, block_utils
import uuids, options,sequtils
# ideal flow
# the api that we want.

# get last block, decide with the new item's type whether it fits the block or its last stored item (probably the type strings are enough?)
# also, if last item expects more and which fields are missing for it, or which decltypes are missing.

# we can have global uuid tables, held in an object inside root, for each construct or grouped according to variants.
# or follow the path correctly, then get the info from a smaller table within a more specific type.
type B = object
  kind*: ConstructKind
  id*: UUID
  name*: string

proc pathOfBlocks(): seq[B] = discard # TODO

# proc processTreeForData(root: var CsRoot; info: Info): AllNeededData =
#   # make heavy use of the Construct variant kind, to build the needed Data.
#   var lastBlock: Option[Construct]
#   # lastItem
#   let path = pathOfBlocks()
#   if path.len > 0:
#     lastBlock = root.fetch(path[^1].id) # TODO......

# TODO: a sprawling giant. how to refactor? is it even possible to refactor this?
method add*(parent, child: Construct; data: AllNeededData) =
  echo "in add <Construct>"
  case parent.kind
  of ckNamespace:
    var p = parent.namespace
    case child.kind
    of ckClass: # ns, class
      var c = child.class
      p.add(c)
    of ckEnum:
      var c = child.cenum
      p.add c
    else: assert false, "plz impl for child: " & $child.kind
  of ckClass:
    var c = parent.class
    case child.kind
    of ckMethod: # class, method
      var m = child.cmethod
      c.add m
    of ckConstructor:
      var m = child.constructor
      c.add m
    of ckBaseList:
      var b = child.baselist
      c.add b
    
    of [ckSimpleBaseType]: discard
    of ckIndexer: 
      var i = child.indexer
      c.add i
    of ckProperty:
      var pr = child.property
      c.add pr
    else: assert false, "plz impl for child: " & $child.kind

  of ckMethod:
    var m = parent.cmethod
    case child.kind
    of ckPredefinedType:
      var pt = child.predefinedType
      m.add pt
    of ckParameterList:
      m.add child.parameterlist
    of ckLocalDeclarationStatement:
      m.add child.localDeclarationStatement
    of ckReturnStatement:
      m.add child.returnStatement
    else: assert false, "plz impl for child: " & $child.kind
  of ckEnum:
    var m = parent.cenum
    case child.kind
    of ckEnumMember:
      var c = child.enumMember
      m.add c
    else: assert false, "plz impl for child: " & $child.kind

  of ckEnumMember:
    var p = parent.enumMember
    case child.kind
    of ckEqualsValueClause: # the only possibility i think
      var c = child.equalsValueClause
      p.add c
    of ckLiteralExpression:
      var c = child.literalExpression
      p.add c
    else: assert false, "plz impl for child: " & $child.kind
  of ckParameterList:
    var p = parent.parameterList
    case child.kind
    of ckParameter:
      var c = child.parameter
      p.add c
    else: assert false, "plz impl for child: " & $child.kind
  of ckReturnStatement:
    var p = parent.returnStatement
    case child.kind
    of ckLiteralExpression:
      var c = child.literalExpression
      p.add c
    else: assert false, "plz impl for child: " & $child.kind
  of ckConstructor:
    var p = parent.constructor
    case child.kind
    of ckParameterList:
      var c = child.parameterlist
      p.add c
    else: assert false, "plz impl for child: " & $child.kind
  of ckIndexer:
    var p = parent.indexer
    case child.kind
    of ckPredefinedType:
      var c = child.predefinedtype
      p.add c
    of ckExplicitInterfaceSpecifier:
      var c = child.explicitInterfaceSpecifier
      p.add c
    of ckBracketedParameterList:
      var c = child.bracketedParameterList
      p.add c
    of ckParameter:
      var c = child.parameter
      p.add c
    of ckAccessorList:
      var c = child.accessorlist
      p.add c
    else: assert false, "plz impl for child: " & $child.kind
  
  of ckAccessorList:
    var p = parent.accessorlist
    case child.kind
    of ckAccessor:
      var c = child.accessor
      p.add c

    else: assert false, "plz impl for child: " & $child.kind
  of ckProperty:
    var p = parent.property
    case child.kind
    of ckPredefinedType:
      var c = child.predefinedType
      p.add c
    of ckAccessorList:
      var c = child.accessorList
      p.add c

    else: assert false, "plz impl for child: " & $child.kind
    
  else: assert false, "plz impl for parent: " & $parent.kind


import type_creator, parent_finder
import all_needed_data
# state_utils, block_utils
import sets,tables
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


proc addToRoot2*(root: var CsRoot; src: string; info: Info; id: UUID) =
  echo "in addToRoot2"
  echo " ==START== " , root

  # processTreeForData(root, info)
  # no need, lineparser.modifyPosition does that already.
  # if not info.isVisitBlock:
  #   blocks.updateBlocks(info)
  if info.declName in ["BlockStarts", "CompilationUnit"]:
    discard
  else:
    echo "creating the construct object"
    # NOTE: could be that blocks has ns but root didn't add it yet.
    var allData: AllNeededData = makeNeededData(root, info, src)
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

    echo " ==END== " , root
    echo "NOTE: if didn't add, go to ideal::add method."


### the construct types will now have such api: extract, fits, add, gen. newCs also exists but we don't call it from outside, so doesn't matter.
## quickly & gradually add to the ConstructKind enum
## but only after we have all convenience functions built.
## start with the blocks
