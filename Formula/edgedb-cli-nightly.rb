class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "6.2.0-dev.1269"

  def install_completions
    chmod 0555, bin/"edgedb-nightly"
    generate_completions_from_executable(bin/"edgedb-nightly", "_gen_completions", shell_parameter_format: :arg)
  end

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-6.2.0-dev.1269+234034a",
        using: :nounzip
      sha256 "f117e176b02c142680aa6c8d4920223de6911a039b3e3dee6dff4964abd817a1"

      define_method :install do
        bin.install "edgedb-cli-6.2.0-dev.1269+234034a" => "edgedb-nightly"
        install_completions
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-6.2.0-dev.1269+234034a",
        using: :nounzip
      sha256 "40ff250a8f5f719a8a3605e3ab8c5326d09fd02b229f486860f096505b5e64ac"

      define_method :install do
        bin.install "edgedb-cli-6.2.0-dev.1269+234034a" => "edgedb-nightly"
        install_completions
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-6.2.0-dev.1269+e373d52",
        using: :nounzip
      sha256 "bf299d1e287a3cbdfd16dec106721a2199eb702db661044500b940bb635b4e69"

      define_method :install do
        bin.install "edgedb-cli-6.2.0-dev.1269+e373d52" => "edgedb-nightly"
        install_completions
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-6.2.0-dev.1269+b471b49",
        using: :nounzip
      sha256 "a7d0790c7afc151d84fc54d5c2725b5f14fda903122c0c27d2e22651aa11e3cf"

      define_method :install do
        bin.install "edgedb-cli-6.2.0-dev.1269+b471b49" => "edgedb-nightly"
        install_completions
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
