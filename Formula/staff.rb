class Staff < Formula
  desc "Staff Review — a local code review tool with AI-coding-agent skills"
  homepage "https://github.com/staffreview/staffreview"
  version "1.1.0"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-darwin-arm64"
      sha256 "d2a6f6f75ac28ef319949b5d2f0aee3aae3f269c3809a894d33da6fff1fbee7c"
    else
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-darwin-x64"
      sha256 "42698859c0623db830b888f8a76b0657ea25cf703e7750393f51d4694cfa7e54"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-linux-arm64"
      sha256 "51da4118cd86b26084a5a54d0f66d7912e6bb1c01468d2b972b555ce054de810"
    else
      url "https://github.com/staffreview/staffreview/releases/download/v#{version}/staff-linux-x64"
      sha256 "719fdb4dfd0ec6c5b9dc6a8d6ee0a14b3a4d18a8f7478dcda66e9962b1910a6c"
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
