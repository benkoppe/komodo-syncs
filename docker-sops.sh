#!/usr/bin/env bash

docker run --rm \
  -v "$(pwd):/work" \
  -e SOPS_AGE_KEY="$(cat /config/komodo-syncs)" \
  -w /work \
  rayou/sops:latest \
  "$@"
