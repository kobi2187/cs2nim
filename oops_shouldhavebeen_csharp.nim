import nre, strutils
proc removeAnnotations(contents: string): string =
  let annotationRE = nre.re"^\s*\[\w+(\(.*?\))?\]\s*$"
  result = contents.replace(annotationRE, "")

proc removeComments(s: string): string =
  if s.contains("//"):
    var res = s.replace(nre.re"(?m)//.*$", "")
    result = res.strip(chars = {'\r', '\n'})
  elif s.contains("/*") and s.contains("*/"):
    var res = s.replace(nre.re"(?s)/\*.*?\*/", "")
    result = res
  else: result = s
  echo result

proc cleanUp(contents: string): string =
  # remove some unsupported that have no effect on the code and semantics: annotations, comments, .. others?
  result = contents.removeComments.removeAnnotations
