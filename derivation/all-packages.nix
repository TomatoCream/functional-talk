rec {
  xmonad = import ./xmonad.nix {
    inherit stdenv fetchurl ghc X11 xmessage;
  };
  xmessage = import ./xmessage.nix {
    inherit stdenv fetchurl ghc X11 xmessage;
  };
  ghc = ghc68;
  ghc68 = import ../development/compilers/ghc-6.8 {
    inherit fetchurl stdenv readline perl gmp ncurses m4;
    ghc = ghcboot;
  };
  ghcboot = ...;
  stdenv = ...;
  ...
}
