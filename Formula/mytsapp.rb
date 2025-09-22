class Mytsapp < Formula
  desc "Tiny CLI in TypeScript"
  homepage "https://github.com/taisiia-sokolova/mytsapp-cli"
  url "https://github.com/taisiia-sokolova/mytsapp-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "580b6085bfc2aaa721ecc67e424dbf9d97769452ed05f825be16eee826c4f1f7"
  license "MIT"

  depends_on "node@20" => :build

  def install
    system "npm", "ci"
    system "npx", "tsc"  # ← вместо npm run build
    system "npm", "install", *std_npm_args(prefix: libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/mytsapp --version")
  end
end