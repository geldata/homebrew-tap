class GelCliNightly < Formula
  desc "Latest release of the Gel command-line client (gel)"
  homepage "https://github.com/geldata/gel-cli"
  version "7.2.0-dev.1311"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.geldata.com/archive/aarch64-apple-darwin.nightly/gel-cli-7.2.0-dev.1311+b37af77",
        using: :nounzip
      sha256 "854eee0515ddfa38b8f3e6959229f547f5c7d62755892be828b0506766e8aeee"

      def install
        bin.install "gel-cli-7.2.0-dev.1311+b37af77" => "gel-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.geldata.com/archive/x86_64-apple-darwin.nightly/gel-cli-7.2.0-dev.1311+b37af77",
        using: :nounzip
      sha256 "3c3f8e22617f1284d9b8bce40a6282890d153a05011b82e509d613513f8be84c"

      def install
        bin.install "gel-cli-7.2.0-dev.1311+b37af77" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/aarch64-unknown-linux-musl.nightly/gel-cli-7.2.0-dev.1311+b53c7bc",
        using: :nounzip
      sha256 "d95ff09f32fc855b0ccf77295124fcf320f44432d3b3ad760a55fd8516ea4367"

      def install
        bin.install "gel-cli-7.2.0-dev.1311+b53c7bc" => "gel-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/x86_64-unknown-linux-musl.nightly/gel-cli-7.2.0-dev.1311+993d19b",
        using: :nounzip
      sha256 "700e0228135de8b6d3131c52e52253b716c93533274357d8109affbdb3614f03"

      def install
        bin.install "gel-cli-7.2.0-dev.1311+993d19b" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/gel-nightly", "--version"
  end
end
