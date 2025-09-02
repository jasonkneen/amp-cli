# frozen_string_literal: true

# Amp CLI - An agentic coding tool, in research preview from Sourcegraph
class Amp < Formula
  desc 'Amp CLI - An agentic coding tool, in research preview from Sourcegraph'
  homepage 'https://ampcode.com'
  url 'https://packages.ampcode.com/binaries/cli/v0.0.1756843519/amp-darwin-arm64.zip'
  sha256 '51fe9ea55bf1feca05e70bb074d8daa462f98aba23899e0154d1351bda804c83'
  version '0.0.1756843519'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756843519/amp-darwin-arm64.zip'
      sha256 '51fe9ea55bf1feca05e70bb074d8daa462f98aba23899e0154d1351bda804c83'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756843519/amp-darwin-x64.zip'
      sha256 'b8097ecc1bd319f53c426e086b45cc01bd98829874bd158c2e714fdbdc24d9cb'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756843519/amp-linux-arm64'
      sha256 '0bde95d6eeb9d1162da5ea76ece44f2e5d391bfbf0bacc020fa90d42d0eb5aeb'
    else
      url 'https://packages.ampcode.com/binaries/cli/v0.0.1756843519/amp-linux-x64'
      sha256 '4b6f599e73de5e032793a2fbac0e51e59b949bcde4c0f2ca7c1be64620face4c'
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
