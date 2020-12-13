# parent_finder.nim
import options
import info_center
import types, construct, constructs/cs_all_constructs

proc cfits*(parent, item: Construct; data: AllNeededData): bool = # asks the inner types to implement fits for these type arguments.
  case $parent.kind & ", " & $item.kind
  of "ckNamespace, ckClass": result = true
  else: raise newException(Exception, "cfits is missing " & $parent.kind & ", " & $item.kind)

# get parent checks that the types fit each other, and decides whether parent is a block type or one of its last added items, that expects to store that object. if cannot decide, we'll need to add more information from the C# side.
# figures out path from blocks. blocks now contain id as well.
# the bulk of the work shifts to here.
import constructs/cs_root, uuids
# this happens before we add to the parent.
proc determineParentId(obj: Construct; data: AllNeededData): Option[UUID] =
  if obj.parentId.isSome:
    echo "obj already has parent id, returning that."
    return obj.parentId

  echo obj.kind
  case obj.kind
  of ckClass:
    echo "obj is a class, returning the current namespace id"
    result = data.currentNamespace.id
    assert result.isSome and not result.get.isZero
  of ckNamespace:
    echo "obj is a namespace, returning None"
    result = none(UUID) # namespaces don't have a parentID, since we have just one root.
  of ckMethod:
    echo "object is a method"
    echo "last added in namespace", data.nsLastAdded
    assert data.nsLastAdded != NamespaceParts.Unset
    assert data.nsLastAdded == NamespaceParts.Classes # methods are in classes.
    echo "last class has id:", data.lastClass.id
    return data.lastClass.id


proc getParent*(root: var CsRoot; newobj: Construct; allData: AllNeededData): Option[Construct] =
  echo "in getParent"
  echo "newobj: ", newobj.kind
  let pid = determineParentId(newobj, allData)
  assert pid.isSome and not pid.get.isZero
  echo "parent id found: ", $pid
  result = root.infoCenter.fetch(pid.get)
  if result.isNone:
    echo "couldn't find registered object for this id"
    echo root.infoCenter.keys

# gets last open block,
# asks last block's last item whether it expects more data, check if last item fits newobj
# if yes, mark it as the chosen parent.
# if not, check if last block fits newobj. if yes, mark last block as the chosen parent.
# else return none(Construct)

