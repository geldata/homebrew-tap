class GelCliNightly < Formula
  desc "Latest release of the Gel command-line client (gel)"
  homepage "https://github.com/geldata/gel-cli"
  version "7.2.0-dev.1312"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.geldata.com/archive/aarch64-apple-darwin.nightly/gel-cli-7.2.0-dev.1312+b31db25",
        using: :nounzip
      sha256 "6680619f1ac8a15989738c61f62e6af69894e05a6b3d730dcbb516830b438ebd"

      def install
        bin.install "gel-cli-7.2.0-dev.1312+b31db25" => "gel-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.geldata.com/archive/x86_64-apple-darwin.nightly/gel-cli-7.2.0-dev.1312+b31db25",
        using: :nounzip
      sha256 "b8466fef9eebfbc3c91c3982a90c6451ac0acde00ed9e5f6d33980ccad39523f"

      def install
        bin.install "gel-cli-7.2.0-dev.1312+b31db25" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/aarch64-unknown-linux-musl.nightly/gel-cli-7.2.0-dev.1312+358af96",
        using: :nounzip
      sha256 "4787461ff2692c563abd1e68d8f11eff98c57050a3e2ae4340ab65bd0bb5e85b"

      def install
        bin.install "gel-cli-7.2.0-dev.1312+358af96" => "gel-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/x86_64-unknown-linux-musl.nightly/gel-cli-7.2.0-dev.1312+62b5bcf",
        using: :nounzip
      sha256 "0886fa087ceecc5efc16b3245f50abacf5b2d678bd95ceadbf4945ee07da2b76"

      def install
        bin.install "gel-cli-7.2.0-dev.1312+62b5bcf" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/gel-nightly", "--version"
  end
end
