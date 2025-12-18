#!/usr/bin/env bash

TMP_KEY=$(mktemp)
cp /config/komodo-syncs "$TMP_KEY"
chmod 600 "$TMP_KEY"

docker run --rm \
  -v "$(pwd):/work" \
  -v "$TMP_KEY:/root/.ssh/id_ed25519:ro" \
  -w /work \
  rayou/sops:latest \
  "$@"

rm -f "$TMP_KEY"
