@test "image exists" {
  run docker images
  [[ ${output} =~ cloudsploit ]]
}

@test "node is installed" {
  run docker run --read-only --entrypoint apk cloudsploit info nodejs
  [ ${status} -eq 0 ]
}

@test "cloudsploit is installed" {
  run docker run --read-only --entrypoint npm cloudsploit list -g
  [[ ${output} =~ cloudsploit ]]
}

@test "processes run as \"user\"" {
  run docker run --read-only --entrypoint id cloudsploit
  [[ ${output} =~ user ]]
}
