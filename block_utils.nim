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

# proc nameFromCsast(b: Block): string =
#   result = ""
#   if b.info.extras.len > 0: result = b.info.extras[0]

proc endBlock*(info: Info) =
  echo state.blocks
  assert(blocks.len > 0, "blocks is empty! but we got EndBlock")
  assert info.declName == "EndBlock"
  let blockCount = parseInt(info.essentials[0])
  let finishingBlock = info.essentials[1]
  echo blocks
  echo "before: " & $blocks.len

  # on endBlock we now always expect to see an even number of items.
  if (blocks.len mod 2 != 0):
    echo blocks.pop
    return

  echo "the finishing block should be: " & finishingBlock
  # note: if endblock raises an assert, it means a previous construct was not recorded in blockTypesTxt.
  let bs = blocks.pop # we do it twice now. (as of 20/02/2021 the first item is the construct, second is the block.)
  let last = blocks.pop
  assert bs.name == "BlockStarts", bs.name

  echo "block count, according to csast:" & $blockCount
  echo "block count, according to our count:" & $blocks.len & " / 2 = " & $(
      blocks.len / 2)
  assert blocks.len == blockCount*2, $blocks

  echo "removed " & $last & " from blocks tracking. (assumes we finished with it)"


  echo "-- End of block: " & $last
import stacks
proc resetBlocks*() = blocks.clear()

import construct, options, tables
proc getLastBlocks*(types: openArray[ConstructKind]): Option[Block] =
  let typestrs :seq[string] = types.mapIt(if ckToStr.hasKey(it): ckToStr[it] else: "unknown")
  result = getLastBlocks(typestrs)

proc getLastTypes*(types: openArray[ConstructKind]): Option[Block] =
  let typestrs :seq[string] = types.mapIt(if ckToStr.hasKey(it): ckToStr[it] else: "unknown")
  result = getLastTypes(typestrs)