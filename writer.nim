# writer.nim
import gen_nim, types
import lineparser, state

import os, system, times
import strutils, os,json

const suffixOutputDir = "nim_code/dotnet"

proc processFiles*(root: var CsRoot; files: seq[string]) =
  for f in files:
    assert f.endsWith(".csast")
    let linesJson = parseFile(f)
    parseExecFile(root, linesJson)

proc concatModulesOutput*(mods: seq[Module]): string =
    for m in mods:
        result &= m.output & "\n\n"

proc writeModule*(folder: var string; module: Module) =
    # if folder is file, take its parent.
    if fileExists(folder):
        folder = parentDir(folder)

    let cwd = folder #getCurrentDir()
    let target = (cwd / suffixOutputDir)
    if not target.dirExists:
        createDir(target)

    let filename = cwd / suffixOutputDir / module.name.replace(".", "/") & ".nim"
    createDir(filename.parentDir)
    writeFile(filename, module.output)




proc writeAll(dir: var string; root: CsRoot) =
    let list = root.gen()
    for module in list:
        writeModule(dir, module)


import json, algorithm
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

      writeAll(fi, root)
      echo "finished"

main()
