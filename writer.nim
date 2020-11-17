# writer.nim
import gen_nim, types
import lineparser, state

import os, system, times
import strutils, os, json


proc processFiles*(root: var CsRoot; files: seq[string]) =
  for f in files:
    assert f.endsWith(".csast")
    let linesJson = parseFile(f)
    parseExecFile(root, linesJson)

proc concatModulesOutput*(mods: seq[Module]): string =
  for m in mods:
    result &= m.output & "\n\n"

let safer = true
const suffixOutputDir = "nim_code/dotnet"

proc writeModule*(infolder: string; module: Module; dt = "") =
  # if folder is file, take its parent.
  var folder = infolder
  if fileExists(infolder):
    folder = parentDir(infolder)

  let cwd = folder
  var target = (cwd / suffixOutputDir)

  if safer:
    target &= dt

  if not target.dirExists:
    createDir(target)

  let filename = target / module.name.replace(".", "/") & ".nim"
  createDir(filename.parentDir)
  if safer:
    var f: File
    try:
      f = open(filename, fmAppend)
      f.write(module.output)
    finally:
      f.close
  else:
    writeFile(filename, module.output)




proc writeAll(dir: string; root: CsRoot; dt = "") =
  let list = root.gen()
  for module in list:
    writeModule(dir, module, dt)



import json, algorithm

proc handleJustOne(inputFolder: string; root: var CsRoot;
    file: string; dt: string) =
  echo file
  let linesJson = parseFile(file)
  parseExecFile(root, linesJson)
  writeAll(inputFolder, root, dt)


proc handleMany(inputFolder: string; root: var CsRoot; files: seq[string]) =
  var sw = now()
  for i, f in files.sorted:
    let x = i + 1
    var str = (100*x/files.len).formatFloat(ffDecimal, 2) & "%\t" & $x &
        " / " & $files.len
    let time = now() - sw
    str &= "\t" & (time.inSeconds.float / x.toFloat).formatFloat(ffDecimal,
        3) & " s\t"
    write(stdout, str)

    let linesJson = parseFile(f)
    parseExecFile(root, linesJson)

  writeAll(inputFolder, root)

import create
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
    if safer:
      let dt = now().format("yyyyMMddHHmm")
      echo dt
      for f in files:
        var root = newCsRoot() # new root each time.
        handleJustOne(fi, root, f, dt)
    else:
      var root = newCsRoot() # only one root to collect all the namespaces.
      handleMany(fi, root, files)
    echo "finished"

main()
