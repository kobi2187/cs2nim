# writer.nim
import system, strutils, os
import writer_utils#, state
import constructs/cs_root




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
      files = getCsastFiles(fi)
    else: quit("could not find matching or existing file or directory")

    echo files.len
    let inputFolder = fi
    if safer:
      for f in files:
        var root = newCs(CsRoot) # new root each time.
        currentRoot = root
        handleJustOne(inputfolder, root, f)
        writeAll(inputFolder, root)

    else:
      var root = newCs(CsRoot) # only one root to collect all the namespaces.
      handleMany(fi, root, files)
      writeAll(inputFolder, root)
    echo "finished: " & inputFolder

main()
