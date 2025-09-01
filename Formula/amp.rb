# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756742731/amp-darwin-arm64.zip'
  sha256 'dad0181c3899d106a0cad611041745f175b0ee1a5f4a77c08babb7b8e8516275'
  version '0.0.1756742731'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756742731/amp-darwin-arm64.zip'
      sha256 'dad0181c3899d106a0cad611041745f175b0ee1a5f4a77c08babb7b8e8516275'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756742731/amp-darwin-x64.zip'
      sha256 '40754130d2ed8fbfde1e464be4eec0ffc7df0f7f20ca13638926ffa366783d83'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756742731/amp-linux-arm64'
      sha256 'b05dadc59c50e6e060ab16a7119d714456f0d124fd9463372ad61723f24e64b6'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756742731/amp-linux-x64'
      sha256 '1eee3f7d24b416b0dc0777e34b8afa8cf3220dd791e71b0ec1a57bf3e4cba66b'
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
