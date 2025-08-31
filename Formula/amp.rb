# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756599602/amp-darwin-arm64.zip'
  sha256 '39bba8a9d4203569cd808c2d5965534154dd34862912dca31b84cd84a035a23e'
  version '0.0.1756599602'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756599602/amp-darwin-arm64.zip'
      sha256 '39bba8a9d4203569cd808c2d5965534154dd34862912dca31b84cd84a035a23e'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756599602/amp-darwin-x64.zip'
      sha256 '64565cae512f423c16da5afab295348701158dc0d3ef5f13f7c19d2dd1255777'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756599602/amp-linux-arm64'
      sha256 '5933d417ff41f9cb5496571112dd68d7a0e9b2e8b9ba8811b314a54370c452b0'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756599602/amp-linux-x64'
      sha256 'feafd1462c9780aa7342a872f8a380b265a53944b14e5473762a5e8030f5ba69'
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
