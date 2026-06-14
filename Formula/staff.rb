class Staff < Formula
  desc "Staff Review \u2014 a local code review tool with AI-coding-agent skills"
  homepage "https://github.com/staffreview/staffreview"
  version "1.5.0"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-darwin-arm64"
      sha256 "f32b3d21140c6b4a37546fd66f226f8feebdf424a3cb9cfb36fa223ef8dee1f5"
    else
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-darwin-x64"
      sha256 "1fa9d90f65e3b434e89f9a648b06ba5fa134909a436643a0d4ab6d29502ee3dc"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-linux-arm64"
      sha256 "1a5a720dc0d5d6de4e838272cd63d1f2d4d8a704519dedb090e2790009dcb9d6"
    else
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-linux-x64"
      sha256 "44f4598e93a66572fc08f4e32581d74fff3dd0740c7c63c851bbc172e7921d13"
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
