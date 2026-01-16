#!/usr/bin/env bash

KEY_FILE="/config/komodo-syncs"

docker run --rm \
  -v "$(pwd):/work" \
  -e SOPS_AGE_KEY="$(cat $KEY_FILE)" \
  -w /work \
  ghcr.io/getsops/sops:v3.11.0-alpine \
  "$@"
