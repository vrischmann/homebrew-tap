class Tasks < Formula
  desc "Stateless CLI tool for managing markdown task lists with Unix-friendly commands"
  homepage "https://github.com/vrischmann/tasks"
  version "2.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/tasks/releases/download/v2.5.0/tasks_2.5.0_darwin_amd64.tar.gz"
      sha256 "c256cfe3c37b6e5f2015bf00efe7eb86a200819ce1f006552c92f8c8e0c3a776"
    else
      url "https://github.com/vrischmann/tasks/releases/download/v2.5.0/tasks_2.5.0_darwin_arm64.tar.gz"
      sha256 "df5b7d54a7a10cf5ee6d03f109c95eacdc45ee2398784163d40028acadc00f52"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/tasks/releases/download/v2.5.0/tasks_2.5.0_linux_amd64.tar.gz"
      sha256 "8f720f9c22b5562d5cdb2fa3911a5f31335584ccce38f963d86a66223d00aaba"
    elsif Hardware::CPU.arm?
      url "https://github.com/vrischmann/tasks/releases/download/v2.5.0/tasks_2.5.0_linux_arm64.tar.gz"
      sha256 "94f072d2307dab4317c4b4135c8627366898dfaae8816ada5cf8bb61c20f899c"
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
