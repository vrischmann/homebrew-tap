class Tasks < Formula
  desc "Stateless CLI tool for managing markdown task lists with Unix-friendly commands"
  homepage "https://github.com/vrischmann/tasks"
  version "2.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/tasks/releases/download/v2.5.2/tasks_2.5.2_darwin_amd64.tar.gz"
      sha256 "5c18f4ba53bc8c4b9c336035f5f052ffeea4596584285fa335821568f79d5127"
    else
      url "https://github.com/vrischmann/tasks/releases/download/v2.5.2/tasks_2.5.2_darwin_arm64.tar.gz"
      sha256 "8fe49274c8f0fb8cd7574e6eae3ba5ead04074b5cf108f562f4ebabc38450556"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/tasks/releases/download/v2.5.2/tasks_2.5.2_linux_amd64.tar.gz"
      sha256 "4199fd78dbf742552e4a5c7c963bb3998080fd6a0f19baaeff6d400b56df3288"
    elsif Hardware::CPU.arm?
      url "https://github.com/vrischmann/tasks/releases/download/v2.5.2/tasks_2.5.2_linux_arm64.tar.gz"
      sha256 "bfb0f1c224f281fa1faf30ed32cde609ee264f7c4abd0b3001b6f0120d905288"
    end
  end

  def install
    bin.install "tasks"

    fish_function.install Dir["fish/functions/*.fish"]
    fish_completion.install Dir["fish/completions/*.fish"]
  end

  test do
    assert_match "tasks version #{version}", shell_output("#{bin}/tasks --version")
  end
end
