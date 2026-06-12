class LlmContext < Formula
  desc "Gather file contents into formatted messages for LLM conversations"
  homepage "https://github.com/vrischmann/llm-context"
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/llm-context/releases/download/v0.1.0/llm-context_0.1.0_darwin_amd64.tar.gz"
    else
      url "https://github.com/vrischmann/llm-context/releases/download/v0.1.0/llm-context_0.1.0_darwin_arm64.tar.gz"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/llm-context/releases/download/v0.1.0/llm-context_0.1.0_linux_amd64.tar.gz"
    elsif Hardware::CPU.arm?
      url "https://github.com/vrischmann/llm-context/releases/download/v0.1.0/llm-context_0.1.0_linux_arm64.tar.gz"
    end
  end

  def install
    bin.install "llm-context"
  end

  test do
    assert_match "llm-context version #{version}", shell_output("#{bin}/llm-context --version")
  end
end
