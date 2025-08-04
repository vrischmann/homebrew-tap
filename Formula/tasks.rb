class Tasks < Formula
  desc "Stateless CLI tool for managing markdown task lists with Unix-friendly commands"
  homepage "https://github.com/vrischmann/tasks"
  version "2.2.4"
  license "MIT"

  if Hardware::CPU.intel?
    url "https://github.com/vrischmann/tasks/releases/download/v2.2.4/tasks_2.2.4_darwin_amd64.tar.gz"
    sha256 "8b86aab750a0dd2426cf151c33a0aa7a5e713d94cd9e4b61a1f3c5764ffa942b"
  else
    url "https://github.com/vrischmann/tasks/releases/download/v2.2.4/tasks_2.2.4_darwin_arm64.tar.gz"
    sha256 "008249b98eb63f587389e367c274f66559cd19304a2399ddd8881d4da7663a6b"
  end

  def install
    bin.install "tasks"

    fish_function.install Dir["fish/functions/*.fish"]
  end

  test do
    assert_match "tasks version #{version}", shell_output("#{bin}/tasks --version")
  end
end
