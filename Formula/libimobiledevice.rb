class Libimobiledevice < Formula

  desc "Library to communicate with iOS devices natively"
  homepage "http://www.libimobiledevice.org/"
  url "https://github.com/liuyuqiang/brew_custom/raw/master/bottles/libimobiledevice-1.2.0.el_capitan.bottle.tar.gz"
  sha256 "43ddf71acc0896c47dfdebfb61d803b1b6299997366492f3ca12cb4a3549f133"

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
