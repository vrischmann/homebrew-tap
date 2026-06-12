class AnsiblePasswordAgent < Formula
  desc "Secure credential provider for Ansible vault and become passwords"
  homepage "https://github.com/vrischmann/mytools"
  version "1.0.5"
  license "MIT"

  if OS.mac?
    url "https://github.com/vrischmann/mytools/releases/download/v1.0.5/ansible-password-agent-1.0.5-aarch64-apple-darwin.tar.gz"
    sha256 "f0bb5da5a5332f5b5664b89a9bdb29dd30afad53300c024d0b9025cdd483b30f"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/mytools/releases/download/v1.0.5/ansible-password-agent-1.0.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1bb86b9be8447bf3c9814eaa561a47b46117b423501b3cb5a03537210749203e"
    end
  end

  on_linux do
    depends_on "keyutils"
  end

  def install
    bin.install "ansible-password-agent"
    (share/"fish/vendor_functions.d").install "ansible-password-agent.fish"
  end

  test do
    assert_match "ansible-password-agent #{version}", shell_output("#{bin}/ansible-password-agent --version")
  end
end
