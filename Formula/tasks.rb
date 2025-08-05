class Tasks < Formula
  desc "Stateless CLI tool for managing markdown task lists with Unix-friendly commands"
  homepage "https://github.com/vrischmann/tasks"
  version "2.3.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/tasks/releases/download/v2.3.7/tasks_2.3.7_darwin_amd64.tar.gz"
      sha256 "c618671d9b5d1979462569f4b68bb81019ff356a7b5753285e2acad204a854cf"
    else
      url "https://github.com/vrischmann/tasks/releases/download/v2.3.7/tasks_2.3.7_darwin_arm64.tar.gz"
      sha256 "3f8ae9b498a807a88ab89615cd9a181c1df8ad0fddc721e96ff7c8d8b5505c92"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/tasks/releases/download/v2.3.7/tasks_2.3.7_linux_amd64.tar.gz"
      sha256 "43777cee21c09ff4c8af56920b66bb7e40d9a20a6e28f95286b327d1ee0b6f48"
    elsif Hardware::CPU.arm?
      url "https://github.com/vrischmann/tasks/releases/download/v2.3.7/tasks_2.3.7_linux_arm64.tar.gz"
      sha256 "59756c80c10ce48fa8be448a3249a278d9d5af8a472954efacc3679373c6d850"
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
