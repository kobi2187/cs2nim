import types, constructs/cs_root, construct, parent_finder
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

proc processTreeForData(root: var CsRoot; info: Info): AllNeededData =
  # make heavy use of the Construct variant kind, to build the needed Data.
  var lastBlock, lastItem: Option[Construct]
  let path = pathOfBlocks()
  if path.len > 0:
    lastBlock = root.fetch(path[^1].id) # TODO......


proc add*(parent, child: Construct; data: AllNeededData) =
  discard #parent.unwrap.add(child.unwrap, data)

# alternative addToRoot
# here we get the info. the object type, info for its fields
# we want to
# 1) know where to add. who is the parent.
# 2) create the object, by passing info and allNeededData
#  to the type's create function (which uses extract)
# 3) add the new item to the correct place.
import type_creator, parent_finder
import state_utils, block_utils
proc addToRoot2*(root: var CsRoot; src: string; info: Info; id: UUID) =
  var allData: AllNeededData = processTreeForData(root, info)
  if not info.isVisitBlock:
    blocks.updateBlocks(info)
  var obj: Construct = createType(info, id, allData)
  root.register(id, obj)
  let p = getParent(root, obj, allData)
  assert p.isSome, "Failed assertion that all constructs should have a parent"
  var parent: Construct = p.get
  assert parent.cfits(obj, allData)
  parent.add(obj, allData) # we let the parent decide how to store it. usually trivial, if not we look in allData for answers. (and add as needed to allData in the proc that generates it)
  obj.unwrap.parentId = parent.unwrap.id # connect them after adding.



### the construct types will now have such api: extract, fits, add, gen. newCs also exists but we don't call it from outside, so doesn't matter.
## quickly & gradually add to the ConstructKind enum
## but only after we have all convenience functions built.
## start with the blocks
