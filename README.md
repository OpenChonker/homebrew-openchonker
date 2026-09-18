# OpenChonker tap

Homebrew tap for [OpenChonker](https://github.com/OpenChonker/OpenChonker).

```bash
brew tap OpenChonker/openchonker
brew install --cask openchonker
```

Installs a notarized `/Applications/OpenChonker.app` and the `chonker` CLI
(Apple Silicon). Grant Accessibility (and Device Control) to **OpenChonker**.
After `brew upgrade --cask openchonker`, reopen `/Applications/OpenChonker.app`
so macOS keeps bundle id `dev.openchonker.app`.

Until a GitHub Release contains `OpenChonker-macos.zip`, the cask 404s. Build
locally from the main repo with `./scripts/bundle-macos.sh`.

## Formula

`brew install openchonker` still builds the CLI (and an ad-hoc `.app`) from
source. Prefer the cask on Apple Silicon after a notarized `v*` release.
