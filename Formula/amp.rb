# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756728460/amp-darwin-arm64.zip'
  sha256 '98ef9588ab422f91b47d631affacb3d907377709346f22f8aa80e43d9eb4ba7b'
  version '0.0.1756728460'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756728460/amp-darwin-arm64.zip'
      sha256 '98ef9588ab422f91b47d631affacb3d907377709346f22f8aa80e43d9eb4ba7b'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756728460/amp-darwin-x64.zip'
      sha256 'b0a7c5d25a69428205362ca5182bff3f2ad94bece385e79ed2127ec71cd4e5f2'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756728460/amp-linux-arm64'
      sha256 '61bca4337cb122c27f79da02f2a3b1413651473d91c7f6b0dc35acd492f3352d'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756728460/amp-linux-x64'
      sha256 'af9677dd0bd6f4c8196a046c4226268ba187521a8638da4398398edd810383c0'
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
