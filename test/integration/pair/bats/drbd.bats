#!/usr/bin/env bats

@test "master set up correctly" {
  if [[ "$(hostname)" == *"d1"* ]]; then
    grep 'cs:SyncSource ro:Primary/Secondary ds:UpToDate/Inconsistent' /proc/drbd
  fi
}

@test "slave set up correctly" {
  if [[ "$(hostname)" == *"d2"* ]]; then
    grep 'cs:SyncTarget ro:Secondary/Primary ds:Inconsistent/UpToDate' /proc/drbd
  fi
}
