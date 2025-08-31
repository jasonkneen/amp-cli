# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756613132/amp-darwin-arm64.zip'
  sha256 '58cf945780b8a9f36ee7242abe0e21c895ee3e12d463284e9aae6f4926cb62b4'
  version '0.0.1756613132'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756613132/amp-darwin-arm64.zip'
      sha256 '58cf945780b8a9f36ee7242abe0e21c895ee3e12d463284e9aae6f4926cb62b4'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756613132/amp-darwin-x64.zip'
      sha256 'b4a822144619bc42049cad42e6a86e916d4a6d159889afc8f69c56f93af34318'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756613132/amp-linux-arm64'
      sha256 '20ea231cc4666441d1282588b0a74e46468762ef73c1ff0ac14cca07a634c1c1'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756613132/amp-linux-x64'
      sha256 'f81e39f1dc8964a542259cb704579750abd0adc83836493c6547ca2235207cf1'
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
