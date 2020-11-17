import "./utils"
import unittest
import os

suite "tests that involve I/O":
  setup:
    # remove target folder
    removeDir("module_test")
    createDir("module_test")

  test "namespaces to nim modules":
    assert true #TODO
