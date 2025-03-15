class GelCliNightly < Formula
  desc "Latest release of the Gel command-line client (gel)"
  homepage "https://github.com/geldata/gel-cli"
  version "7.2.0-dev.1313"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.geldata.com/archive/aarch64-apple-darwin.nightly/gel-cli-7.2.0-dev.1313+1c6969e",
        using: :nounzip
      sha256 "0f151450919a7c5ce7a6680af1ce37ad4183cc564a34e48a5551ce0c3ad83813"

      def install
        bin.install "gel-cli-7.2.0-dev.1313+1c6969e" => "gel-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.geldata.com/archive/x86_64-apple-darwin.nightly/gel-cli-7.2.0-dev.1313+1c6969e",
        using: :nounzip
      sha256 "06357373cce010d89ff151306afa05bf4eb86f1ec9fc063a4a15125f02b8b18e"

      def install
        bin.install "gel-cli-7.2.0-dev.1313+1c6969e" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/aarch64-unknown-linux-musl.nightly/gel-cli-7.2.0-dev.1313+c525d4d",
        using: :nounzip
      sha256 "2c9bb2a51de72e7f9e954d27f5c5043a8906770c0c35d74e7fcffac19b32aae6"

      def install
        bin.install "gel-cli-7.2.0-dev.1313+c525d4d" => "gel-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/x86_64-unknown-linux-musl.nightly/gel-cli-7.2.0-dev.1313+10d6e34",
        using: :nounzip
      sha256 "723d97cb05a88d0c12e298cc06cfd39930a9a2b136943c55ed25b3eca014500a"

      def install
        bin.install "gel-cli-7.2.0-dev.1313+10d6e34" => "gel-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/gel-nightly", "--version"
  end
end
