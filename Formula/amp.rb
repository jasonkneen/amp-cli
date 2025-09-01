# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756713996/amp-darwin-arm64.zip'
  sha256 'ecb1b9f20ad7cb58f8a16a987d28aa793f86928d1d31e4e2d4d5177e72b546f7'
  version '0.0.1756713996'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756713996/amp-darwin-arm64.zip'
      sha256 'ecb1b9f20ad7cb58f8a16a987d28aa793f86928d1d31e4e2d4d5177e72b546f7'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756713996/amp-darwin-x64.zip'
      sha256 'c6a2bde15b0c33424ace3f5bfa17d7099d4295089a18a789f3e4fd1c5491f752'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756713996/amp-linux-arm64'
      sha256 '8c694148f406bee0e00f2618f231e6ae48ca1759eacc008a7d302b2a7b46fe9c'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756713996/amp-linux-x64'
      sha256 '40e8cbac9fef7764c312d5b846160fef1e3ecf8c06dbb401e619885188640932'
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
