import "./utils" #, "../writer_utils"
import unittest, os, sequtils, strutils

proc getMonoTests():seq[string] =
  let dir= "/home/kobi7/currentWork/cs2nim/tests/samples/monotests/tests"
  for a in walkDirRec(dir):
    if a.endsWith(".cs"):
      result.add a

const last = true
suite "tests from mono":
  test "mono tests":
    let scanned = getMonoTests()
    for a in scanned:
      check genTest(a, hasDir=true)
when false:
  suite "code generation tests":
    when not last:
    # these should work:
      test "01. enums":
        check genTest("enums")
      test "02. a minimal class":
        check genTest("justClass")
      test "03. sample3":
        check genTest("sample3")
      test "04. sample2":
        check genTest("sample2")
      test "05. sample4":
        check genTest("sample4")
      test "06. sample5":
        check genTest("sample5")
    when true:
      test "07. sample6":
        check genTest("sample6")
    #[
      test "08. sample8":
        check genTest("sample8")
      test "09. sample7":
        check genTest("sample7")
      test "10. sample1":
        check genTest("sample1")
      test "11. return new class":
        check genTest("xwtButtonTests")
      test "12. assign":
        check genTest("sample10")
      test "13. functions1":
        check genTest("sample11")
      test "14. functions2":
        check genTest("sample12")
      test "15. binary expression":
        check genTest("binexp")
      test "16. field and assignment between variables":
        check genTest("sample13")
      # echo "OK total: 16"
    ]#
      # discard
      # working on it:
    # when false: # not ready yet.
    #   discard
