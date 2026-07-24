class Staff < Formula
  desc "Staff Review \u2014 a local code review tool with AI-coding-agent skills"
  homepage "https://github.com/staffreview/staffreview"
  version "1.8.0"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-darwin-arm64"
      sha256 "ba8e964263a8d3f889255cb8a99aae69c3cd593e2a209971ae66c98425809d06"
    else
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-darwin-x64"
      sha256 "c348e256370c36b9d419352b5c94ac5dd156c03669503312fc79683db7c435bf"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-linux-arm64"
      sha256 "360494fd2510e6ef94894e0fa3bd7bf7435e4c1bf0adf009f9fe6f766eddc318"
    else
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-linux-x64"
      sha256 "cac8ad73442da46fa70b168535554d034b094ccd4b01800e2eb9c2bb42aa9db4"
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
