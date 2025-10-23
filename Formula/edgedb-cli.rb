class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "6.1.2"

  def install_completions
    chmod 0555, bin/"edgedb"
    generate_completions_from_executable(bin/"edgedb", "_gen_completions", shell_parameter_format: :arg)
  end

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-6.1.2+02c2b9d",
        using: :nounzip
      sha256 "02c7a0e45399710ecdd51e38b8647012f9dcd31c292f95b8cf5fe3119251c1d8"

      define_method :install do
        bin.install "edgedb-cli-6.1.2+02c2b9d" => "edgedb"
        install_completions
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-6.1.2+02c2b9d",
        using: :nounzip
      sha256 "9b5f795835e4eeba573283c9a7b41f7c91073c9d062e9d4789ef4568d54abefa"

      define_method :install do
        bin.install "edgedb-cli-6.1.2+02c2b9d" => "edgedb"
        install_completions
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-6.1.2+f4c653c",
        using: :nounzip
      sha256 "4bfc7f15711698626faf3a3412489dfb9fb5958a560f7654ec8045b43e9c6048"

      define_method :install do
        bin.install "edgedb-cli-6.1.2+f4c653c" => "edgedb"
        install_completions
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-6.1.2+ac96ce0",
        using: :nounzip
      sha256 "3217ad2180772c9f6d39216ccd5ec4775f651d83e6804e652f3aa903042609e5"

      define_method :install do
        bin.install "edgedb-cli-6.1.2+ac96ce0" => "edgedb"
        install_completions
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
