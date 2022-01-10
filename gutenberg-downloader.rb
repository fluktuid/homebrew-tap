require "language/go"

class GutenbergDownloader < Formula
  desc "A Tool for downloading gutenberg books"
  homepage "https://github.com/fluktuid/gutenberg-downloader"
  url "https://github.com/fluktuid/gutenberg-downloader.git",
    :tag      => "v0.1.0"
  head "https://github.com/fluktuid/gutenberg-downloader.git"

  depends_on "go" => :build

  bottle :unneeded

  def install
    ENV["GOPATH"] = buildpath
    
    # Install Dependencies
    system "go", "get", "."
    
    # Build and install yaml
    system "go", "build", "-o", "#{bin}/gutenberg-downloader"
  end

end
