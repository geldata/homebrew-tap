class GelCliNightly < Formula
  desc "Latest release of the Gel command-line client (gel)"
  homepage "https://github.com/geldata/gel-cli"
  version "7.1.0-dev.1300"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.geldata.com/archive/aarch64-apple-darwin.nightly/gel-cli-7.1.0-dev.1300+3e61d92",
        using: :nounzip
      sha256 "086365ed27bc9b227f0919da0e8777c8669809aa0104295f35d929e1cd7e9a26"

      def install
        bin.install "gel-cli-7.1.0-dev.1300+3e61d92" => "gel-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.geldata.com/archive/x86_64-apple-darwin.nightly/gel-cli-7.1.0-dev.1300+b35be2a",
        using: :nounzip
      sha256 "fa3ecf96e5dbadd0da8226548ce42521cb106ef196b182031229d3ff5b863ab9"

      def install
        bin.install "gel-cli-7.1.0-dev.1300+b35be2a" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/aarch64-unknown-linux-musl.nightly/gel-cli-7.1.0-dev.1300+e364e58",
        using: :nounzip
      sha256 "882942dc1b707f7de48e30bb7265f3e904e1f938b4da5fe2c7184934f340eccb"

      def install
        bin.install "gel-cli-7.1.0-dev.1300+e364e58" => "gel-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/x86_64-unknown-linux-musl.nightly/gel-cli-7.1.0-dev.1300+c3e6951",
        using: :nounzip
      sha256 "2badbe28dd27f351c3fe433fd99cbf3f9a983c564218cd815283593fcf867550"

      def install
        bin.install "gel-cli-7.1.0-dev.1300+c3e6951" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/gel-nightly", "--version"
  end
end
