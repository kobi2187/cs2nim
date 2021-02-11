import tables, sets, os, system, strutils, sequtils, sugar,algorithm


proc main() =
  var beforeDict = newTable[string,(int,seq[string])]()
  var unfinishedDict = newTable[string,(int,seq[string])]()
  var folderCountBefore = newTable[int,seq[string]]()
  var folderCountTotal = newTable[int,seq[string]]()

  let rootFolder = "/home/kobi7/More_CS_Libs_and_Apps"
  let finishedLines = (rootFolder / "finished.txt").open(fmRead).readAll.splitLines.toHashSet
  let afterGenLines = (rootFolder / "aftergen.txt").open(fmRead).readAll.splitLines.toHashSet
  for k, folder in walkDir(rootFolder, checkDir = true):
    if folder.dirExists:
      echo folder
      var csfiles : seq[string] = @[]
      for file in walkDirRec(folder):
        if file.fileExists and file.endsWith(".csast"):
          # echo file
          csfiles.add file
      echo csfiles.len
      let csfhash = csfiles.toHashSet
      let leftBefore = (csfhash - finishedLines - afterGenLines).toSeq
      let leftUnfinished = (csfhash - finishedLines).toSeq

      beforeDict[folder] = (leftBefore.len,  leftBefore)
      unfinishedDict[folder] = (leftUnfinished.len,  leftUnfinished)
      if not folderCountBefore.hasKey(leftBefore.len): folderCountBefore[leftBefore.len] = @[]
      folderCountBefore[leftBefore.len].add folder
      if not folderCountTotal.hasKey(leftUnfinished.len): folderCountTotal[leftUnfinished.len] = @[]
      folderCountTotal[leftUnfinished.len].add folder

  for k in folderCountBefore.keys.toseq.sorted:
    echo "\n",k
    for dir in folderCountBefore[k]:
      let (count, files) = beforeDict[dir]
      echo files.join("\r\n")

main()