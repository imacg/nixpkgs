{ stdenv, fetchurl, pkgconfig, intltool, itstool, gtkmm3, libxml2, libgtop, libwnck3, librsvg, systemd, mate, wrapGAppsHook }:

stdenv.mkDerivation rec {
  name = "mate-system-monitor-${version}";
  version = "1.20.1";

  src = fetchurl {
    url = "http://pub.mate-desktop.org/releases/${mate.getRelease version}/${name}.tar.xz";
    sha256 = "1a68il7pbch5028fm2caxyjkfrdc6ixhqnaspbwfziw6y8p9bscn";
  };

  nativeBuildInputs = [
    pkgconfig
    intltool
    itstool
    wrapGAppsHook
  ];

  buildInputs = [
    gtkmm3
    libxml2
    libgtop
    libwnck3
    librsvg
    systemd
  ];

  configureFlags = "--enable-systemd";

  meta = with stdenv.lib; {
    description = "System monitor for the MATE desktop";
    homepage = http://mate-desktop.org;
    license = [ licenses.gpl2Plus ];
    platforms = platforms.unix;
    maintainers = [ maintainers.romildo ];
  };
}
