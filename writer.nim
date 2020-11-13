# writer.nim
import gen_nim, types
import lineparser, state

import os, system
import strutils, os

const dir = "nim_code"
proc writeModule*(folder: var string; module: Module) =
  # if folder is file, take its parent.
  if fileExists(folder):
    folder = parentDir(folder)

  let cwd = folder #getCurrentDir()
  let target = (cwd / dir)
  if not target.dirExists:
    createDir(target)

  # todo: check what happens when we convert `.` in a namespace to `/`
  let filename = cwd / dir / module.name.replace(".", "/") & ".nim"
  createDir(filename.parentDir)
  writeFile(filename, module.output)




proc writeAll(dir: var string; root: CsRoot) =
  let list = root.gen()
  for module in list:
    writeModule(dir, module)


import json
proc main() =
  echo "Hello world!"
  let params = commandLineParams()
  if params.len == 0: quit("Please pass a file (*.csast) or directory containing such files")
  else:
    var fi = params[0]
    var files: seq[string] = @[]
    if fileExists(fi) and fi.endsWith(".csast"):
      files.add fi
    elif fi.dirExists():
      # for file in walkFiles(joinPath(fi, "**/*.csast")):
      for file in walkDirRec(fi):
        if file.fileExists and file.endsWith(".csast"):
          files.add file
    else: quit("could not find matching or existing file or directory")

    echo files.len
    for f in files:
      let linesJson = parseFile(f)
      parseExecFile(linesJson)

    writeAll(fi, root)
    echo "finished"

main()
