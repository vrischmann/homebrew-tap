class Tasks < Formula
  desc "Stateless CLI tool for managing markdown task lists with Unix-friendly commands"
  homepage "https://github.com/vrischmann/tasks"
  version "2.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/tasks/releases/download/v2.4.1/tasks_2.4.1_darwin_amd64.tar.gz"
      sha256 "c3adbd48bc57812b857a5d0999f2a35575dc80a8a0daaf9a50b8ca09dd1e5b31"
    else
      url "https://github.com/vrischmann/tasks/releases/download/v2.4.1/tasks_2.4.1_darwin_arm64.tar.gz"
      sha256 "ee408e149ee0eeb1607d8fbe3d01c9af122afc0f902b53e9fb8db10fea98e639"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/tasks/releases/download/v2.4.1/tasks_2.4.1_linux_amd64.tar.gz"
      sha256 "2f307c95ab7a1984ee250d3c660ba365b69b4d3f953a96d9c560828066f4f9d9"
    elsif Hardware::CPU.arm?
      url "https://github.com/vrischmann/tasks/releases/download/v2.4.1/tasks_2.4.1_linux_arm64.tar.gz"
      sha256 "717a13ea70abdc358f5ec89754ec0a7845b4e72fe51d6f9e7386a7fe4acd8c8c"
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
