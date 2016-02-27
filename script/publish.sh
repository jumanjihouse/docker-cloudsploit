#!/bin/bash
# vim: set sw=2 ts=2 ai et:
set -e

if [[ $# -lt 1 ]]; then
  echo "ERR: you must pass 1 or more tags as arguments" >&2
  exit 1
fi

tags=$@
IMAGE="cloudsploit"

docker login -e $ROBOT_MAIL -u $ROBOT_USER -p $ROBOT_PASS

for tag in ${tags}; do
  # Ensure the image-to-be-tagged exists.
  docker images | grep ${IMAGE}

  # Create a new tag.
  tagged_name="jumanjiman/${IMAGE}:${tag}"
  docker tag ${IMAGE} ${tagged_name}

  # Ensure the tagged image exists.
  docker images | grep ${IMAGE} | grep ${tag}

  # Publish the tagged image.
  docker push ${tagged_name}
done

docker logout
