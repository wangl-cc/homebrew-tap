class MaaCli < Formula
  desc "Command-line tool for MAA (MaaAssistantArknights)"
  homepage "https://github.com/MaaAssistantArknights/maa-cli/"
  url "https://github.com/MaaAssistantArknights/maa-cli/archive/refs/tags/v0.3.12.tar.gz"
  sha256 "f6742323dcf201bb0c05e542cc6dc674ba08c8dba292d7b39c956490b1b3bbc2"
  license "AGPL-3.0-or-later"

  bottle do
    root_url "https://github.com/MaaAssistantArknights/homebrew-tap/releases/download/maa-cli-0.3.12"
    sha256 cellar: :any_skip_relocation, ventura:      "433247106607a1ee1381f4253794af61fed6ed7026805ade6e283ee89b8f1efe"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3ad777bb1191adfe5f83663f1bbbd02e210bdc018981e8f01e381253494d6401"
  end

  depends_on "rust" => :build

  def install
    ENV["CARGO_PROFILE_RELEASE_CODEGEN_UNITS"] = "1"
    ENV["CARGO_PROFILE_RELEASE_LTO"] = "true"
    ENV["CARGO_PROFILE_RELEASE_STRIP"] = "true"
    system "cargo", "install", "--no-default-features", *std_cargo_args(path: "maa-cli")
    fish_completion.install "maa-cli/share/fish/vendor_completions.d/maa.fish"
  end

  test do
    assert_match "maa #{version}", shell_output("#{bin}/maa --version")
  end
end
