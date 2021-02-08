import osproc, strutils, sets, hashes, nre, sequtils, math, algorithm, random, system, os
import times
import mapper
import os

type FileErr = object
  file*: string
  output*: string

func perc(part, sum:int) : string =
  $((100 * part / sum).round(2)) & "%"

proc printStats(count, finished, unfinished, cfitsCounter, storeCounter, unsupportedCounter, extractCounter, nullMethodCounter, nilctderef,  afterGen,  beforeGen, likely, tc, otherErrors  : int) =
  let both = finished + unfinished
  echo perc(finished, both) & " : " & perc(unfinished, both)
  echo "failed due to missing cfits ",perc(cfitsCounter,both), " (",cfitsCounter, ")"
  echo "failed due to parentStore missing switch case ",perc(storeCounter,both), " (",storeCounter, ")"
  echo "failed due to unknown parent, child construct not yet supported ",perc(unsupportedCounter,both), " (",unsupportedCounter, ")"
  echo "failed due to extract not impl ",perc(extractCounter,both), " (" , extractCounter , ")"
  echo "failed due to compiletime null ",perc(nilctderef,both), " (",nilctderef, ")"
  echo "failed due to runtime null ",perc(nullMethodCounter,both), " (",nullMethodCounter, ")"
  echo "failed due to likely missed removing annotation ",perc(likely,both), " (",likely, ")"
  echo "failed due to typeCreator missing a switch ",perc(tc,both), " (",tc, ")"
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



proc printEnding(cfits,missingStore,missingExtract,unsupp,tc : HashSet[string],nilDispatch: seq[string]) =
  echo "===cfits=================="
  echo cfits.toSeq.join("\r\n")
  echo "=========parentstore============"
  echo missingStore.toSeq.sorted.reversed.join("\r\n")
  echo "======extract==============="
  echo missingExtract.toSeq.join("\r\n")
  echo "=========find parent for child: (not yet implemented)============"
  echo unsupp.toSeq.join("\r\n")
  echo "=======type creator=============="
  echo tc.toSeq.join("\r\n")
  # echo nilDispatch

proc main() =

  # var file = "/home/kobi7/More_CS_Libs_and_Apps/csast_files"
  var
    cfits = initHashSet[string]()
    missingStore = initHashSet[string]()
    missingExtract = initHashSet[string]()
    unsupp = initHashSet[string]()
    tc = initHashSet[string]()
    likelyAnnotation = initHashSet[string]()
    nilDispatch = newSeq[string]()
    nilCtDeref = newSeq[string]()


  let cfitsRe = re"cfits is missing:(\s+of .*?: true)" # \[Exception\]$"
  let parentStoreRe = re"Error: unhandled exception: .*storeInParent\.nim\(\d+, \d+\) `false` (\w+ -> \w+) plz impl for (parent|child): ck\w+ \[AssertionDefect\]"
  let extractRe = re"most likely `extract` is not implemented for: \w+"
  let dispatchNilRe = re"Error: unhandled exception: cannot dispatch; dispatcher is nil \[NilAccessDefect\]" # this is when generating or using runtime method that messes with BodyExpr for example.
  let unsupportedRe = re"(\w+) is still unsupported"
  let typeCreatorRe = re"Error: unhandled exception: type_creator\.nim(.*)" #(\d+, \d+) `false` still unsupported: of (.*?)\s+"

  let likelyAnnotationProblemRe = re"Error: unhandled exception: parent_finder.nim(\d+, \d+) `discarded == true`  \[AssertionDefect\]"

  var finished: seq[string] = @[]
  var unfinished: seq[string] = @[]
  # counters:
  var otherErrors ,cfitsCounter, storeCounter, unsupportedCounter, extractCounter, nullMethodCounter,  afterGen,  beforeGen = 0

  # start

  let cwd = "/home/kobi7/currentWork/cs2nim"
  # var file = cwd / "nim_syntax_playground" / "sizes_2_smallfirst.txt"
  # var file = cwd / "nim_syntax_playground" / "updated_sizes_smallfirst.txt"
  var file = ""#"/home/kobi7/More_CS_Libs_and_Apps" / "updated_sizes.txt"
  var toolarge = open("/home/kobi7/More_CS_Libs_and_Apps/toobig.txt", fmRead).readAll.splitLines.toHashSet()
  if os.commandLineParams().len > 0:
    file = os.commandLineParams()[0]
  # let f = file.splitPath.head / "finished.txt"
  # var finToAdd = open(f, fmAppend)
  # let finToRead = open(f, fmRead)
  # let assumedFinish = finToRead.readAll.splitLines().toHashSet()
  # finToRead.close

  # ============================== PARAMETERS:
  const random = false
  const reverse= false
  const hasTimeLimit = false
  const timeLimit = 0 + 1 * 60 + 0 * 60 * 60 # seconds
  const hasCountLimit = false
  const limit = 5
  const earlyBreak = false
  # ===========================
  if random: randomize()
  let startTime = times.now()
  var fhandleRead:File
  try:
    fhandleRead = open(file,fmRead)
    let contents = fhandleRead.readAll

    var lines = contents.splitLines()
    let count = contents.countLines


    if random:
      lines.shuffle
    if reverse:
      lines.reverse
    for line in lines:
      let currentTime = times.now()
      let elapsed = currentTime - startTime
      let p = elapsed.toParts
      echo "time elapsed: ", p[Hours] ,":", p[Minutes],":", p[Seconds],":", p[Milliseconds]
      if (hasCountLimit and missingExtract.len + cfits.len + missingStore.len >= limit) or (hasTimeLimit and elapsed.inSeconds > timeLimit) : # or nilDispatch.len > 10:
        break
      echo line.split("/")[^1]
      # sleep 1000
      if not fileExists(line): continue
      if line in toolarge: echo "skipping, to avoid possible out of memory in big file."; continue

      # echo "file size: " & $line.getFileSize()
      let res = execProcess("./writer " & "\"" & line & "\"", cwd, options = {poStdErrToStdOut, poEvalCommand,poUsePath})
      var after:bool
      # echo res
      if res.contains("Error:") or res.contains("Segmentation fault") or res.contains("SIGSEGV: Illegal storage access"):
        unfinished.add line
        echo "had an error."
        if res.contains("=== REACHED GENERATE STAGE ==="):
          after = true
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
          # assert false # to advance here, we need to know the error that we're seeing.
          unsupportedCounter.inc
          let matches = res.find(unsupportedRe)
          if matches.isSome:
            let c = matches.get.captures
            unsupp.incl c[0]
        elif res.contains(likelyAnnotationProblemRe):
          likelyAnnotation.incl line
        elif res.contains(typeCreatorRe):
          let matches = res.find(typeCreatorRe)
          if matches.isSome:
            let c = matches.get.captures
            tc.incl c[0]
        elif res.contains("SIGSEGV: Illegal storage access. (Attempt to read from nil?)"):
          nilCtDeref.add line
        else:
          otherErrors.inc
          if earlyBreak and not after:
            echo res
            assert false
      else:
        if res.contains("finished:"):
          finished.add line
          echo "had finish text!"
        else: echo res; quit 90
        # finToAdd.writeLine(line)

      printStats(lines.len, finished.len, unfinished.len, cfitsCounter , storeCounter , unsupportedCounter, extractCounter , nullMethodCounter, nilCtDeref.len,  afterGen,  beforeGen, likelyAnnotation.len, tc.len, otherErrors)


    echo "FINISHED!"
    printEnding(cfits,missingStore,missingExtract,unsupp,tc ,nilDispatch)
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
    # finToAdd.close

when isMainModule:
  main()