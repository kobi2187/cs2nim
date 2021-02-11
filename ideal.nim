import constructs/justtypes
import types, constructs/cs_root, construct, parent_finder #, block_utils
# , state,
import uuids, options, sequtils
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


import type_creator, parent_finder, storeInParent, cfits
import all_needed_data
# state_utils, block_utils
import sets #,tables
proc sameAsExisting(obj: Construct; data: AllNeededData): bool =
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



proc addToRoot2*(root: var CsRoot; src: string; info: Info; id: UUID;
    upcoming: seq[string]) =
  echo "in addToRoot2"
  echo " ==START== ", "\n", root

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
    root.register(id, obj)

    # allData.refresh(root,info,src)
    if obj.sameAsExisting(allData): return # for example, don't add a new namespace but fetch it based on name.
    # special handling for root & ns:
    if obj.kind == ckNamespace:
      root.add(obj.namespace)
      return

    let (discarded, p) = getParent(root, obj, allData)
    if not discarded:
      assert p.isSome, "Failed assertion that all constructs should have a parent"
      var parent: Construct = p.get
      assert parent.cfits(obj, allData)
      echo "parent fits object: ", parent.kind, " --will add-- ", obj.kind
      echo "attempting to add to parent..."
      parent.add(obj, allData) # we let the parent decide how to store it. usually trivial, if not we look in allData for answers. (and add as needed to allData in the proc that generates it)
      obj.parentId = parent.id # connect them after adding.

    echo root, "\n", " ==END== "
    echo "NOTE: if didn't add, go to ideal::add method."
    # echo "upcoming lines:", allData.upcoming


### the construct types will now have such api: extract, fits, add, gen. newCs also exists but we don't call it from outside, so doesn't matter.
## quickly & gradually add to the ConstructKind enum
## but only after we have all convenience functions built.
## start with the blocks
