class Tasks < Formula
  desc "Stateless CLI tool for managing markdown task lists with Unix-friendly commands"
  homepage "https://github.com/vrischmann/tasks"
  version "2.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/tasks/releases/download/v2.4.0/tasks_2.4.0_darwin_amd64.tar.gz"
      sha256 "e7aee0595556b3cdfed80389da2f0da050bb2d89b7cb913c677680a6d4a157e1"
    else
      url "https://github.com/vrischmann/tasks/releases/download/v2.4.0/tasks_2.4.0_darwin_arm64.tar.gz"
      sha256 "0a9e04cf14d9077004d4998735e3b9034f99a4f5f32c44a0b9506b98b6c00d2f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/tasks/releases/download/v2.4.0/tasks_2.4.0_linux_amd64.tar.gz"
      sha256 "8f8c4c3baed1881d14f7e84539e4583af67f3afe80cf7793ceb3f973d49be15d"
    elsif Hardware::CPU.arm?
      url "https://github.com/vrischmann/tasks/releases/download/v2.4.0/tasks_2.4.0_linux_arm64.tar.gz"
      sha256 "4912654cca3a8438da3660a2611f2ccf8641cca3ec7b547bba70d70993397bd6"
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
