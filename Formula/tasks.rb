class Tasks < Formula
  desc "Stateless CLI tool for managing markdown task lists with Unix-friendly commands"
  homepage "https://github.com/vrischmann/tasks"
  version "2.3.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/tasks/releases/download/v2.3.6/tasks_2.3.6_darwin_amd64.tar.gz"
      sha256 "1c51c56ac9f6bae244b508067d61581d6226b9cd82535db4a47b2f64b6bacac3"
    else
      url "https://github.com/vrischmann/tasks/releases/download/v2.3.6/tasks_2.3.6_darwin_arm64.tar.gz"
      sha256 "6253f2d2cc5a572cb1dfe815953ab9d898f993eb9f1d882af8b7961c2a2ed092"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/tasks/releases/download/v2.3.6/tasks_2.3.6_linux_amd64.tar.gz"
      sha256 "83450b1aabcdd192ebba9724f3e581d9b4f59b11a4a01845410a9f8c940c375b"
    elsif Hardware::CPU.arm?
      url "https://github.com/vrischmann/tasks/releases/download/v2.3.6/tasks_2.3.6_linux_arm64.tar.gz"
      sha256 "a15ca0c4c0f407c19446f712dcf35f54b28008bcb7c6b3c4134fd8a5c10cc042"
    end
  end

  def install
    bin.install "tasks"

    fish_function.install Dir["fish/functions/*.fish"]
  end

  test do
    assert_match "tasks version #{version}", shell_output("#{bin}/tasks --version")
  end
end
