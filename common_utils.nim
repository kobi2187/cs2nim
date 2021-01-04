# common_utils.nim
import strutils
proc last*[T](s: seq[T]): T =
  result = s[s.len-1]

proc isEmpty*[T](s: seq[T]): bool =
  result = (s.len == 0)

import tables

proc pairs[A, B](t: TableRef[A, B]): seq[(A, B)] =
  for p in pairs(t):
    result.add p

proc keys[A, B](t: TableRef[A, B]): seq[A] =
  for k in keys(t):
    result.add k


proc lowerFirst*(s: string): string =
  if s.len == 0: return ""
  if s.len == 1:
    result = "" & s[0].toLowerAscii
  if s.len > 1:
    result = s[0].toLowerAscii & s[1..^1]
