# addrunner.nim
import nre, osproc, options, system,os
let cwd = "/home/kobi7/currentWork/cs2nim"

proc mkAdd(p,c:string):string =
  result = "method add*(parent: var " & p & "; item: " & c & ") =\n"
  result &= "  echo \"in method add*(parent: var " & p & "; item: " & c & ")\"\n"
  result &= "  todoimpl # TODO(add: " & p & ", " & c & ")\n\n"

let file = cwd / "missingAdds.nim"
var again:bool = true
# let missingAddRe = re"(?m)Error: type mismatch: got <(\w+), (\w+)>\nbut expected one of:\s\nmethod add"
let missingAddRe = re"type mismatch: got <(\w+), (\w+)>"
while again:
  var res = execProcess("nim c writer.nim", cwd)
  let matches = res.find(missingAddRe)
  again = matches.isSome
  if matches.isSome:
    echo "got matches!"
    let c =  matches.get.captures
    let (parent,child) = (c[0], c[1])
    let addStr = mkAdd(parent,child)
    echo addStr
    let f = open(file, fmAppend)
    try:
      f.write(addStr)
    finally: f.close()