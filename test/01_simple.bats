@test "image exists" {
  run docker images
  [[ ${output} =~ cloudsploit ]]
}

@test "node is installed" {
  run docker run --entrypoint apk cloudsploit info nodejs
  [ ${status} -eq 0 ]
}

@test "cloudsploit is installed" {
  run docker run --entrypoint npm cloudsploit list -g
  [[ ${output} =~ cloudsploit ]]
}

@test "processes run as \"user\"" {
  run docker run --entrypoint id cloudsploit
  [[ ${output} =~ user ]]
}
