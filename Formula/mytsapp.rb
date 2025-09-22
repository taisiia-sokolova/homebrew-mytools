class Mytsapp < Formula
  desc "Tiny CLI in TypeScript"
  homepage "https://github.com/taisiia-sokolova/mytsapp-cli"
  url "https://github.com/taisiia-sokolova/mytsapp-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "522c46d22546e91760e850d6178f359885ec3f4ab95f4bab8c76334f1e5a9a7c"
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