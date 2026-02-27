class LlmContext < Formula
  desc "CLI tool for gathering file contents into formatted messages for LLM conversations"
  homepage "https://github.com/vrischmann/llm-context"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/llm-context/releases/download/v0.1.0/llm-context_0.1.0_darwin_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/vrischmann/llm-context/releases/download/v0.1.0/llm-context_0.1.0_darwin_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/llm-context/releases/download/v0.1.0/llm-context_0.1.0_linux_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    elsif Hardware::CPU.arm?
      url "https://github.com/vrischmann/llm-context/releases/download/v0.1.0/llm-context_0.1.0_linux_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "llm-context"
  end

  test do
    assert_match "llm-context version #{version}", shell_output("#{bin}/llm-context --version")
  end
end
