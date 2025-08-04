class Tasks < Formula
  desc "Stateless CLI tool for managing markdown task lists with Unix-friendly commands"
  homepage "https://github.com/vrischmann/tasks"
  version "2.3.3"
  license "MIT"

  if Hardware::CPU.intel?
    url "https://github.com/vrischmann/tasks/releases/download/v2.3.3/tasks_2.3.3_darwin_amd64.tar.gz"
    sha256 "4bd2688fc1f1347284d35ce442304a476b128086f15dddd83281bf5b0e00a8f7"
  else
    url "https://github.com/vrischmann/tasks/releases/download/v2.3.3/tasks_2.3.3_darwin_arm64.tar.gz"
    sha256 "f97b12ae5c75ce215a1e8c92bb21e8f3720487c393fdcf7690d8ede5b83c8cba"
  end

  def install
    bin.install "tasks"

    fish_function.install Dir["fish/functions/*.fish"]
  end

  test do
    assert_match "tasks version #{version}", shell_output("#{bin}/tasks --version")
  end
end
