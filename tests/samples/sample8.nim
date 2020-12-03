type Second* = ref object

method nextNum(this: Second; c: FileInfo; seven: var int) =
  discard
proc nextNum(c: FileInfo; seven: int): int =
  return 1
