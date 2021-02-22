import nre

var res = """101/147489
/home/kobi7/More_CS_Libs_and_Apps/cake-develop/src/Cake.Common/Tools/OctopusDeploy/OctopusPushSettings.csast
eachone.nim(54)          eachone
osproc.nim(507)          execProcess
osproc.nim(1016)         startProcess
osproc.nim(1121)         startProcessAuxFork
oserr.nim(94)            raiseOSError
Cannot allocate memory [OSError]
"""
# let oom2 = re"(?m)(/home/.*csast$)(.*\n)+Cannot allocate memory"
let oom2 = re(r"(?m)(/home/.*csast)(.*\n){0,20}Cannot allocate memory")
if res.contains(oom2):
  echo "got out of memory situation #2 ! Restarting!"
  let matches = res.find(oom2)
  if matches.isSome:
    let c = matches.get.captures
    let oomfile2 = c[0]
    echo "the file2 was:" & oomfile2
else: echo "not found"
