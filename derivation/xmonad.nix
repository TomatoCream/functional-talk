{ stdenv, fetchurl, ghc, X11, xmessage }:
  stdenv.mkDerivation (rec {
    name = "xmonad-0.5";
    src = fetchurl {
    url = "http://hackage.haskell.org/.../${name}.tar.gz";
    sha256 = "1i74az7w7nbirw6n6lcm44vf05hjq1yyhnsssc779yh0n00lbk6g";
  };
  buildInputs = [ ghc X11 ];
  configurePhase = ''
    substituteInPlace XMonad/Core.hs --replace \
    '"xmessage"' '"${xmessage}/bin/xmessage"'
    ghc --make Setup.lhs
    ./Setup configure --prefix="$out"
  '';
  buildPhase = ''
    ./Setup build
  '';
  installPhase = ''
    ./Setup copy
    ./Setup register --gen-script
  '';
  meta = {
  description = "A tiling window manager for X";
  };
})
