@test "Opening Consul on port 8500" {
  run curl http://localhost:8500
  [ "${status}" -eq 0 ]
}
