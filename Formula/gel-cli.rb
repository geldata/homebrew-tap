class GelCli < Formula
  desc "Latest release of the Gel command-line client (gel)"
  homepage "https://github.com/geldata/gel-cli"
  version "7.4.0"

  def install_completions
    chmod 0555, bin/"gel"
    generate_completions_from_executable(bin/"gel", "_gen_completions", shell_parameter_format: :arg)
  end

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.geldata.com/archive/aarch64-apple-darwin/gel-cli-7.4.0+bb0c441",
        using: :nounzip
      sha256 "49a6b3a7df750bfd3018ba004761a91d8aba9a4295b488a32d6f96414a3c186a"

      def install
        bin.install "gel-cli-7.4.0+bb0c441" => "gel"
        install_completions
      end
    elsif Hardware::CPU.intel?
      url "https://packages.geldata.com/archive/x86_64-apple-darwin/gel-cli-7.4.0+bb0c441",
        using: :nounzip
      sha256 "07db80fd17d6f0ec3365fc339589350f591b4ab1a058eeba6dbc9aa0c6eff03c"

      def install
        bin.install "gel-cli-7.4.0+bb0c441" => "gel"
        install_completions
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/aarch64-unknown-linux-musl/gel-cli-7.4.0+6a31e0e",
        using: :nounzip
      sha256 "ed9dbb41efe7a89fe927bfbd2abff85a09addab783ead3cb1a3e3400236585ee"

      def install
        bin.install "gel-cli-7.4.0+6a31e0e" => "gel"
        install_completions
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/x86_64-unknown-linux-musl/gel-cli-7.4.0+dad3a5f",
        using: :nounzip
      sha256 "7f340a393481bec55295edff6f2cc0ee44c8b4bd7e6c92d1a21cbcad38b7fb7b"

      def install
        bin.install "gel-cli-7.4.0+dad3a5f" => "gel"
        install_completions
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/gel", "--version"
  end
end
