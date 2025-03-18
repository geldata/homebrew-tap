class GelCliNightly < Formula
  desc "Latest release of the Gel command-line client (gel)"
  homepage "https://github.com/geldata/gel-cli"
  version "7.2.0-dev.1317"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.geldata.com/archive/aarch64-apple-darwin.nightly/gel-cli-7.2.0-dev.1317+4ff36ae",
        using: :nounzip
      sha256 "9cd15e214c52bc079eaea9a6459e2303f90d5f77c09be33da9cfcc8ae7e68042"

      def install
        bin.install "gel-cli-7.2.0-dev.1317+4ff36ae" => "gel-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.geldata.com/archive/x86_64-apple-darwin.nightly/gel-cli-7.2.0-dev.1317+4ff36ae",
        using: :nounzip
      sha256 "fe2e99490f29b405207c856e1eabcb639da47ab9b73e4957c0fec8bca4501439"

      def install
        bin.install "gel-cli-7.2.0-dev.1317+4ff36ae" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/aarch64-unknown-linux-musl.nightly/gel-cli-7.2.0-dev.1317+669b76c",
        using: :nounzip
      sha256 "b6271011c4ec81982d274b1cec90ac9843a62ed0aa5ea8e84f86faeeef6f29d3"

      def install
        bin.install "gel-cli-7.2.0-dev.1317+669b76c" => "gel-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/x86_64-unknown-linux-musl.nightly/gel-cli-7.2.0-dev.1317+878419d",
        using: :nounzip
      sha256 "a5d6e0fcabd5776bb89498c1f25ea7692d352e425612d5454ae601d9370ec0f1"

      def install
        bin.install "gel-cli-7.2.0-dev.1317+878419d" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/gel-nightly", "--version"
  end
end
