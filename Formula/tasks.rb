class Tasks < Formula
  desc "Stateless CLI tool for managing markdown task lists with Unix-friendly commands"
  homepage "https://github.com/vrischmann/tasks"
  version "2.2.5"
  license "MIT"

  if Hardware::CPU.intel?
    url "https://github.com/vrischmann/tasks/releases/download/v2.2.5/tasks_2.2.5_darwin_amd64.tar.gz"
    sha256 "be526057604b93ef0cae181cd5651831ad3ed7098cc30316d16f6f32a2d04d9d"
  else
    url "https://github.com/vrischmann/tasks/releases/download/v2.2.5/tasks_2.2.5_darwin_arm64.tar.gz"
    sha256 "84f8e1126d0b0909ff235f833032413d63cd9f19b190ef9f8e9b0fc201ba301b"
  end

  def install
    bin.install "tasks"

    fish_function.install Dir["fish/functions/*.fish"]
  end

  test do
    assert_match "tasks version #{version}", shell_output("#{bin}/tasks --version")
  end
end
