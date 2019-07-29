{ stdenv, fetchurl, pkgconfig, libXaw, libXt }:
stdenv.mkDerivation {
  name = "xmessage-1.0.2";
  src = fetchurl {
    url = mirror://xorg/individual/app/xmessage-1.0.2.tar.bz2;
    sha256 = "1hy3n227iyrm323hnrdld8knj9h82fz6s7x6bw899axcjdp03d02";
  };
  buildInputs = [ pkgconfig libXaw libXt ];
}
