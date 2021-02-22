import system, os, strutils, options

let lines = open("/home/kobi7/currentWork/cs2nim/nim_syntax_playground/mytypes.txt").readAll.split("\n")
let existing = open("/home/kobi7/currentWork/cs2nim/constructs/cs_all_constructs.nim").readAll

import nre
var count = 0
var res = ""
for a in lines:
  for b in lines:
    var restr = "method\\s+add.*" & $a.strip & ".*" & $b.strip
    # echo "`", restr, "`"
    var reAdd = re(restr)
    let boo = existing.match(reAdd).isSome
    # echo b
    if boo:
      inc count
    else:
      var str = "method add*(parent: var " & $a & "; item: " & $b & ") =\n"
      str &= "  echo \"in method add*(parent: var " & $a & "; item: " & $b & ")\"\n"
      str &= "  todoimpl # TODO(add:" & $a & ", " & $b & ")\n"
      res &= str


echo res
echo count
