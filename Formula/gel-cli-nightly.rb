class GelCliNightly < Formula
  desc "Latest release of the Gel command-line client (gel)"
  homepage "https://github.com/geldata/gel-cli"
  version "7.2.0-dev.1332"

  def install_completions
    chmod 0555, bin/"gel-nightly"
    generate_completions_from_executable(bin/"gel-nightly", "_gen_completions", shell_parameter_format: :arg)
  end

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.geldata.com/archive/aarch64-apple-darwin.nightly/gel-cli-7.2.0-dev.1332+d291151",
        using: :nounzip
      sha256 "866574fd56959fb2226e1b90b73fed4bed28b0d87006ba5ffd85316a1fca15a1"

      def install
        bin.install "gel-cli-7.2.0-dev.1332+d291151" => "gel-nightly"
        install_completions
      end
    elsif Hardware::CPU.intel?
      url "https://packages.geldata.com/archive/x86_64-apple-darwin.nightly/gel-cli-7.2.0-dev.1332+d291151",
        using: :nounzip
      sha256 "3399af4a25988c5d99dd158eab0d6ed391f3b79d8650634165909798c36e323e"

      def install
        bin.install "gel-cli-7.2.0-dev.1332+d291151" => "gel-nightly"
        install_completions
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/aarch64-unknown-linux-musl.nightly/gel-cli-7.2.0-dev.1332+64969dd",
        using: :nounzip
      sha256 "bb244f0bd0f3a7b90854280654caf623430100b035b7c92d72f1cb1414339a21"

      def install
        bin.install "gel-cli-7.2.0-dev.1332+64969dd" => "gel-nightly"
        install_completions
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/x86_64-unknown-linux-musl.nightly/gel-cli-7.2.0-dev.1332+be9397e",
        using: :nounzip
      sha256 "905ab35f51f0680dd059b46259fefbf3a047462617010a910f50b7a3923afa01"

      def install
        bin.install "gel-cli-7.2.0-dev.1332+be9397e" => "gel-nightly"
        install_completions
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/gel-nightly", "--version"
  end
end
