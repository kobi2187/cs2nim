# parse a csast file, to just get the declnames
import json

proc upcoming(jsn: JsonNode): seq[string] =
  let x = jsn["Lines"].getElems()
  for ln in x:
    if ln["KindStr"].getStr() == "Decl":
      result.add ln["Declaration"].getStr()

let jsn = json.parseFile("tests/samples/sample5.csast")
echo upcoming(jsn)
