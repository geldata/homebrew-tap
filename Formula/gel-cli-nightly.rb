class GelCliNightly < Formula
  desc "Latest release of the Gel command-line client (gel)"
  homepage "https://github.com/geldata/gel-cli"
  version "7.10.2-dev.1474"

  def install_completions
    chmod 0555, bin/"gel-nightly"
    generate_completions_from_executable(bin/"gel-nightly", "_gen_completions", shell_parameter_format: :arg)
  end

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.geldata.com/archive/aarch64-apple-darwin.nightly/gel-cli-7.10.2-dev.1474+8ddf8a0",
        using: :nounzip
      sha256 "47ac0751ece43e3144cf841676089eaf9bfcbc76cc110383c7ff47f7d14b45aa"

      define_method :install do
        bin.install "gel-cli-7.10.2-dev.1474+8ddf8a0" => "gel-nightly"
        install_completions
      end
    elsif Hardware::CPU.intel?
      url "https://packages.geldata.com/archive/x86_64-apple-darwin.nightly/gel-cli-7.10.2-dev.1474+fab4b92",
        using: :nounzip
      sha256 "62185f04f45aa0e9fd8bff7baa75d46510deeb6a2dffe3f584a76f178a4b8722"

      define_method :install do
        bin.install "gel-cli-7.10.2-dev.1474+fab4b92" => "gel-nightly"
        install_completions
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/aarch64-unknown-linux-musl.nightly/gel-cli-7.10.2-dev.1474+b0bd56f",
        using: :nounzip
      sha256 "36d0c5624cfa7de957ab401924018e7768eaaba7e8a9d8bb9d1258aa5555df9a"

      define_method :install do
        bin.install "gel-cli-7.10.2-dev.1474+b0bd56f" => "gel-nightly"
        install_completions
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/x86_64-unknown-linux-musl.nightly/gel-cli-7.10.2-dev.1474+fab4b92",
        using: :nounzip
      sha256 "aa545c15a58c1e54e08ba051aa55bd41233e4a9792cc5e8d783d494c017bcfaa"

      define_method :install do
        bin.install "gel-cli-7.10.2-dev.1474+fab4b92" => "gel-nightly"
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
