import dotnet/system/io
import dotnet/system

type Hi* = ref object

proc hello() =
  writeLine("Hello1")
  writeLine("Hello2")

type Second* = ref object

method nextNum(this: Second; c: FileInfo; seven: var int) =
  discard
proc nextNum(c: FileInfo; seven: int): int =
  return 1
