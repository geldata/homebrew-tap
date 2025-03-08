class GelCliNightly < Formula
  desc "Latest release of the Gel command-line client (gel)"
  homepage "https://github.com/geldata/gel-cli"
  version "7.1.0-dev.1301"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.geldata.com/archive/aarch64-apple-darwin.nightly/gel-cli-7.1.0-dev.1301+9ffd21d",
        using: :nounzip
      sha256 "caca4ce1c06408d712dc40e4e87e50cc87e2f68bd70bcb0d86961e7556538145"

      def install
        bin.install "gel-cli-7.1.0-dev.1301+9ffd21d" => "gel-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.geldata.com/archive/x86_64-apple-darwin.nightly/gel-cli-7.1.0-dev.1301+16f0ec3",
        using: :nounzip
      sha256 "63a8a157bc785b407b0de8a584c88c14be77cb9829f02774ae97dacfdbeb706c"

      def install
        bin.install "gel-cli-7.1.0-dev.1301+16f0ec3" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/aarch64-unknown-linux-musl.nightly/gel-cli-7.1.0-dev.1301+e9cca01",
        using: :nounzip
      sha256 "d9bf571a5b920f22e5b837a44ab96731fe5ebc34cf5c6ccfa71bbc67646a97ae"

      def install
        bin.install "gel-cli-7.1.0-dev.1301+e9cca01" => "gel-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/x86_64-unknown-linux-musl.nightly/gel-cli-7.1.0-dev.1301+f85812f",
        using: :nounzip
      sha256 "3b7a5c29cb3b78d4507a0c1b474aaf661c33e0aadd647d9ce1c96137e166d49c"

      def install
        bin.install "gel-cli-7.1.0-dev.1301+f85812f" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/gel-nightly", "--version"
  end
end
