#
#  Copyright 2023 Fred Dushin <fred@dushin.net>
#
#  SPDX-License-Identifier: Apache-2.0 OR LGPL-2.1-or-later
#

class Packbeam < Formula
  desc "A command-line utility for manipulating AtomVM PackBEAM files"
  homepage "https://atomvm.net"
  url "https://github.com/atomvm/atomvm_packbeam/archive/refs/tags/0.7.0.tar.gz"
  sha256 "eca0e8656987c973fb7292480bb96adbc7578772c83616e9cbc3753353e0aa15"
  license "Apache License 2.0"
  version "0.7.0"

  depends_on "erlang" => :build
  depends_on "rebar3" => :build
  depends_on "gzip" => :build

  def install
    system "rebar3", "release"
    system "rebar3", "tar"
    system "./install.sh", "#{prefix}", "#{version}"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test atomvm`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
