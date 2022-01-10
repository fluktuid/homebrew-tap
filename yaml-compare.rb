require "language/go"

class YamlCompare < Formula
  desc "A command line tool to compare two yaml files"
  homepage "https://github.com/fluktuid/yaml-compare"
  url "https://github.com/fluktuid/yaml-compare.git",
    :tag      => "0.0.3"
  head "https://github.com/fluktuid/yaml-compare.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    
    # Install Dependencies
    system "go", "get", "-u", "github.com/logrusorgru/aurora"
    system "go", "get", "-u", "github.com/spf13/pflag"
    
    # Build and install yaml
    system "go", "build", "-o", "#{bin}/yml"
  end

end
