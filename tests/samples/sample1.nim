import dotnet/system/io
import dotnet/system

type Hi* = ref object

proc hello() =
  writeLine("Hello1") # Console
  writeLine("Hello2") # Console

type Second* = ref object

method nextNum(this: Second; c: FileInfo; seven: var int) =
  discard
proc nextNum(c: FileInfo; seven: int): int =
  return 1
