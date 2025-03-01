class GelCliNightly < Formula
  desc "Latest release of the Gel command-line client (gel)"
  homepage "https://github.com/geldata/gel-cli"
  version "7.1.0-dev.1298"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.geldata.com/archive/aarch64-apple-darwin.nightly/gel-cli-7.1.0-dev.1298+746e1ea",
        using: :nounzip
      sha256 "34717e209031847938f82e36afe17c32273da383edacb041426d87a94cd411c9"

      def install
        bin.install "gel-cli-7.1.0-dev.1298+746e1ea" => "gel-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.geldata.com/archive/x86_64-apple-darwin.nightly/gel-cli-7.1.0-dev.1298+746e1ea",
        using: :nounzip
      sha256 "54a623f50f10c44229d06c8b47d6825dca39cdab2beddad7648da982a26dbfd5"

      def install
        bin.install "gel-cli-7.1.0-dev.1298+746e1ea" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/aarch64-unknown-linux-musl.nightly/gel-cli-7.1.0-dev.1298+e84b007",
        using: :nounzip
      sha256 "546eae1d5b955b914ab84188fa54bbca46d48f8fdc6fbe24923f7d17fbd59e04"

      def install
        bin.install "gel-cli-7.1.0-dev.1298+e84b007" => "gel-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/x86_64-unknown-linux-musl.nightly/gel-cli-7.1.0-dev.1298+f01f7f2",
        using: :nounzip
      sha256 "a313dd8673cc5c4531d4be409aceed2f8acb5151ed2d1e86873f1de5bf142c48"

      def install
        bin.install "gel-cli-7.1.0-dev.1298+f01f7f2" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/gel-nightly", "--version"
  end
end
