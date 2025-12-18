#!/usr/bin/env bash

docker run --rm \
  -v "$(pwd):/work" \
  -v "/config/komodo-syncs:/root/.ssh/id_ed25519" \
  -w /work \
  rayou/sops:latest \
  "$@"
