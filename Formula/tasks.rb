class Tasks < Formula
  desc "Stateless CLI tool for managing markdown task lists with Unix-friendly commands"
  homepage "https://github.com/vrischmann/tasks"
  version "2.3.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/tasks/releases/download/v2.3.8/tasks_2.3.8_darwin_amd64.tar.gz"
      sha256 "f9c2ca2b6670a0f227e5756a1259b8fd59f7b6f86acbd5667bdef04ae4ff623e"
    else
      url "https://github.com/vrischmann/tasks/releases/download/v2.3.8/tasks_2.3.8_darwin_arm64.tar.gz"
      sha256 "c1598e5c8f9d21be3bdc54f8485937e176d444ddda85804f75b06b588c7fbc04"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/tasks/releases/download/v2.3.8/tasks_2.3.8_linux_amd64.tar.gz"
      sha256 "4bed5d583e03d4ee7392e5b3b2fe3e83abafdae61faed343e0e4193cf862e1dd"
    elsif Hardware::CPU.arm?
      url "https://github.com/vrischmann/tasks/releases/download/v2.3.8/tasks_2.3.8_linux_arm64.tar.gz"
      sha256 "3a35eace3f967f208772ddc6211107c461afa8a7e2d73ef25af09068b9b59929"
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
