#!/usr/bin/env bats

@test "Opening Consul on port 8500" {
  run curl -I -s -X GET http://localhost:8500
  [ "$status" -eq 0 ]
}
