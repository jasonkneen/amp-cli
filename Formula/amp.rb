# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756670688/amp-darwin-arm64.zip'
  sha256 'c8210af2f04f5bfae9151c401eed369a6aeac926c8ba7c7fa92354b617410550'
  version '0.0.1756670688'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756670688/amp-darwin-arm64.zip'
      sha256 'c8210af2f04f5bfae9151c401eed369a6aeac926c8ba7c7fa92354b617410550'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756670688/amp-darwin-x64.zip'
      sha256 '9783fcbe89f4a9c9dd881aeb0c7fd346826819d1ded615e3195c4d3a5830bc6b'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756670688/amp-linux-arm64'
      sha256 '279021ae4632f64db36fe3195b8f885dbce5b8354368b93caac8f32888c5b11b'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756670688/amp-linux-x64'
      sha256 '6673eb53363e9f396209c2a36f71bdceb4348dbb173f1ffd7f41b05c0a54485e'
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
