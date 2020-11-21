import gen_nim, types
import lineparser

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

let safer* = false
const suffixOutputDir = "nim_code/dotnet"
let dt = now().format("yyyyMMddHHmm")

proc writeModule*(infolder: string; module: Module) =
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




proc writeAll*(dir: string; root: CsRoot) =
  let list = root.gen()
  for module in list:
    echo module.name
    writeModule(dir, module)



import json, algorithm

proc handleJustOne*(inputFolder: string; root: var CsRoot;
    file: string) =
  echo file
  let linesJson = parseFile(file)
  parseExecFile(root, linesJson)
  writeAll(inputFolder, root)


proc handleMany*(inputFolder: string; root: var CsRoot; files: seq[string]) =
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

