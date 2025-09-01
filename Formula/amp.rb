# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756686127/amp-darwin-arm64.zip'
  sha256 '2fa662a216205789c5e74b30409bfc5e23eadfa52c2748a94cbae8137d116dd7'
  version '0.0.1756686127'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756686127/amp-darwin-arm64.zip'
      sha256 '2fa662a216205789c5e74b30409bfc5e23eadfa52c2748a94cbae8137d116dd7'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756686127/amp-darwin-x64.zip'
      sha256 '4fe7ede92f79b14100fa819c3c69460d1467afa3b2730be025f8f6570298628c'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756686127/amp-linux-arm64'
      sha256 '2750867e4d827b6e0e83c73fc838fe23a5e0e7d49c1e79d6e67ed47e8a63f4e9'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756686127/amp-linux-x64'
      sha256 '9889701e314407785dd75dc07bbca5b2c57c1cd723df15381292b7af661781e3'
    end
  end

  depends_on 'ripgrep'

  def install
    # Determine binary based on platform and architecture
    platform = OS.mac? ? 'darwin' : 'linux'
    arch = Hardware::CPU.arm? ? 'arm64' : 'x64'
    binary_name = "amp-#{platform}-#{arch}"

    bin.install binary_name => 'amp'
  end

  test do
    system "#{bin}/amp", '--version'
  end
end
