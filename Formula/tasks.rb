class Tasks < Formula
  desc "Stateless CLI tool for managing markdown task lists with Unix-friendly commands"
  homepage "https://github.com/vrischmann/tasks"
  version "2.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/tasks/releases/download/v2.3.5/tasks_2.3.5_darwin_amd64.tar.gz"
      sha256 "d57db13c3137a3597cfd6fc01afd8f1b09db323cab92f3b97be66405cbbbf05c"
    else
      url "https://github.com/vrischmann/tasks/releases/download/v2.3.5/tasks_2.3.5_darwin_arm64.tar.gz"
      sha256 "14c428fc05abdf7a3160d740d1939a14cdf69c12eae9ba2f3884baaa8344a5bb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/tasks/releases/download/v2.3.5/tasks_2.3.5_linux_amd64.tar.gz"
      sha256 "9cd215efd0410d3a2fc4a671bfd0a76c9e28d49c8ee6e59b2c4b7ebbc74ace0a"
    elsif Hardware::CPU.arm?
      url "https://github.com/vrischmann/tasks/releases/download/v2.3.5/tasks_2.3.5_linux_arm64.tar.gz"
      sha256 "733221ace91bf3934f884faa89b341b1dafa3b5caaeb20d0f3d0c75fe5d73d3f"
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
