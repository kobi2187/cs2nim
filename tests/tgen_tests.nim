import "./utils" #, "../writer_utils"
import unittest

const last = false

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
  #[
    test "07. sample6":
      check genTest("sample6")
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
  when true:
    discard
    # working on it:
  # when false: # not ready yet.
  #   discard
