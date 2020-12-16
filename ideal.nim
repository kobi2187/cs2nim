import constructs/cs_all_constructs
import types, state, constructs/cs_root, construct, parent_finder, block_utils
import uuids, options
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
  else: assert false, "plz impl for parent: " & $parent.kind


import type_creator, parent_finder
import all_needed_data
# state_utils, block_utils

proc addToRoot2*(root: var CsRoot; src: string; info: Info; id: UUID) =
  echo "in addToRoot2"
  echo " ==START== " , root

  var allData: AllNeededData = makeNeededData(root, info, src)
  # processTreeForData(root, info)
  # no need, lineparser.modifyPosition does that already.
  # if not info.isVisitBlock:
  #   blocks.updateBlocks(info)
  if info.declName in ["BlockStarts", "CompilationUnit"]:
    discard
  else:
    echo "creating the construct object"
    var obj: Construct = createType(info, id, allData)
    obj.id = some(id)
    root.register(id, obj)
    # allData = makeNeededData(root, info, src) # try to make it again.
    allData.refresh(root,info,src)
    let p = getParent(root, obj, allData)
    assert p.isSome, "Failed assertion that all constructs should have a parent"
    var parent: Construct = p.get
    assert parent.cfits(obj, allData)
    echo "parent fits object: " , parent.kind , " --will add-- " , obj.kind
    echo "attempting to add to parent..."
    parent.add(obj, allData) # we let the parent decide how to store it. usually trivial, if not we look in allData for answers. (and add as needed to allData in the proc that generates it)
    
    # obj.unwrap.parentId = parent.unwrap.id # connect them after adding.
    obj.parentId = parent.id # connect them after adding.
    echo " ==END== " , root
    echo "NOTE: if didn't add, go to ideal::add method."


### the construct types will now have such api: extract, fits, add, gen. newCs also exists but we don't call it from outside, so doesn't matter.
## quickly & gradually add to the ConstructKind enum
## but only after we have all convenience functions built.
## start with the blocks
