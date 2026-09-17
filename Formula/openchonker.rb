class Openchonker < Formula
  desc "Open-source companion for ChonkerKeys macropads"
  homepage "https://github.com/pepito2k/OpenChonker"
  url "https://github.com/pepito2k/OpenChonker/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5a87fed092a73044305c7ac6f42d3bb77fd74055d9d3c2271adde2825858fe77"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/pepito2k/OpenChonker.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/chonker-cli")
    system "cargo", "install", *std_cargo_args(path: "crates/chonker-gui")

    ENV["OPENCHONKER_BIN"] = (bin/"openchonker").to_s
    ENV["OPENCHONKER_APP_DEST"] = (prefix/"OpenChonker.app").to_s
    ENV["OPENCHONKER_VERSION"] = version.to_s
    system "./scripts/bundle-macos.sh"
    rm bin/"openchonker"
  end

  def caveats
    <<~EOS
      The menu bar companion is at:
        #{opt_prefix}/OpenChonker.app

      Open it with:
        open #{opt_prefix}/OpenChonker.app

      Then enable OpenChonker in System Settings → Privacy & Security
      under Accessibility and Device Control.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chonker --version")
    assert_path_exists prefix/"OpenChonker.app/Contents/MacOS/OpenChonker"
  end
end
