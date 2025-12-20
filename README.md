# komodo-syncs

Monorepo containing all syncs I use for [Komodo Docker Control](https://komo.do/).

## How it works

1. All synced resources are given the `syncs` tag and stored in toml files.
2. `main.toml` is the main sync entrypoint
3. Git webhook triggers procedure that updates repo, decrypts secrets, runs syncs, and updates all modified stacks.

## Secrets

All secrets are stored encrypted in the repo using `sops`.

- Use `nix develop` to enter a development shell with `sops` installed and env vars set to point to the master key.
- Encryption is fine-grained, so `local.env` for example can only be decrypted by the `local` server.
- When Komodo pulls the repo it will automatically decrypt all files using `find`.
