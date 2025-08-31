# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756642042/amp-darwin-arm64.zip'
  sha256 '3afaaf24f37a4b3d8f381013cdd921d22d67efd3492b8cb93c508da28afccc0a'
  version '0.0.1756642042'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756642042/amp-darwin-arm64.zip'
      sha256 '3afaaf24f37a4b3d8f381013cdd921d22d67efd3492b8cb93c508da28afccc0a'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756642042/amp-darwin-x64.zip'
      sha256 'e34304fa36a89e79db4cff708efd6166b61f64cce711cb69d9c23b978d23a956'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756642042/amp-linux-arm64'
      sha256 'c5174bce34702f299d35456fc879b5149ccc8cdcaf74e6e214c7fb1fdf2eb4d8'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756642042/amp-linux-x64'
      sha256 '6b36fc7bcaa9be657fce2e145c5da283a52ff0a8213c3cad0913fa4915f52b64'
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
