class Tasks < Formula
  desc "Stateless CLI tool for managing markdown task lists with Unix-friendly commands"
  homepage "https://github.com/vrischmann/tasks"
  version "2.3.2"
  license "MIT"

  if Hardware::CPU.intel?
    url "https://github.com/vrischmann/tasks/releases/download/v2.3.2/tasks_2.3.2_darwin_amd64.tar.gz"
    sha256 "af0456779d0492359e35761888c58deaaa78716ac0110ac0593da0820026d2b9"
  else
    url "https://github.com/vrischmann/tasks/releases/download/v2.3.2/tasks_2.3.2_darwin_arm64.tar.gz"
    sha256 "019e1e4b6072c1182945fc7ade688eadec226ff95e8b9bcf73c5c4fb2bad4212"
  end

  def install
    bin.install "tasks"

    fish_function.install Dir["fish/functions/*.fish"]
  end

  test do
    assert_match "tasks version #{version}", shell_output("#{bin}/tasks --version")
  end
end
