import tables, construct, uuids, options #, sequtils
# the idea here is a global uuid to Construct, it should be a single instance, stored within csroot.
type InfoCenter* = ref object
  table: TableRef[UUID, Construct]
proc keys*(x: InfoCenter): seq[UUID] =
  for k in x.table.keys:
    result.add k

proc register*(ic: InfoCenter; id: UUID; obj: Construct) =
  echo "registering Construct of type " & $obj.kind & " with id: " & $id
  if obj.id.isNone: obj.id = some(id)

  ic.table[id] = obj

proc fetch*(ic: InfoCenter; id: UUID): Option[Construct] =
  result = if ic.table.hasKey(id): ic.table[id].some
  else: none(Construct)

proc newInfoCenter*(): InfoCenter =
  new result
  result.table = TableRef[UUID, Construct]()
