class Tasks < Formula
  desc "Stateless CLI tool for managing markdown task lists with Unix-friendly commands"
  homepage "https://github.com/vrischmann/tasks"
  version "2.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/tasks/releases/download/v2.5.1/tasks_2.5.1_darwin_amd64.tar.gz"
      sha256 "9995311e5ee6665041d0560c5da9cdb7edd4007dd3f614a540ae6395acff122d"
    else
      url "https://github.com/vrischmann/tasks/releases/download/v2.5.1/tasks_2.5.1_darwin_arm64.tar.gz"
      sha256 "bf73fa4af7d07ea6870192940a3aa202aac0c94874334465319562179adbabc2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/tasks/releases/download/v2.5.1/tasks_2.5.1_linux_amd64.tar.gz"
      sha256 "333d40b37f047253e6a5e905d3bb2e3fdc3db0a27cc44d3ecc63622619ebcd6e"
    elsif Hardware::CPU.arm?
      url "https://github.com/vrischmann/tasks/releases/download/v2.5.1/tasks_2.5.1_linux_arm64.tar.gz"
      sha256 "c7f9acc9b86ef9a7068a5d540295ec696b88661c9d6e633a44cce01e39e703c2"
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
