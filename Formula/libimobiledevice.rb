class Libimobiledevice < Formula

  desc "Library to communicate with iOS devices natively"
  homepage "http://www.libimobiledevice.org/"
  url "https://github.com/liuyuqiang/brew_custom/raw/master/bottles/libimobiledevice-1.2.0.el_capitan.bottle.tar.gz"
  sha256 "db353988bbd70c57409338bba501a618e1d92e920e409ef587a870618878c18c"

  head do
    url "http://git.sukimashita.com/libimobiledevice.git"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
    depends_on "libxml2"
  end

  depends_on "pkg-config" => :build
  depends_on "libtasn1"
  depends_on "libplist"
  depends_on "usbmuxd"
  depends_on "openssl"

  def install
    system "./autogen.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          # As long as libplist builds without Cython
                          # bindings, libimobiledevice must as well.
                          "--without-cython"
    system "make", "install"
  end
end
