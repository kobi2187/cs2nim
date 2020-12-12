import state, stacks, sequtils, uuids, types, strutils

proc newBlock*(thetype: string, info: Info, id: UUID): Block =
  result.name = thetype
  result.info = info
  result.id = id

proc `$`*(it: Block): string =
  if not it.info.isNil and it.info.essentials.len > 0:
    result = it.name & ": `" & it.info.essentials[0] & "`"
    if it.info.extras.len > 0:
      result &= " " & it.info.extras[0]
  else: result = it.name

proc `$`*(blocks: Stack[Block]): string =
  let x = blocks.toSeq.mapIt($it)
  result = $x

proc nameFromCsast(b: Block): string =
  result = ""
  if b.info.extras.len > 0: result = b.info.extras[0]
proc endBlock*(info: Info) =
  echo state.blocks
  assert(blocks.len > 0, "blocks is empty! but we got EndBlock")
  assert info.declName == "EndBlock"
  let blockCount = parseInt(info.essentials[0])
  echo "before: " & $blocks.len

  # on endBlock we now always expect to see an even number of items.
  if (blocks.len mod 2 != 0):
    echo blocks.pop
    return
  var last = blocks.pop # we do it twice now.
  let bs = blocks.pop
  assert bs.name == "BlockStarts"

  echo "block count, according to csast:" & $blockCount
  echo "block count, according to our count:" & $(blocks.len div 2)
  assert blocks.len == blockCount*2, $blocks

  echo "removed " & $last & " from blocks tracking. (assumes we finished with it)"


  echo "-- End of block: " & $last
import stacks
proc resetBlocks*() = blocks.clear()