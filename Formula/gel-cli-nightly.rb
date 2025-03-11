class GelCliNightly < Formula
  desc "Latest release of the Gel command-line client (gel)"
  homepage "https://github.com/geldata/gel-cli"
  version "7.2.0-dev.1304"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.geldata.com/archive/aarch64-apple-darwin.nightly/gel-cli-7.2.0-dev.1304+5bf4e4a",
        using: :nounzip
      sha256 "5aa5adf8073d91abaff4f784dff9cbfda548390bc927e68b64ae3051a31b715b"

      def install
        bin.install "gel-cli-7.2.0-dev.1304+5bf4e4a" => "gel-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.geldata.com/archive/x86_64-apple-darwin.nightly/gel-cli-7.2.0-dev.1304+5bf4e4a",
        using: :nounzip
      sha256 "21090dd12e7ba2f85ee3375c8973dc956d4ed65380bd21877fe435c23f708304"

      def install
        bin.install "gel-cli-7.2.0-dev.1304+5bf4e4a" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/aarch64-unknown-linux-musl.nightly/gel-cli-7.2.0-dev.1304+3cd2a03",
        using: :nounzip
      sha256 "5333d450a67ea617d9542fce1ccf4dd7c4da911adcbcd0b44fb8886ccddeb9c8"

      def install
        bin.install "gel-cli-7.2.0-dev.1304+3cd2a03" => "gel-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/x86_64-unknown-linux-musl.nightly/gel-cli-7.2.0-dev.1304+eacf828",
        using: :nounzip
      sha256 "39cc1c52e649ba1cb20bcf6f2a7665d589530187cf9f999d88413fce644f9de0"

      def install
        bin.install "gel-cli-7.2.0-dev.1304+eacf828" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/gel-nightly", "--version"
  end
end
