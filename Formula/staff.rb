class Staff < Formula
  desc "Local code review tool with AI-coding-agent skills"
  homepage "https://github.com/staffreview/staffreview"
  version "1.2.0"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-darwin-arm64"
      sha256 "e1ae2251101701c065a419c9aff4d9c927601dbaa365e9318d67ce3409d24f8e"
    else
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-darwin-x64"
      sha256 "164f97f5cd0103d9e57bc7c4887059d9590a595d2af9497dd5583bc248d3e67d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-linux-arm64"
      sha256 "db610ca3de76ee4349c14708095e32bd9552dd8b2cccd3cd0f618e448ac1d1aa"
    else
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-linux-x64"
      sha256 "2f3aab97d843dd8e68d2b302ce28000412c1c591a0549a337c074bd2df23054e"
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
