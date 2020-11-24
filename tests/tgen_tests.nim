import "./utils", "../writer_utils"
import unittest



suite "code generation tests":
  test "enums":
    check genTest("enums")
  test "a minimal class":
    check genTest("justClass")

  # test "sample1":
  #   check genTest("sample1")
  # test "sample2":
  #   check genTest("sample2")
