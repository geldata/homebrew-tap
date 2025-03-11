class GelCli < Formula
  desc "Latest release of the Gel command-line client (gel)"
  homepage "https://github.com/geldata/gel-cli"
  version "7.1.0"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.geldata.com/archive/aarch64-apple-darwin/gel-cli-7.1.0+7877b37",
        using: :nounzip
      sha256 "073dd03ffe5cb106d564c59fea386e714734227efad567ab4c85e82008fb68ce"

      def install
        bin.install "gel-cli-7.1.0+7877b37" => "gel"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.geldata.com/archive/x86_64-apple-darwin/gel-cli-7.1.0+7877b37",
        using: :nounzip
      sha256 "277969c47369c3d9df7cb44ed802e6c2dd0802148cc71653831313279c49782b"

      def install
        bin.install "gel-cli-7.1.0+7877b37" => "gel"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/aarch64-unknown-linux-musl/gel-cli-7.1.0+657be26",
        using: :nounzip
      sha256 "13c70a6cb18e51ab64694ea9f8a20a7cb8b6b4e6ac4ff36da2d6a8e67edb60c8"

      def install
        bin.install "gel-cli-7.1.0+657be26" => "gel"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.geldata.com/archive/x86_64-unknown-linux-musl/gel-cli-7.1.0+5190e92",
        using: :nounzip
      sha256 "87b1ce61ae6c24e23e5da61ef99b3ce5a0e13f4b190318b40f662296e8ea5f6e"

      def install
        bin.install "gel-cli-7.1.0+5190e92" => "gel"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/gel", "--version"
  end
end
