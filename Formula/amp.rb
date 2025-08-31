# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756656283/amp-darwin-arm64.zip'
  sha256 'b2952cedc289f991759c2c2a0c2133b634408a7eca01b067e1d188c1c0b4bf5c'
  version '0.0.1756656283'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756656283/amp-darwin-arm64.zip'
      sha256 'b2952cedc289f991759c2c2a0c2133b634408a7eca01b067e1d188c1c0b4bf5c'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756656283/amp-darwin-x64.zip'
      sha256 '7f069155bd577f2c47acf3f57d89c14d7783071c2034a241a438cbabb371170c'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756656283/amp-linux-arm64'
      sha256 'd9fbf340175894955aadc2f3cdb6776811b1b2174f9b370054e21cd4590d5b6d'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756656283/amp-linux-x64'
      sha256 '54c82d965e60d20f9ea1bff57207dceb042eea3f8f3398e3d72525617deae23b'
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
