class GelCli < Formula
  desc "Latest release of the Gel command-line client (gel)"
  homepage "https://github.com/geldata/gel-cli"
  version "7.1.1"

  def install_completions
    chmod 0555, bin/"gel"
    generate_completions_from_executable(bin/"gel", "_gen_completions", shell_parameter_format: :arg)
  end

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.geldata.com/archive/aarch64-apple-darwin/gel-cli-7.1.1+616a110",
        using: :nounzip
      sha256 "35169bec6611e969dcd6cf2679f925528f4ec141f005f8cef26138b27391a273"

      def install
        bin.install "gel-cli-7.1.1+616a110" => "gel"
        install_completions
      end
    elsif Hardware::CPU.intel?
      url "https://packages.geldata.com/archive/x86_64-apple-darwin/gel-cli-7.1.1+616a110",
        using: :nounzip
      sha256 "b86aab237aaefa8b0e784ba5b1eef46b615ba69a740e90e3bd9efa6a81cd7ae7"

      def install
        bin.install "gel-cli-7.1.1+616a110" => "gel"
        install_completions
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/aarch64-unknown-linux-musl/gel-cli-7.1.1+754cfa2",
        using: :nounzip
      sha256 "e718f520927c1a3c918ae05f9f92dded3390f38ccbdccfaa6f8184bb96de7267"

      def install
        bin.install "gel-cli-7.1.1+754cfa2" => "gel"
        install_completions
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/x86_64-unknown-linux-musl/gel-cli-7.1.1+45ade47",
        using: :nounzip
      sha256 "dcf183cc4bacb54fbdd3dae7d452a14d1ab3a860f910f1fc66be5158ceca1f99"

      def install
        bin.install "gel-cli-7.1.1+45ade47" => "gel"
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
