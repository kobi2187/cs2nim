# writer.nim
import gen_nim, types
import lineparser, state

import os, system
import strutils, os

const dir = "nim_code"
proc writeModule*(module: Modu) =
  let cwd = getCurrentDir()
  let target = (cwd / dir)
  if not target.dirExists:
    createDir(target)

  # todo: check what happens when we convert `.` in a namespace to `/`
  let filename = cwd / dir / module.name & ".nim"
  writeFile(filename, module.output)




proc writeAll(root: CsRoot) =
  let list = root.gen()
  for module in list:
    writeModule(module)


import json
proc main() =
  echo "Hello world!"
  let params = commandLineParams()
  if params.len == 0: quit("Please pass a file (*.csast) or directory containing such files")
  else:
    let f = params[0]
    var files: seq[string] = @[]
    if fileExists(f) and f.endsWith(".csast"):
      files.add f
    elif f.dirExists():
      for file in walkFiles(joinPath(f, "*.csast")):
        files.add file
    else: quit("could not find matching or existing file or directory")

    for f in files:
      let linesJson = parseFile(f)
      parseExecFile(linesJson)

    writeAll(root)


main()
