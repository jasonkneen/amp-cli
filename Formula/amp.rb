# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756785955/amp-darwin-arm64.zip'
  sha256 'f0f1619af86da6b3758420ebb5ad4a92507b8f69c970f3fb57e5130a96f0c8ac'
  version '0.0.1756785955'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756785955/amp-darwin-arm64.zip'
      sha256 'f0f1619af86da6b3758420ebb5ad4a92507b8f69c970f3fb57e5130a96f0c8ac'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756785955/amp-darwin-x64.zip'
      sha256 '933de5134382e32d6ea62ab0c5f93516f677df59c3a972ddf907239f2d2eb716'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756785955/amp-linux-arm64'
      sha256 '32ef608c8162ebd559a8287116395e4efa029b403cf7ff3a5b43c9738dc26627'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756785955/amp-linux-x64'
      sha256 '98106583b530ab9512c4504927876492be8ea884b6bfa78ef4bdea551c62d3b0'
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
