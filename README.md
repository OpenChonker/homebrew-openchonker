# pepito2k/openchonker

Homebrew tap for [OpenChonker](https://github.com/pepito2k/OpenChonker), an
open-source companion for ChonkerKeys macropads.

## Install

```bash
brew install pepito2k/openchonker/openchonker
```

Or:

```bash
brew tap pepito2k/openchonker
brew install openchonker
```

That builds the `chonker` CLI from source and installs `OpenChonker.app` into
the Homebrew prefix. Open the menu bar companion with:

```bash
open "$(brew --prefix)/opt/openchonker/OpenChonker.app"
```

Then grant **Accessibility** (and Device Control) to **OpenChonker** in System
Settings.

## Formulae

- `openchonker` — CLI (`chonker`) plus the macOS menu bar app
