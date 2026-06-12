class AnsiblePasswordAgent < Formula
  desc "Secure credential provider for Ansible vault and become passwords"
  homepage "https://github.com/vrischmann/mytools"
  license "MIT"

  if OS.mac?
    url "https://github.com/vrischmann/mytools/releases/download/ansible-password-agent%2Fv2.0.6/ansible-password-agent-2.0.6-aarch64-apple-darwin.tar.gz"
    sha256 "96797dbf1975246048b54aff7fcdec3e0b990cb72da7d01e7cad111861b75b22"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/vrischmann/mytools/releases/download/ansible-password-agent%2Fv2.0.6/ansible-password-agent-2.0.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fa0a412b468a44915d99c9538534093120cf6b7126a000343716adddf94149b7"
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
