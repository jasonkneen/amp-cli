# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756627569/amp-darwin-arm64.zip'
  sha256 'd87688e4247405346042885e962977a6a351e43f547ae3a13ffcbe023d7c3c4d'
  version '0.0.1756627569'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756627569/amp-darwin-arm64.zip'
      sha256 'd87688e4247405346042885e962977a6a351e43f547ae3a13ffcbe023d7c3c4d'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756627569/amp-darwin-x64.zip'
      sha256 '49e616ab325b82cf3c439d0518bf5e35c93ea09822f37f2bba851a20c64845ec'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756627569/amp-linux-arm64'
      sha256 'bb946c7417119e01bfba009ce7fe8d2c0de25d35a1d0df24eade8ecdc426aa47'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756627569/amp-linux-x64'
      sha256 '3fdd234a464e08464aa2d4a01ce96232095bb1526faea924c408131537595ca9'
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
