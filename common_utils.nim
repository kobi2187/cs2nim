# common_utils.nim


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
