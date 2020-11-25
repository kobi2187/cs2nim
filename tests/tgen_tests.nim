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

  # working on it:
  test "sample3":
    check genTest("sample3")

  # not ready yet.
    # test "sample2":
    #   check genTest("sample2")
    # test "sample1":
    #   check genTest("sample1")
