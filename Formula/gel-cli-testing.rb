class GelCliTesting < Formula
  desc "Latest release of the Gel command-line client (gel)"
  homepage "https://github.com/geldata/gel-cli"
  version "7.1.0-alpha.1"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.geldata.com/archive/aarch64-apple-darwin.testing/gel-cli-7.1.0-alpha.1+a8d565b",
        using: :nounzip
      sha256 "455dada1aae521453ab21063cfe5b0908001c74611234515574e21b1aa565339"

      def install
        bin.install "gel-cli-7.1.0-alpha.1+a8d565b" => "gel-testing"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.geldata.com/archive/x86_64-apple-darwin.testing/gel-cli-7.1.0-alpha.1+a8d565b",
        using: :nounzip
      sha256 "78aa0255f3aad78c3250c24dcbe026423d7e6dc17c187a91214657da2400ac20"

      def install
        bin.install "gel-cli-7.1.0-alpha.1+a8d565b" => "gel-testing"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/aarch64-unknown-linux-musl.testing/gel-cli-7.1.0-alpha.1+5f95e8a",
        using: :nounzip
      sha256 "be74eccd0da295dc9ec613cc3807a196e8921a260cb4b78b472a72ff04bfcc8a"

      def install
        bin.install "gel-cli-7.1.0-alpha.1+5f95e8a" => "gel-testing"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/x86_64-unknown-linux-musl.testing/gel-cli-7.1.0-alpha.1+073c70b",
        using: :nounzip
      sha256 "d892af584470451c1e64d669a0e4288be0ba7c36a0d00d1d9dfbfa3db5d3f17c"

      def install
        bin.install "gel-cli-7.1.0-alpha.1+073c70b" => "gel-testing"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/gel-testing", "--version"
  end
end
