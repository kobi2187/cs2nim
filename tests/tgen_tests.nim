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

  # working on it:
  when true:
    test "sample6":
      check genTest("sample6")
  when false: # not ready yet.
    test "sample1":
      check genTest("sample1")
    # discard
