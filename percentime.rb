require "language/go"

class Percentime < Formula
  desc "A command line tool to dynamically execute a command and track the needed time as percentile."
  homepage "https://github.com/fluktuid/percentime"
  url "https://github.com/fluktuid/percentime.git",
    :tag      => "0.2.1"
  head "https://github.com/fluktuid/percentime.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    dir = buildpath/"src/github.com/fluktuid/percentime"
    dir.install buildpath.children - [buildpath/".brew_home"]

    # Install Dependencies
    system "go", "get", "-u", "github.com/jessevdk/go-flags"

    cd dir do
      system "go", "build", "-o", "#{bin}/percentime"
    end
  end

end

