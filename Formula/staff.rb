class Staff < Formula
  desc "Staff Review — a local code review tool with AI-coding-agent skills"
  homepage "https://github.com/staffreview/staffreview"
  version "1.1.1"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-darwin-arm64"
      sha256 "03d8cf2c6aec2dcc519c31504ec455b4d73a1b70356876cb6cada7c6be4431e7"
    else
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-darwin-x64"
      sha256 "867c17ce23bd5ff015c7ecdbdd8b3ff47caa3cc063565ce58b90a12d8c9dc599"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-linux-arm64"
      sha256 "01310ab8746af64e9e30d471ab40f48c8658274cb49fcaf61ffa2595a6fb5da5"
    else
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-linux-x64"
      sha256 "9a512282a1cb172193cfb426a2748d4c15576f10314f0e61f6816c682acd5fee"
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
