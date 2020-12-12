# parent_finder.nim
import options
import info_center
import types, construct, constructs/cs_all_constructs

proc cfits*(parent, item: Construct; data: AllNeededData): bool = # asks the inner types to implement fits for these type arguments.
  result = false #TODO

proc getFittingParent(obj: Construct): Option[Construct] = discard # not sure i need this.


# get parent checks that the types fit each other, and decides whether parent is a block type or one of its last added items, that expects to store that object. if cannot decide, we'll need to add more information from the C# side.
# figures out path from blocks. blocks now contain id as well.
# the bulk of the work shifts to here.
import constructs/cs_root
proc getParent*(root: var CsRoot; newobj: Construct; allData: AllNeededData): Option[Construct] = discard
# gets last open block,
# asks last block's last item whether it expects more data, check if last item fits newobj
# if yes, mark it as the chosen parent.
# if not, check if last block fits newobj. if yes, mark last block as the chosen parent.
# else return none(Construct)

