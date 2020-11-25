import "./utils", "../writer_utils"
import unittest

const last = true

suite "code generation tests":
  when not last:
  # these should work:
    test "enums":
      check genTest("enums")
    test "a minimal class":
      check genTest("justClass")
    test "sample3":
      check genTest("sample3")

  # working on it:
  test "sample2":
    check genTest("sample2")

  when false: # not ready yet.
    test "sample1":
      check genTest("sample1")
