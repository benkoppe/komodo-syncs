#!/usr/bin/env bash

docker run --rm \
  -v "$(pwd):/work" \
  -v "$TMP_KEY:/root/.ssh/id_ed25519:ro" \
  -e SOPS_AGE_KEY="$(cat /config/komodo-syncs)" \
  -w /work \
  rayou/sops:latest \
  "$@"
