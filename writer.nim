# writer.nim
import system, strutils, os, writer_utils, create
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
      for f in files:
        var root = newCsRoot() # new root each time.
        handleJustOne(fi, root, f)
    else:
      var root = newCsRoot() # only one root to collect all the namespaces.
      handleMany(fi, root, files)
    echo "finished"

main()
