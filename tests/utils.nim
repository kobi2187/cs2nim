import system, os
import ../types, ../writer, ../gen_nim

proc handleFiles(files: seq[string]): string =
  # generates an output string from files processed into tree
  var tree = CsRoot()
  processFiles(tree, files)
  var ls = tree.gen()
  result = concatModulesOutput(ls)


# for tests, we assume we will only use one file as output. that is, a correct nim generated file.
# i/o tests have the namespace to files test.
proc genTest*(filename: string): bool =
  let
    dir = "./samples"
    src = filename & ".csast"
    outp = filename & ".nim"
  if not dirExists(dir):
    echo "directory " & dir & "does not exist"
    return false
  if not fileExists(src):
    echo "file " & src & "does not exist"
    return false
  if not fileExists(outp):
    echo "file " & outp & "does not exist"
    return false
# lkj
  let contents = readFile(outp)
  let gen = handleFiles(@[src])

  return contents == gen
