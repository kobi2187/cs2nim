import "./utils"
import unittest



suite "code generation tests":
  test "enums":
    check genTest("enums1")
  