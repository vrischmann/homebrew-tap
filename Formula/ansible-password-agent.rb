class AnsiblePasswordAgent < Formula
  desc "Secure credential provider for Ansible vault and become passwords"
  homepage "https://github.com/vrischmann/mytools"
  version "0.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/vrischmann/mytools/releases/download/v0.1.0/ansible-password-agent-0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "TODO"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/mytools/releases/download/v0.1.0/ansible-password-agent-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "TODO"
    elsif Hardware::CPU.arm?
      url "https://github.com/vrischmann/mytools/releases/download/v0.1.0/ansible-password-agent-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "TODO"
    end
  end

  def install
    bin.install "ansible-password-agent"
    (share/"fish/vendor_conf.d").install "ansible-password-agent.fish"
  end

  test do
    assert_match "ansible-password-agent #{version}", shell_output("#{bin}/ansible-password-agent --version")
  end
end
