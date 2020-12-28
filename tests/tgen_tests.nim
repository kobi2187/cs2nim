import "./utils" #, "../writer_utils"
import unittest

const last = false

suite "code generation tests":
  when not last:
  # these should work:
    test "enums":
      check genTest("enums")
    test "a minimal class":
      check genTest("justClass")
    test "sample3":
      check genTest("sample3")
    test "sample2":
      check genTest("sample2")
    test "sample4":
      check genTest("sample4")
    test "sample5":
      check genTest("sample5")
    test "sample6":
      check genTest("sample6")
    test "sample8":
      check genTest("sample8")
    test "sample7":
      check genTest("sample7")
    test "sample1":
      check genTest("sample1")
    test "return new class":
      check genTest("xwtButtonTests")
    test "assign":
      check genTest("sample10")
    test "functions1":
      check genTest("sample11")
    test "functions2":
      check genTest("sample12")
    test "binary expression":
      check genTest("binexp")
  #[
  ]#
  # when true:
    # working on it:
  # when false: # not ready yet.
  #   discard
