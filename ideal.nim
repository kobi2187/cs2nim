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

method add*(parent, child: Construct; data: AllNeededData) =
  case parent.kind
  of ckNamespace:
    var p = parent.namespace
    case child.kind
    of ckClass:
      var c = child.class
      p.add(c)
    else: discard
  else: discard


import type_creator, parent_finder
import state_utils, block_utils, all_needed_data
proc addToRoot2*(root: var CsRoot; src: string; info: Info; id: UUID) =
  echo "in addToRoot2"
  var allData: AllNeededData = makeNeededData(root, info, src)
  # processTreeForData(root, info)
  # no need, lineparser.modifyPosition does that already.
  # if not info.isVisitBlock:
  #   blocks.updateBlocks(info)
  if info.declName == "BlockStarts":
    discard
  else:
    echo "creating the construct object"
    var obj: Construct = createType(info, id, allData)
    obj.id = some(id)
    root.register(id, obj)
    let p = getParent(root, obj, allData)
    assert p.isSome, "Failed assertion that all constructs should have a parent"
    var parent: Construct = p.get
    assert parent.cfits(obj, allData)
    parent.add(obj, allData) # we let the parent decide how to store it. usually trivial, if not we look in allData for answers. (and add as needed to allData in the proc that generates it)
    # obj.unwrap.parentId = parent.unwrap.id # connect them after adding.
    obj.parentId = parent.id # connect them after adding.



### the construct types will now have such api: extract, fits, add, gen. newCs also exists but we don't call it from outside, so doesn't matter.
## quickly & gradually add to the ConstructKind enum
## but only after we have all convenience functions built.
## start with the blocks
