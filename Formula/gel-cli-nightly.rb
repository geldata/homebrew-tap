class GelCliNightly < Formula
  desc "Latest release of the Gel command-line client (gel)"
  homepage "https://github.com/geldata/gel-cli"
  version "7.1.0-dev.1297"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.geldata.com/archive/aarch64-apple-darwin.nightly/gel-cli-7.1.0-dev.1297+c5c8527",
        using: :nounzip
      sha256 "258256541b9731a23624073261bf1e27f0fe4b97eaa9908ed22dcf1e2a31d0b4"

      def install
        bin.install "gel-cli-7.1.0-dev.1297+c5c8527" => "gel-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.geldata.com/archive/x86_64-apple-darwin.nightly/gel-cli-7.1.0-dev.1297+371ff12",
        using: :nounzip
      sha256 "c33997291f1c2983f9c8359fde185fcb8707c7ee90d7ad344cbec9bf3bdff4ed"

      def install
        bin.install "gel-cli-7.1.0-dev.1297+371ff12" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/aarch64-unknown-linux-musl.nightly/gel-cli-7.1.0-dev.1297+aae2cc7",
        using: :nounzip
      sha256 "03882b1ad1e95f3333d2f15ab619815f7438aac461885ebec1e4a031acac5efd"

      def install
        bin.install "gel-cli-7.1.0-dev.1297+aae2cc7" => "gel-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/x86_64-unknown-linux-musl.nightly/gel-cli-7.1.0-dev.1297+dfa6787",
        using: :nounzip
      sha256 "ff512cf65a28a1358206d380e1137e17799934e99a50385f4e82a238838633de"

      def install
        bin.install "gel-cli-7.1.0-dev.1297+dfa6787" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/gel-nightly", "--version"
  end
end
