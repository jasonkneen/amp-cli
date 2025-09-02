# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756814881/amp-darwin-arm64.zip'
  sha256 '56b40d28c745249505bf8b8ee5b6ca80f102195e3dab49be4fdd2fd618ef37e4'
  version '0.0.1756814881'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756814881/amp-darwin-arm64.zip'
      sha256 '56b40d28c745249505bf8b8ee5b6ca80f102195e3dab49be4fdd2fd618ef37e4'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756814881/amp-darwin-x64.zip'
      sha256 'b06cded0534a1f7ec39d85d450a0357af43ed71202f296a94bdbb43245c686c8'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756814881/amp-linux-arm64'
      sha256 'ee644cd48830478064da86dc418703426669411c1e37b63d5a41f6d388059fd0'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756814881/amp-linux-x64'
      sha256 '59d55bde3d3ec06726dad87dc8c913b9e65abdde727da85ac6eebfeb42d9f528'
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
