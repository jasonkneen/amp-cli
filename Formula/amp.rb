# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756699858/amp-darwin-arm64.zip'
  sha256 'd8a1c272527f281e161b6fd438fa9b28c8a854ca3677f95f7e5ad4f5bd413c39'
  version '0.0.1756699858'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756699858/amp-darwin-arm64.zip'
      sha256 'd8a1c272527f281e161b6fd438fa9b28c8a854ca3677f95f7e5ad4f5bd413c39'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756699858/amp-darwin-x64.zip'
      sha256 'd5a839ae5ad8d06a6c5de32e7754ac33ab17ce3ca9ad9c4b727f0349d6f9ca30'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756699858/amp-linux-arm64'
      sha256 '7558e6cb807dc3765df7dfc814618a8f3b94265a9c2a4062e11d3c58d1d2fdfa'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756699858/amp-linux-x64'
      sha256 '7475fab846fc771a1e9c5fbf7a211f79e6fad001f274ec3d4d8a391a92175cb6'
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
