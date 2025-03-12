class GelCliNightly < Formula
  desc "Latest release of the Gel command-line client (gel)"
  homepage "https://github.com/geldata/gel-cli"
  version "7.2.0-dev.1306"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.geldata.com/archive/aarch64-apple-darwin.nightly/gel-cli-7.2.0-dev.1306+4ae233c",
        using: :nounzip
      sha256 "0b7abc9bb614a09a3c550752037547b1a73d84a3be7dee0efd714e5c77c84ecc"

      def install
        bin.install "gel-cli-7.2.0-dev.1306+4ae233c" => "gel-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.geldata.com/archive/x86_64-apple-darwin.nightly/gel-cli-7.2.0-dev.1306+4ae233c",
        using: :nounzip
      sha256 "c1dd696f85c16cdbf7c0e0f5c3be4fae1d43a07a167903cbc76613a933fa7ce8"

      def install
        bin.install "gel-cli-7.2.0-dev.1306+4ae233c" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/aarch64-unknown-linux-musl.nightly/gel-cli-7.2.0-dev.1306+f6931e7",
        using: :nounzip
      sha256 "fbd1379ea773083410175f88e27d6c5a6fad2e1f7ef6bcb31dcaa42f5dd98164"

      def install
        bin.install "gel-cli-7.2.0-dev.1306+f6931e7" => "gel-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/x86_64-unknown-linux-musl.nightly/gel-cli-7.2.0-dev.1306+7d4a485",
        using: :nounzip
      sha256 "27094931e5ff002b33373f9b2d8b5581ce0b110b78c39cbaf39f3992f0b45960"

      def install
        bin.install "gel-cli-7.2.0-dev.1306+7d4a485" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/gel-nightly", "--version"
  end
end
