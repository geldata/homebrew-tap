class EdgedbCliTesting < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.0.0-alpha.1"

  def install_completions
    chmod 0555, bin/"edgedb-testing"
    generate_completions_from_executable(bin/"edgedb-testing", "_gen_completions", shell_parameter_format: :arg)
  end

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.testing/edgedb-cli-4.0.0-alpha.1+ddfbe70",
        using: :nounzip
      sha256 "529cc1d5f2ad4333962d250a06cc9950b9c3b5a05c35236114c15d10317da976"

      def install
        bin.install "edgedb-cli-4.0.0-alpha.1+ddfbe70" => "edgedb-testing"
        install_completions
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.testing/edgedb-cli-4.0.0-alpha.1+285f84f",
        using: :nounzip
      sha256 "bc579953feaf6a0855c27255726cfe0bc0e54cb289bd13ff2bbb926a3dc3561a"

      def install
        bin.install "edgedb-cli-4.0.0-alpha.1+285f84f" => "edgedb-testing"
        install_completions
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.testing/edgedb-cli-4.0.0-alpha.1+51ec714",
        using: :nounzip
      sha256 "5352e68940114f38e51f90a9c94577368a5f9614d85ee02dbee05b339fa33ae0"

      def install
        bin.install "edgedb-cli-4.0.0-alpha.1+51ec714" => "edgedb-testing"
        install_completions
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.testing/edgedb-cli-4.0.0-alpha.1+dce7814",
        using: :nounzip
      sha256 "23f1e6d1f982756cad8385dc404c09a167d5ccf8a39724826bb609ab98e09b9d"

      def install
        bin.install "edgedb-cli-4.0.0-alpha.1+dce7814" => "edgedb-testing"
        install_completions
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-testing", "--version"
  end
end
