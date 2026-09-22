cask "openchonker" do
  version "0.1.1"
  sha256 "854bca742c1f6a7f6f9947c52e630146fa682ae3c336586d970b3004b3cc3078"

  url "https://github.com/OpenChonker/OpenChonker/releases/download/v#{version}/OpenChonker-macos.zip"
  name "OpenChonker"
  desc "Open-source companion for ChonkerKeys macropads"
  homepage "https://github.com/OpenChonker/OpenChonker"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "OpenChonker.app"
  binary "chonker"

  caveats <<~EOS
    Grant Accessibility (and Device Control) to OpenChonker in System Settings.
    After `brew upgrade --cask openchonker`, reopen /Applications/OpenChonker.app
    so macOS keeps bundle id dev.openchonker.app.

    Quit `chonker host` and the official ChonkerKeys app first — one process
    can own the USB CDC port.

    The notarized zip is Apple Silicon. On Intel, build locally with
    ./scripts/bundle-macos.sh or `brew install openchonker` (from-source formula).
  EOS
end
