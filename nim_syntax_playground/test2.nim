# test2.nim

import nre, strutils
proc removeComments(s: string): string =
  if s.contains("//"):
    var res = s.replace(re"(?m)//.*$", "")
    result = res.strip(chars = {'\r', '\n'})
  elif s.contains("/*") and s.contains("*/"):
    var res = s.replace(re"(?s)/\*.*?\*/", "")
    result = res
  else: result = s
  echo result



var
  txt = "// some comment"
  txt2 = txt & "\n some other code"
  txt3 = "/* some middle comment*/ then code"
  txt4 = " some /* comment \n spanning multiple\n lines */ and only then some code."
doAssert txt.removeComments == ""
doAssert txt2.removeComments == " some other code"
doAssert txt3.removeComments == " then code"
doAssert txt4.removeComments == " some  and only then some code."
