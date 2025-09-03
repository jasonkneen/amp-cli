# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756872330/amp-darwin-arm64.zip'
  sha256 'a137c1ba10b288a4906d53e7547653824b5e2590e0bb3edc6277fb7f66762684'
  version '0.0.1756872330'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756872330/amp-darwin-arm64.zip'
      sha256 'a137c1ba10b288a4906d53e7547653824b5e2590e0bb3edc6277fb7f66762684'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756872330/amp-darwin-x64.zip'
      sha256 'd85a19f6bee75d5d719f5defc3acd08b50ec0268886eb20b4ff86cfcc6938178'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756872330/amp-linux-arm64'
      sha256 'fb4fefd4b91ad219e47103112e3b6e4b5451c3cf0db5c003c56538016a93a8f1'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756872330/amp-linux-x64'
      sha256 'babbcde75813625bdf6545618e47d4c7653b08aa666f54be293bacea819045fb'
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
