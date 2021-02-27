import system, os, osproc
import ../types, uuids, options, ../writer_utils,
    ../constructs/cs_all_constructs


import sequtils
proc nsToFolders*(namespaces: seq[string]): seq[string] =
  result = namespaces.mapIt(".".mkModuleFilename(it))

import ../constructs/cs_root
proc handleFiles(files: seq[string]): string =
  # generates an output string from files processed into tree
  var tree = newCs(CsRoot)
  processFiles(tree, files)
  var ls = tree.gen()
  result = concatModulesOutput(ls)

import strutils
# for tests, we assume we will only use one file as output. that is, a correct nim generated file.
# i/o tests have the namespace to files test.
proc genTest*(file: string, hasDir=false): bool =
  var
    filename = ""
    dir = ""
    outp = ""
    src = ""
  if hasDir:
    dir = file.parentDir()
    filename = file.changeFileExt("")
    src = filename & ".csast"
    outp = filename & ".nim"
  else:
    let pwd = getCurrentDir()
    dir = pwd / "tests/samples"
    filename = file
    src = dir / filename & ".csast"
    outp = dir / filename & ".nim"

  echo dir
  if not dirExists(dir):
    echo "directory `" & dir & "` does not exist"
    return false
  if not fileExists(src):
    echo "file `" & src & "` does not exist"
    return false
  if not fileExists(outp):
    echo "file `" & outp & "` does not exist"
    discard execCmd("touch " & outp)
    return false
# lkj
  let contents = readFile(outp).strip
  let gen = handleFiles(@[src]).strip.replace("\r\n", "\n")

  if contents != gen:
    echo "expected: `" & contents & "`"
    echo "got: `" & gen & "`"
    writeFile("/tmp/expected", contents)
    writeFile("/tmp/got", gen)
    discard execShellCmd("diff -a -d --color=always /tmp/expected /tmp/got")

  return contents == gen
