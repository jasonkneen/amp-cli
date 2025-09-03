# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756886778/amp-darwin-arm64.zip'
  sha256 '9b24c92ee90cf2f405976431ee37a0f722b0e43268f7353293ae4262c86ef927'
  version '0.0.1756886778'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756886778/amp-darwin-arm64.zip'
      sha256 '9b24c92ee90cf2f405976431ee37a0f722b0e43268f7353293ae4262c86ef927'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756886778/amp-darwin-x64.zip'
      sha256 'a1bf0a256c753978f98502cbd1732ef76dae7b6abfe5aa2e4d05253c49bf9b73'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756886778/amp-linux-arm64'
      sha256 '3a03c363d9b21566edbd138ca2a60e12459793212a6462cce958f05fe2079ad9'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756886778/amp-linux-x64'
      sha256 'af05460b11accbe620182269933627c068b2c8f23c832051ad2b425da2075799'
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
