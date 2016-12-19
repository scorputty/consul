@test "Opening Consul on port 8300" {
  run curl http://localhost:8300
  [ "${status}" -eq 0 ]
}
