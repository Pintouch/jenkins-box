#!/usr/bin/env bats

# More info at https://github.com/sstephenson/bats
@test "git binary is found in PATH" {
  run which git
  [ "$status" -eq 0 ]
}
