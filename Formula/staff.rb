class Staff < Formula
  desc "Staff Review — a local code review tool with AI-coding-agent skills"
  homepage "https://github.com/staffreview/staffreview"
  version "1.4.0"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-darwin-arm64"
      sha256 "5e853fad364a52e345bdc113d379e1fddb45b1759dee03a13a0aaabf6721dcce"
    else
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-darwin-x64"
      sha256 "a4a4d10e5ac57a4f228a9892d60a290aa55de387cf8a5c555734e84ac388ce1c"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-linux-arm64"
      sha256 "dde5fc397d53f514584a8861dbd5f6791f71e8201fec956b0724cfaa62f1df39"
    else
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-linux-x64"
      sha256 "61d00236411fe312a2a8cd3004dc7a3f4e94f57def7e1777c9533fbbdf35c0dd"
    end
  end

  def install
    binary_name = "staff-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "x64"}"
    bin.install binary_name => "staff"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/staff --version")
  end
end
