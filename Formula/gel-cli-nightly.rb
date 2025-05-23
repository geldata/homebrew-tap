class GelCliNightly < Formula
  desc "Latest release of the Gel command-line client (gel)"
  homepage "https://github.com/geldata/gel-cli"
  version "7.5.0-dev.1372"

  def install_completions
    chmod 0555, bin/"gel-nightly"
    generate_completions_from_executable(bin/"gel-nightly", "_gen_completions", shell_parameter_format: :arg)
  end

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.geldata.com/archive/aarch64-apple-darwin.nightly/gel-cli-7.5.0-dev.1372+5ab407b",
        using: :nounzip
      sha256 "60329b10374702e456d94d0c430582b698fb9a97fe3207ff8ce6468ad5bfe178"

      def install
        bin.install "gel-cli-7.5.0-dev.1372+5ab407b" => "gel-nightly"
        install_completions
      end
    elsif Hardware::CPU.intel?
      url "https://packages.geldata.com/archive/x86_64-apple-darwin.nightly/gel-cli-7.5.0-dev.1372+fab03e9",
        using: :nounzip
      sha256 "bedb04cb5ddd132e16422722d66a7fd4eeed513353d556a27ae8ff0aea7455d1"

      def install
        bin.install "gel-cli-7.5.0-dev.1372+fab03e9" => "gel-nightly"
        install_completions
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/aarch64-unknown-linux-musl.nightly/gel-cli-7.5.0-dev.1372+b43a5e0",
        using: :nounzip
      sha256 "f9da81a6cb184c9ffe421b491c3d18ed9d4f786bb0482ac3e783513a26c1f652"

      def install
        bin.install "gel-cli-7.5.0-dev.1372+b43a5e0" => "gel-nightly"
        install_completions
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/x86_64-unknown-linux-musl.nightly/gel-cli-7.5.0-dev.1372+0f423e6",
        using: :nounzip
      sha256 "51d4333193d3ea30526140bf9f63da9a331142c45d7e4d72f032343739e7d136"

      def install
        bin.install "gel-cli-7.5.0-dev.1372+0f423e6" => "gel-nightly"
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
