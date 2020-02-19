require "language/go"

class Percentime < Formula
  desc "A command line tool to dynamically execute a command and track the needed time as percentile."
  homepage "https://github.com/fluktuid/percentime"
  url "https://github.com/fluktuid/percentime.git",
    :tag      => "0.2.1"
  head "https://github.com/fluktuid/percentime.git"

  depends_on "go" => :build

  bottle :unneeded

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/fluktuid").mkpath
    ln_sf buildpath, buildpath/"src/github.com/fluktuid/percentime"

    # Install Dependencies
    system "go", "get", "-u", "github.com/jessevdk/go-flags"

    # Build and install yaml
    system "go", "build", "-o", "#{bin}/percentime"
  end

end
