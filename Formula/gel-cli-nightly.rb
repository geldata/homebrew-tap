class GelCliNightly < Formula
  desc "Latest release of the Gel command-line client (gel)"
  homepage "https://github.com/geldata/gel-cli"
  version "7.1.0-dev.1299"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.geldata.com/archive/aarch64-apple-darwin.nightly/gel-cli-7.1.0-dev.1299+f1eb32e",
        using: :nounzip
      sha256 "f7a67ee617d1781c9dbdb6c531df04a48236c1dbb8454b782c3f5e72e6fed6bb"

      def install
        bin.install "gel-cli-7.1.0-dev.1299+f1eb32e" => "gel-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.geldata.com/archive/x86_64-apple-darwin.nightly/gel-cli-7.1.0-dev.1299+35a0970",
        using: :nounzip
      sha256 "2cc040fbe8841a0140bc68b0db917056660c73be709f76dee174503c104db5b6"

      def install
        bin.install "gel-cli-7.1.0-dev.1299+35a0970" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/aarch64-unknown-linux-musl.nightly/gel-cli-7.1.0-dev.1299+1a327b4",
        using: :nounzip
      sha256 "0801526beaef217d501e652387dbb9696c545cb16cc9eb2e44cb36c6d9ebcbf9"

      def install
        bin.install "gel-cli-7.1.0-dev.1299+1a327b4" => "gel-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/x86_64-unknown-linux-musl.nightly/gel-cli-7.1.0-dev.1299+7846191",
        using: :nounzip
      sha256 "2505955b169284f5fa47f2c587483a2dcb67543ef09901da56c67014ae952348"

      def install
        bin.install "gel-cli-7.1.0-dev.1299+7846191" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/gel-nightly", "--version"
  end
end
