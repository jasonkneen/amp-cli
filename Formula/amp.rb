# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756800395/amp-darwin-arm64.zip'
  sha256 '1a0b8823ed4e74dd592629608664924a03b99cf1316e996c321723695c88da95'
  version '0.0.1756800395'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756800395/amp-darwin-arm64.zip'
      sha256 '1a0b8823ed4e74dd592629608664924a03b99cf1316e996c321723695c88da95'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756800395/amp-darwin-x64.zip'
      sha256 '9d2f6d2e97c6f513aa59dfb3c7bf808c2b07cdf09f83cfd0d67df5892e08fa88'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756800395/amp-linux-arm64'
      sha256 '947f8c91bb42dbcf12215a96612747c49d4b96ffaab7d794290e37e933b5d7bb'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756800395/amp-linux-x64'
      sha256 '87a73f94293afc3998ad00e051e79f2ca31e68ab1da361de497fa8be2595d820'
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
