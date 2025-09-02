# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756829148/amp-darwin-arm64.zip'
  sha256 '6466ac2f479c93a0899ce19e58af76eb189eeff6ff58d8e6f9d646e1eccb6cea'
  version '0.0.1756829148'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756829148/amp-darwin-arm64.zip'
      sha256 '6466ac2f479c93a0899ce19e58af76eb189eeff6ff58d8e6f9d646e1eccb6cea'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756829148/amp-darwin-x64.zip'
      sha256 '24c4c95773e007e05b15aeb0a545826716946e405ed21e6706cb3766e41f8b8f'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756829148/amp-linux-arm64'
      sha256 '1e8d94767527e906c88a8b332194fd8c2c41fdde20b6d82a7533adc0630395c6'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756829148/amp-linux-x64'
      sha256 'dc2281da7048c56cecbe5a7a30cda14f45cc043f72beaa61b8cc946b0a2277f0'
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
