import osproc, strutils, sets, hashes, nre, sequtils, math, algorithm, random, system, os
import times
import mapper
import os

type FileErr = object
  file*: string
  output*: string

func perc(part, sum:int) : string =
  $((100 * part / sum).round(2)) & "%"

proc printStats(count, finished, unfinished, cfitsCounter, storeCounter, unsupportedCounter, extractCounter, nullMethodCounter,  afterGen,  beforeGen, otherErrors  : int) =
  let both = finished + unfinished
  echo perc(finished, both) & " : " & perc(unfinished, both)
  echo "failed due to missing cfits ",perc(cfitsCounter,both), " (",cfitsCounter, ")"
  echo "failed due to parentStore missing switch case ",perc(storeCounter,both), " (",storeCounter, ")"
  echo "failed due to unknown parent, child construct not yet supported ",perc(unsupportedCounter,both), " (",unsupportedCounter, ")"
  echo "failed due to extract not impl ",perc(extractCounter,both), " (" , extractCounter , ")"
  echo "failed due to runtime null ",perc(nullMethodCounter,both), " (",nullMethodCounter, ")"
  echo "Other errors: ", perc(otherErrors, both), " (",otherErrors, ")"
  echo "failed after gen ",perc(afterGen,both), " (",afterGen, ")"
  echo "failed before gen ",perc(beforeGen,both), " (",beforeGen,")"
  echo "no errors + passed storing stage ",perc(finished + afterGen, both)
  echo both, "/", count, " = " , perc(both,count)

proc genFits(newFits:string, dryRun=true) : string =
  echo "in genFits"
  let file = "/home/kobi7/currentWork/cs2nim/cfits.nim"
  var fh:File
  try:
    fh = open(file)
    let lines = fh.readAll.splitLines
    let exceptLast = lines[0..^2]
    let output = exceptLast.join("\n")
    let last = "\n" & r"""  else: raise newException(Exception, "cfits is missing:  of \"" & $parent.kind & ", " & $item.kind & "\": true")"""
    result &= output & "\n" & newfits & "\n" & last
  finally:  fh.close
  if not dryRun:
    var fh2:File
    try:
      let fh2 = open(file, fmWrite)
      fh2.write(result)
    finally:
      fh2.close


proc writeToFileCfits(cfits : HashSet[string]) =
  let newfits = cfits.toSeq.join("\r\n")
  echo "saving cfits.nim"
  discard genFits(newfits, false)

proc writeToFileStoreMapping(missingStore : HashSet[string]) =
  let newstores = missingStore.toSeq.sorted.join("\r\n")
  let file =  "/home/kobi7/currentWork/cs2nim" / "nim_syntax_playground" / "parentKidMapping.txt"
  var fh:File
  try:
    fh = open(file,fmAppend)
    echo "saving parent to kid mapping"
    fh.write("\n" & newstores)
  finally:
    fh.close
proc writeToFileStoreParent() =
  let gen = genStoreInParent()
  let file =  "/home/kobi7/currentWork/cs2nim" / "storeInParent.nim"
  var fh:File
  try:
    fh = open(file,fmWrite)
    echo "saving generated storeInParent.nim"
    fh.write(gen)
  finally:
    fh.close

proc runAddRunner() =
  echo "trying to run add runner!"
  # let cwd = "/home/kobi7/currentWork/cs2nim"
  let res = execCmd("/home/kobi7/currentWork/cs2nim/addrunner")
  echo res



proc printEnding(cfits,missingStore,missingExtract,unsupp : HashSet[string],nilDispatch: seq[string]) =
  echo "====================="
  echo cfits.toSeq.join("\r\n")
  echo "====================="
  echo missingStore.toSeq.sorted.reversed.join("\r\n")
  echo "====================="
  echo missingExtract.toSeq.join("\r\n")
  echo "====================="
  echo unsupp.toSeq.join("\r\n")

  # echo nilDispatch

proc main() =

  # var file = "/home/kobi7/More_CS_Libs_and_Apps/csast_files"
  var
    cfits = initHashSet[string]()
    missingStore = initHashSet[string]()
    missingExtract = initHashSet[string]()
    unsupp = initHashSet[string]()
    likelyAnnotation = initHashSet[string]()
    nilDispatch = newSeq[string]()

  let cfitsRe = re"cfits is missing:(\s+of .*?: true)" # \[Exception\]$"
  let parentStoreRe = re"Error: unhandled exception: storeInParent.nim\(\d+, \d+\) `false` (\w+ -> \w+) plz impl for (parent|child): ck\w+ \[AssertionDefect\]"
  let extractRe = re"most likely `extract` is not implemented for: \w+"
  let dispatchNilRe = re"Error: unhandled exception: cannot dispatch; dispatcher is nil \[NilAccessDefect\]" # this is when generating or using runtime method that messes with BodyExpr for example.
  let unsupportedRe = re"(\w+) is still unsupported"

  let likelyAnnotationProblemRe = re"Error: unhandled exception: parent_finder.nim(\d+, \d+) `discarded == true`  \[AssertionDefect\]"

  var finished: seq[string] = @[]
  var unfinished: seq[string] = @[]
  # counters:
  var otherErrors ,cfitsCounter, storeCounter, unsupportedCounter, extractCounter, nullMethodCounter,  afterGen,  beforeGen = 0

  # start

  let cwd = "/home/kobi7/currentWork/cs2nim"
  var file = cwd / "nim_syntax_playground" / "sizes_2_smallfirst.txt"
  if os.commandLineParams().len > 0:
    file = os.commandLineParams()[0]
  let f = file.splitPath.head / "finished.txt"
  var finToAdd = open(f, fmAppend)
  let finToRead = open(f, fmRead)
  let assumedFinish = finToRead.readAll.splitLines().toHashSet()
  finToRead.close

  # ============================== PARAMETERS:
  let random = false
  let hasLimit = true
  let hasTimeLimit = true
  let timeLimit = 5 * 60 # seconds
  let limit = 20
  # ===========================
  if random: randomize()
  let startTime = times.now()
  var fhandleRead:File
  try:
    fhandleRead = open(file,fmRead)
    let contents = fhandleRead.readAll
    let count = contents.countLines
    var lines = contents.splitLines()
    var newlines = lines.toHashSet.difference(assumedFinish).toSeq
    finished.add assumedFinish.toSeq
    if random:
      newlines.shuffle
    for line in newlines:
      # GC_fullCollect()
      # if line in assumedFinish:
      #   finished.add line
      #   continue
      let currentTime = times.now()
      let elapsed = currentTime - startTime
      echo "time elapsed: ", elapsed
      if hasLimit and ((hasTimeLimit and elapsed.inSeconds > timeLimit) or (missingExtract.len + cfits.len + missingStore.len >= limit)): # or nilDispatch.len > 10:
        # printEnding(cfits,missingStore,missingExtract,unsupp ,nilDispatch)
        break
      echo line.split("/")[^1]
      if not fileExists(line): continue
      let res = execProcess("./writer " & line, cwd, options = {poStdErrToStdOut, poEvalCommand,poUsePath})
      # echo res
      if res.contains("Error:"):
        unfinished.add line
        echo "had an error."
        if res.contains("=== REACHED GENERATE STAGE ==="):
          afterGen.inc
        else: beforeGen.inc
        if res.contains("cfits is missing:"):
          cfitsCounter.inc
          let matches = res.find(cfitsRe)
          if matches.isSome:
            let c = matches.get.captures
            cfits.incl c[0]
        elif res.contains(parentStoreRe):
          storeCounter.inc
          let matches = res.find(parentStoreRe)
          if matches.isSome:
            let c = matches.get.captures
            missingStore.incl c[0]
        elif res.contains(extractRe):
          extractCounter.inc
          let matches = res.findAll(extractRe)
          for m in matches:
            echo m
            missingExtract.incl m
        elif res.contains(dispatchNilRe):
          nullMethodCounter.inc
          nilDispatch.add line # add the file that failed.
        elif res.contains(unsupportedRe):
          unsupportedCounter.inc
          let matches = res.find(unsupportedRe)
          if matches.isSome:
            let c = matches.get.captures
            unsupp.incl c[0]
        elif res.contains(likelyAnnotationProblemRe):
          likelyAnnotation.incl line
        else:
          otherErrors.inc
          # echo res
          # assert false
      else:
        finished.add line
        finToAdd.writeLine(line)

      # printStats(count, finished.len, unfinished.len, cfits.len , missingStore.len , unsupp.len, missingExtract.len , nilDispatch.len,  afterGen,  beforeGen, otherErrors)
      printStats(count, finished.len, unfinished.len, cfitsCounter , storeCounter , unsupportedCounter, extractCounter , nullMethodCounter,  afterGen,  beforeGen, otherErrors)


    echo "FINISHED!"
    printEnding(cfits,missingStore,missingExtract,unsupp ,nilDispatch)
    if cfits.len > 0:
      echo "cfits unique: " & $cfits.len
      writeToFileCfits(cfits)
    if storeCounter > 0:
      echo "missing stores unique: " & $missingStore.len
      writeToFileStoreMapping(missingStore)
      writeToFileStoreParent()
      runAddRunner()
    if likelyAnnotation.len > 0:
      for ln in likelyAnnotation.toSeq:
        discard execCmd("dotnet /home/kobi7/currentWork/CsDisplay/bin/Release/netcoreapp2.2/CsDisplay.dll " & ln)


  finally:
    fhandleRead.close
    finToAdd.close

when isMainModule:
  main()