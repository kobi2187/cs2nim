import osproc, strutils, sets, hashes, nre, sequtils, math, algorithm, random, system, os
import times
import mapper
import os

type FileErr = object
  file*: string
  output*: string

func perc(part, sum:int) : string =
  $((100 * part / sum).round(2)) & "%"

proc printStats(count, finished, unfinished, cfitsCounter, storeCounter, unsupportedCounter, extractCounter, nullMethodCounter,  afterGen,  beforeGen  : int) =
  let both = finished + unfinished
  echo perc(finished, both) & " : " & perc(unfinished, both)
  echo "failed due to missing cfits ",perc(cfitsCounter,both), " (",cfitsCounter, ")"
  echo "failed due to parentStore missing switch case ",perc(storeCounter,both), " (",storeCounter, ")"
  echo "failed due to unknown parent, child construct not yet supported ",perc(unsupportedCounter,both), " (",unsupportedCounter, ")"
  echo "failed due to extract not impl ",perc(extractCounter,both), " (" , extractCounter , ")"
  echo "failed due to runtime null ",perc(nullMethodCounter,both), " (",nullMethodCounter, ")"
  echo "failed after gen ",perc(afterGen,both), " (",afterGen, ")"
  echo "failed before gen ",perc(beforeGen,both), " (",beforeGen,")"
  echo "no errors + passed storing stage ",perc(finished + afterGen, both)
  echo both, "/", count

proc genFits(newFits:string, dryRun=true) : string =
  echo "in genFits"
  let file = "/home/kobi7/currentWork/cs2nim/cfits.nim"
  var fh:File
  try:
    fh = open(file)
    let lines = fh.readAll.splitLines
    let exceptLast = lines[0..^2]
    let output = "\n" & exceptLast.join("\n")
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
    nilDispatch = newSeq[string]()

  let cfitsRe = re"cfits is missing:(\s+of .*?: true)" # \[Exception\]$"
  let parentStoreRe = re"Error: unhandled exception: storeInParent.nim\(\d+, \d+\) `false` (\w+ -> \w+) plz impl for (parent|child): ck\w+ \[AssertionDefect\]"
  let extractRe = re"most likely `extract` is not implemented for: \w+"
  let dispatchNilRe = re"Error: unhandled exception: cannot dispatch; dispatcher is nil \[NilAccessDefect\]" # this is when generating or using runtime method that messes with BodyExpr for example.
  let unsupportedRe = re"(\w+) is still unsupported"

  var finished: seq[string] = @[]
  var unfinished: seq[string] = @[]
  # counters:
  var cfitsCounter, storeCounter, unsupportedCounter, extractCounter, nullMethodCounter,  afterGen,  beforeGen = 0

  # start

  let cwd = "/home/kobi7/currentWork/cs2nim"
  var file = cwd / "nim_syntax_playground" / "sizes_2_smallfirst.txt"
  var file2 = open(file.splitPath.head / "unfinished.txt", fmAppend)
  if os.commandLineParams().len > 0:
    file = os.commandLineParams()[0]
  let hasLimit = true
  let hasTimeLimit = false
  let timeLimit : int = (1.5 * 60).int # seconds
  let limit = 20
  randomize()
  let startTime = times.now()
  # duh, impossible to detect: program exits, even the "host" program.
  # let oom = re(r"(.*)\nout of memory")
  # let oom2 = re(r"(?m)(/home/.*csast)(.*\n){0,20}Cannot allocate memory")


  var fhandleRead:File
  try:
    fhandleRead = open(file,fmRead)
    let contents = fhandleRead.readAll
    let count = contents.countLines
    var lines = contents.splitLines()
    lines.shuffle
    for line in lines:
      # GC_fullCollect()
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
        file2.writeLine(line)
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
        else:
          discard #        echo res; assert false
      else:
        finished.add line
      printStats(count, finished.len, unfinished.len, cfits.len , missingStore.len , unsupp.len, missingExtract.len , nilDispatch.len,  afterGen,  beforeGen)


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


  finally:
    fhandleRead.close
    file2.close

when isMainModule:
  main()