#
#  Copyright 2023 Fred Dushin <fred@dushin.net>
#
#  SPDX-License-Identifier: Apache-2.0 OR LGPL-2.1-or-later
#

class Atomvm < Formula
  desc "An Erlang VM for tiny systems"
  homepage "https://atomvm.net"
  url "https://github.com/atomvm/AtomVM/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "fdc9ead6de43b7896172f9d1902badb6c7c0a2f84c647a3f40f0846ba3a691bb"
  license "Apache License 2.0"
  version "v0.6.1"

  depends_on "cmake" => :build
  depends_on "gperf" => :build
  depends_on "erlang" => :build
  depends_on "elixir" => :build
  depends_on "zlib"
  depends_on "mbedtls"

  def install
    system "cmake", "-S", ".", "-B", "build", "-D", "AVM_BUILD_RUNTIME_ONLY=on", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
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
