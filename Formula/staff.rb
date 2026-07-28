class Staff < Formula
  desc "Staff Review \u2014 a local code review tool with AI-coding-agent skills"
  homepage "https://github.com/staffreview/staffreview"
  version "1.10.1"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-darwin-arm64"
      sha256 "19d617dd61fe8f5dbf7c53e7a9ef2b4b377f2d69b4296220116d80a89d8b309b"
    else
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-darwin-x64"
      sha256 "4556dfb62c07caf942ac76751e94f4024076249ebafeea30ccacf299718c4f61"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-linux-arm64"
      sha256 "69d369d772625ccca15a81c64c62f9ceef2994be8e04054d5fef6aca9b2a9502"
    else
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-linux-x64"
      sha256 "517bbaaf381fbfdb7d7866d8fed839dc023eb06e669e2a603323972ce7368d2b"
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
