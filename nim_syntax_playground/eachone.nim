import osproc, strutils, sets, hashes, nre, sequtils, math, algorithm, random, system, os
import times
import mapper
import os

type FileErr = object
  file*: string
  output*: string

func perc(part, sum:int) : string =
  if sum != 0:
    $((100 * part / sum).round(2)) & "%"
  else: "0"

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


proc fitsContent(file:string, newfits:string) : string =
  var fh:File
  try:
    fh = open(file)
    let lines = fh.readAll.splitLines
    let exceptLast = lines[0..^2]
    let output = exceptLast.join("\n")
    let last = "\n" & r"""  else: raise newException(Exception, "cfits is missing:  of \"" & $parent.kind & ", " & $item.kind & "\": true")"""
    result &= output & "\n" & newfits & "\n" & last
  finally:  fh.close

proc genFits(newFits:string) =
  echo "in genFits"
  let file = "/home/kobi7/currentWork/cs2nim/cfits.nim"
  let content = fitsContent(file,newFits)
  var fh2:File
  try:
    let fh2 = open(file, fmWrite)
    fh2.write(content)
  finally:
    fh2.close


proc writeToFileCfits(cfits : HashSet[string]) =
  let newfits = cfits.toSeq.join("\r\n")
  echo "saving cfits.nim"
  genFits(newfits)

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

proc main() : bool =

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

  # created with: find /home/kobi7/More_CS_Libs_and_Apps/ -name *.csast -size -2M
  # then run thru sizes.nim, and sort natural in a text editor, and remove (search&replace) ^\d+
  var file = "/home/kobi7/More_CS_Libs_and_Apps/more_updated_sorted.txt"

  if os.commandLineParams().len > 0:
    file = os.commandLineParams()[0]
  let parentFolder = "/home/kobi7/More_CS_Libs_and_Apps"
  # let inhuge = parentFolder.contains(file)
  let toobigfile = file.splitPath.head / "toobig.txt" # "/home/kobi7/More_CS_Libs_and_Apps/toobig.txt"
  let f = file.splitPath.head / "finished.txt"
  let f2 = file.splitPath.head / "aftergen.txt"
  if not fileExists(toobigfile) or not fileExists(f) or not fileExists(f2): quit("a file needed for operation does not exist!")

  var toolarge = open(toobigfile, fmRead).readAll.splitLines.toHashSet()
  let finToRead = open(f, fmRead)
  var afterGenToRead = open(f2, fmRead)
  var assumedFinish = initHashSet[string]()
  var assumedAfter = initHashSet[string]()
  if f.getFileSize > 0:
    assumedFinish =  finToRead.readAll.splitLines().toHashSet()
  if f2.getFileSize > 0:
    let c = afterGenToRead.readAll
    assumedAfter =  c.splitLines().toHashSet()

  finToRead.close
  afterGenToRead.close

  var afterGenToAdd = open(f2, fmAppend)
  var finToAdd = open(f, fmAppend)


  # ============================== PARAMETERS:
  const random = false
  const reverse = false
  const hasTimeLimit = false
  var timeLimit = 0 + #sec
    1 * 60 + #min
    0 * 60 * 60 # hours
  const iterLimit = 25 # in seconds
  const hasCountLimit = false
  const limit = 5
  const earlyBreak = false # TODO: change to true and run with left_report, to quickly fix priority errors.

  const addTime = false
  const timeToAdd = 10 # seconds
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

    var metLimit:bool
    for i, line in lines:
      let iterBeginTime = times.now()
      let elapsed = iterBeginTime - startTime
      let p = elapsed.toParts
      if not fileExists(line):
        continue
      if line in toolarge:
        # echo "skipping, to avoid possible out of memory in big file.";
        continue
      if line in assumedAfter:
        afterGen.inc
        continue # for now, only handle before gen stage (storing stage)
      if line in assumedFinish:
        finished.add line
        continue

      echo "time elapsed: ", p[Hours] ,":", p[Minutes],":", p[Seconds],":", p[Milliseconds]
      if i > 0:
        printStats(lines.len, finished.len, unfinished.len, cfitsCounter , storeCounter , unsupportedCounter, extractCounter , nullMethodCounter, nilCtDeref.len,  afterGen,  beforeGen, likelyAnnotation.len, tc.len, otherErrors)

      echo line.split("/")[^1]
      let metTimeLimit = hasTimeLimit and elapsed.inSeconds > timeLimit
      let countReached =  missingExtract.len + cfits.len + missingStore.len
      let metCountLimit = hasCountLimit and countReached >= limit
      if metTimeLimit and (countReached == 0) and addTime:
        timeLimit += timeToAdd
      else:
        metLimit = metCountLimit or metTimeLimit
        if metLimit: break

      # echo "file size: " & $line.getFileSize()
      let res = execProcess("./writer " & "\"" & line & "\"", cwd, options = {poStdErrToStdOut, poEvalCommand,poUsePath})
      var after:bool
      # echo res
      if res.contains("Error:") or res.contains("Segmentation fault") or res.contains("SIGSEGV: Illegal storage access"):
        unfinished.add line
        # echo "had an error."
        if res.contains("=== REACHED GENERATE STAGE ==="):
          after = true
          afterGen.inc
          afterGenToAdd.writeLine(line)
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
            # echo m
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
          if earlyBreak:
            echo res
            echo "regular (not runtime dispatch related) null dereference error"
            echo line.changeFileExt(".cs")
            echo "reached " & $(finished.len + unfinished.len) & " --  Percent:  " & perc(finished.len+unfinished.len,count)
            assert false
        else:
          otherErrors.inc
          if earlyBreak and not after:
            echo res
            echo "Some other error occured!"
            echo line.changeFileExt(".cs")
            echo "reached " & $(finished.len + unfinished.len) & " --  Percent:  " & perc(finished.len+unfinished.len,count)
            assert false
      else:
        if res.contains("finished:"):
          finished.add line
          finToAdd.writeLine(line)
          # echo "had finish text!"
        else: echo res; quit 90
        # finToAdd.writeLine(line)
      # we run them sorted by size, so if the last one was too long, we break, assuming the next ones will be longer.
      let iterEndTime = times.now()
      if hasTimeLimit and (iterEndTime - iterBeginTime).inSeconds > iterLimit and not random and not reverse:
        break


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

    result = not metLimit
  finally:
    # fhandleRead.close
    afterGenToAdd.close
    finToAdd.close

when isMainModule:
  var isFinishedSuccessfully :bool   = main()
  let cwd = "/home/kobi7/currentWork/cs2nim/"
  sleep 5000
  # echo "attempting to run AddRunner"
  # let res = execCmd("/home/kobi7/currentWork/cs2nim/addrunner")
  # sleep 5000
  when false:
    while not isFinishedSuccessfully:
      echo "iteration!"
      echo "Attempting recompilation!"
      echo "sleeping 5 seconds"
      sleep 5000
      let compileWriter = execProcess("nim c --gc:arc -d:danger /home/kobi7/currentWork/cs2nim/writer.nim", cwd)
      echo compileWriter
      echo "sleeping 5 seconds"
      sleep 5000
      isFinishedSuccessfully = main()
      echo "Finished successfully? ", isFinishedSuccessfully
      echo "attempting to run AddRunner"
      let res = execCmd("/home/kobi7/currentWork/cs2nim/addrunner")
      echo res
      # sleep 5000

