# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756858620/amp-darwin-arm64.zip'
  sha256 'fcda3d0028516e6fef624301a35496b37b92ae11866853f4ec0a13975ad56c0b'
  version '0.0.1756858620'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756858620/amp-darwin-arm64.zip'
      sha256 'fcda3d0028516e6fef624301a35496b37b92ae11866853f4ec0a13975ad56c0b'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756858620/amp-darwin-x64.zip'
      sha256 'cfbefe0aea511651d45344353b2030e75b577ecba5a4acda538a55a0cb57dc72'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756858620/amp-linux-arm64'
      sha256 '2ae085b4fb54585333c3529af7ca7646603aba1bd228afe257413c9c49474ed1'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756858620/amp-linux-x64'
      sha256 '03083de1cf5f2a1879aff42c2f6ddd7989209caaef87f790db1a5ed3d07f9f26'
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
