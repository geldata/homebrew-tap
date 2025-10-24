class GelCli < Formula
  desc "Latest release of the Gel command-line client (gel)"
  homepage "https://github.com/geldata/gel-cli"
  version "7.9.0"

  def install_completions
    chmod 0555, bin/"gel"
    generate_completions_from_executable(bin/"gel", "_gen_completions", shell_parameter_format: :arg)
  end

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.geldata.com/archive/aarch64-apple-darwin/gel-cli-7.9.0+c84d665",
        using: :nounzip
      sha256 "a21ebfdc85abc3922e5732e4a1af932e0193b5993b274c1e08c861e185c46ad3"

      define_method :install do
        bin.install "gel-cli-7.9.0+c84d665" => "gel"
        install_completions
      end
    elsif Hardware::CPU.intel?
      url "https://packages.geldata.com/archive/x86_64-apple-darwin/gel-cli-7.9.0+070b371",
        using: :nounzip
      sha256 "3129b77db985471f4bd5a11c1745e7e5fd2008471f7226d85d0a2910af4b56ed"

      define_method :install do
        bin.install "gel-cli-7.9.0+070b371" => "gel"
        install_completions
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/aarch64-unknown-linux-musl/gel-cli-7.9.0+10975b6",
        using: :nounzip
      sha256 "94063681e026a7cc6c006e4219af3800c7ec857f2495dd3101bdcda9c8d8a1a2"

      define_method :install do
        bin.install "gel-cli-7.9.0+10975b6" => "gel"
        install_completions
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/x86_64-unknown-linux-musl/gel-cli-7.9.0+070b371",
        using: :nounzip
      sha256 "23fc4830e65a469cdf50e90eb4c63ae510a803a2168b2ce5687807823cb421b1"

      define_method :install do
        bin.install "gel-cli-7.9.0+070b371" => "gel"
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
