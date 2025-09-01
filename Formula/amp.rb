# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756757098/amp-darwin-arm64.zip'
  sha256 '0b145cf0ce3188aa4b46cb45e332a986ebe02f484a9cf229d8b465973b985055'
  version '0.0.1756757098'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756757098/amp-darwin-arm64.zip'
      sha256 '0b145cf0ce3188aa4b46cb45e332a986ebe02f484a9cf229d8b465973b985055'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756757098/amp-darwin-x64.zip'
      sha256 '941aa46d4dbe74222124ee31c677359314ef926c30b08633004d5960065c8254'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756757098/amp-linux-arm64'
      sha256 '7fd6a34d9edcdbd4ee92010a42d4adbaf478e2af99bbd7f5aa67ed233f4a566f'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756757098/amp-linux-x64'
      sha256 'f37369ef4d4cc04d9726221116742a3099a896ab7c269f6ccbba465ffc7d18b8'
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
