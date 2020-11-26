import types, constructs/constructs
import lineparser

import os, system, times
import strutils, os, json

proc getCsastFiles*(folder: string): seq[string] =
  for file in walkDirRec(folder):
    if file.fileExists and file.endsWith(".csast"):
      result.add file


proc processFiles*(root: var CsRoot; files: seq[string]) =
  for f in files:
    assert f.endsWith(".csast")
    let linesJson = parseFile(f)
    parseExecFile(root, linesJson)

proc concatModulesOutput*(mods: seq[Module]): string =
  for m in mods:
    result &= m.output & "\n\n"

let safer* = false
const suffixOutputDir = "nim_code/dotnet"
let dt = now().format("yyyyMMddHHmm")

func mkModuleFilename*(target: string; moduleName: string): string =
  result = target / moduleName.toLowerAscii.replace(".", "/") & ".nim"

proc getTargetFolder(infolder: string): string =
  # if `infolder` is a file, take its parent.
  let folder = if fileExists(infolder):
    parentDir(infolder) else: infolder

  let cwd = folder
  var target = (cwd / suffixOutputDir)

  if safer:
    target &= dt
  result = target

proc doWrite(filename, output: string) =
  if not filename.parentDir.dirExists:
    createDir(filename.parentDir)

  if safer:
    var f: File
    try:
      f = open(filename, fmAppend)
      echo "writing to filename:" & filename
      f.write(output)
    finally:
      f.close
  else:
    echo "writing to filename:" & filename
    writeFile(filename, output)

proc writeModule*(infolder: string; module: Module) =
  let target = getTargetFolder(infolder)
  if not target.dirExists: createDir(target)

  let filename = mkModuleFilename(target, module.name)
  doWrite(filename, module.output)



proc getWriteAllData*(dir: string; root: CsRoot): seq[(string, string)] =
  let list = root.gen()
  for module in list:
    let t = getTargetFolder(dir)
    let f = mkModuleFilename(t, module.name)
    result.add((f, module.output))

proc writeAll*(dir: string; root: CsRoot) =
  when true:
    let list = root.gen()
    for module in list:
      echo module.name
      writeModule(dir, module)
  when false: # alternative impl, that uses the tested getWriteAllData.
    let whatToDo = getWriteAllData(dir, root)
    for (d, output) in whatToDo:
      doWrite(d, output)




import json, algorithm

proc handleJustOne*(inputFolder: string; root: var CsRoot;
    file: string) =
  echo file
  let linesJson = parseFile(file)
  parseExecFile(root, linesJson)

proc stats(i: int; f: string; len: int; sw: DateTime): string =
  let x = i + 1
  var str = (100*x/len).formatFloat(ffDecimal, 2) & "%\t" & $x &
      " / " & $len
  let time = now() - sw
  str &= "\t" & (time.inSeconds.float / x.toFloat).formatFloat(ffDecimal,
      3) & " s\t"
  result = str

proc handleMany*(inputFolder: string; root: var CsRoot; files: seq[string]) =
  var sw = now()
  for i, f in files.sorted:
    let str = stats(i, f, files.len, sw)
    write(stdout, str)

    let linesJson = parseFile(f)
    parseExecFile(root, linesJson)

