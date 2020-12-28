import "./utils" #, "../writer_utils"
import unittest

const last = false

suite "code generation tests":
  when not last:
  # these should work:
    test "1. enums":
      check genTest("enums")
    test "2. a minimal class":
      check genTest("justClass")
    test "3. sample3":
      check genTest("sample3")
    test "4. sample2":
      check genTest("sample2")
    test "5. sample4":
      check genTest("sample4")
    test "6. sample5":
      check genTest("sample5")
    test "7. sample6":
      check genTest("sample6")
    test "8. sample8":
      check genTest("sample8")
    test "9. sample7":
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
    echo "OK total: 15"
  #[
  ]#
  # when true:
    # working on it:
  # when false: # not ready yet.
  #   discard
