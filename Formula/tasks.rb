class Tasks < Formula
  desc "Stateless CLI tool for managing markdown task lists with Unix-friendly commands"
  homepage "https://github.com/vrischmann/tasks"
  version "2.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/tasks/releases/download/v2.4.2/tasks_2.4.2_darwin_amd64.tar.gz"
      sha256 "5fa250b1f184bd08c4180521fcc96b58771f64fdeff2d896f9fa8dc95472f648"
    else
      url "https://github.com/vrischmann/tasks/releases/download/v2.4.2/tasks_2.4.2_darwin_arm64.tar.gz"
      sha256 "0f62f6bd67ee6d0f2dcd0aa21509c103fc3ecca732cbcaa2a654865ac0961d6e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/tasks/releases/download/v2.4.2/tasks_2.4.2_linux_amd64.tar.gz"
      sha256 "c8b8bb459fec5aa255c664fd96849a019e858a61f907ac802ca329f8111e48d0"
    elsif Hardware::CPU.arm?
      url "https://github.com/vrischmann/tasks/releases/download/v2.4.2/tasks_2.4.2_linux_arm64.tar.gz"
      sha256 "949f42df56e806977dca579083d0464db1d55ee2f68696a67f3ecb59f3689e96"
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
