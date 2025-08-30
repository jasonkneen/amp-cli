# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756584294/amp-darwin-arm64.zip'
  sha256 'f1d41698d3995ae4e948f71fb579cf1dbdda7e6e5d09c2443f494723b1813d85'
  version '0.0.1756584294'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756584294/amp-darwin-arm64.zip'
      sha256 'f1d41698d3995ae4e948f71fb579cf1dbdda7e6e5d09c2443f494723b1813d85'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756584294/amp-darwin-x64.zip'
      sha256 '5a9c015839a0a005e734a60fd317bc94b3ab781b612bfd6014362a97d05b9a45'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756584294/amp-linux-arm64'
      sha256 '51760495a234e3c04bcb368425090629d7c9c0e048c53d403f7d6ae410f6ae34'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756584294/amp-linux-x64'
      sha256 '57b4018a2b41bce5c1e258afa28c09abb387f34a4d2e46215bff461de7421bed'
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
