import tables, construct, uuids, options
# the idea here is a global uuid to Construct, it should be a single instance, stored within csroot.
type InfoCenter* = ref object
  table: TableRef[UUID, Construct]

proc register*(ic: InfoCenter; id: UUID; obj: Construct) =
  echo "registering Construct of type " & $obj.kind & " with id: " & $id
  ic.table[id] = obj

proc fetch*(ic: InfoCenter; id: UUID): Option[Construct] =
  result = if ic.table.hasKey(id): ic.table[id].some
  else: none(Construct)

proc newInfoCenter*(): InfoCenter =
  new result
  result.table = TableRef[UUID, Construct]()
