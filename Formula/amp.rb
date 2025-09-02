# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756772294/amp-darwin-arm64.zip'
  sha256 '49bfeccf749888bdea783c5b4475f39da9c8a742e34158ab9540ac1d0317c2d8'
  version '0.0.1756772294'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756772294/amp-darwin-arm64.zip'
      sha256 '49bfeccf749888bdea783c5b4475f39da9c8a742e34158ab9540ac1d0317c2d8'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756772294/amp-darwin-x64.zip'
      sha256 'b0709ed355a94d0e45d6ce8b8c11699769520e8c61060fc11d0708bf491cf9aa'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756772294/amp-linux-arm64'
      sha256 '6eabb5c57d49b5d298ffbe640ed3351c5ffe9342cc5d2fcebc93aaa6bb40d08f'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756772294/amp-linux-x64'
      sha256 '0cbf3aab35029e663bba71181d5013f713db3f2569dc95d66f99a349242c04fe'
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
