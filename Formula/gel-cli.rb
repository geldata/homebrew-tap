class GelCli < Formula
  desc "Latest release of the Gel command-line client (gel)"
  homepage "https://github.com/geldata/gel-cli"
  version "7.0.3"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.geldata.com/archive/aarch64-apple-darwin/gel-cli-7.0.3+79e11b7",
        using: :nounzip
      sha256 "e8c30918217f872f852f495fdc0dc35c79b48a59035309ab0a8befb4a423b1b2"

      def install
        bin.install "gel-cli-7.0.3+79e11b7" => "gel"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.geldata.com/archive/x86_64-apple-darwin/gel-cli-7.0.3+79e11b7",
        using: :nounzip
      sha256 "592c980a1762d8329f59c0cb8be4d7d0c7607f3221877ecdde71897445819d4c"

      def install
        bin.install "gel-cli-7.0.3+79e11b7" => "gel"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/aarch64-unknown-linux-musl/gel-cli-7.0.3+df3d924",
        using: :nounzip
      sha256 "37b178ced6c8372228e0064c8ffc80090f7d3e41dbc6b2053f973b5169f30507"

      def install
        bin.install "gel-cli-7.0.3+df3d924" => "gel"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/x86_64-unknown-linux-musl/gel-cli-7.0.3+83ce17b",
        using: :nounzip
      sha256 "6353e9ddefc7e973c2c3eb750b5fc9b4a81f1a9d0765e304d7e00e7e1348836d"

      def install
        bin.install "gel-cli-7.0.3+83ce17b" => "gel"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/gel", "--version"
  end
end
