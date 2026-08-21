class Staff < Formula
  desc "Staff Review \u2014 a local code review tool with AI-coding-agent skills"
  homepage "https://github.com/staffreview/staffreview"
  version "1.10.4"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-darwin-arm64"
      sha256 "1d241ad6cab7ad4f94f3908fb2378f36b12c92141735befa48f7f2806de31ccc"
    else
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-darwin-x64"
      sha256 "b179f113fa813f7c7ab59f3ac871a8441a7531830f24fa2bf007307b13ae9f3f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-linux-arm64"
      sha256 "12a927f5297cc8d32c29a5d68a7d7f9491d08e070db2a1da2362ca2acd315cdb"
    else
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-linux-x64"
      sha256 "2c22bb35b1d90cfb61abbfa8060f85de38ba4e4b010a079341ef36a361a0eb23"
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
