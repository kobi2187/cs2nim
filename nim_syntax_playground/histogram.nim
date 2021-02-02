# I want to know what to work on first, which construct blocks us first in a list of sample libs, 
# and later also tell me how many managed to finish
# first I ran this bash command (from CSharpSampleLibs directory):
# for d in `ls .`; do echo $d &&   ~/currentWork/cs2nim/writer $d ; done >& results.txt
# hmm, better to run latest csdisplay first. try:
# for d in `ls .`; do echo $d && dotnet ~/currentWork/CsDisplay/bin/Release/netcoreapp2.2/CsDisplay.dll && ~/currentWork/cs2nim/writer $d ; done >& results.txt



import re, strutils, tables, sequtils

let file = "/boot/efi/Downloads/CSharpSampleLibs/results.txt"
let contents = readFile(file).string
var histogram = newCountTable[string]()
let found = contents.findAll(re"Unimplemented: (\w+)")
# echo found
for item in found:
  histogram.inc(item)

histogram.sort

echo histogram
