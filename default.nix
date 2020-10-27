{ system ? builtins.currentSystem }:

(import ./tools/reflex-platform { inherit system; }).project (
  { pkgs, ... }: {
    name = "hs-fullstack";
    useWarp = true;
    packages = {
      common = ./common;
      backend = ./backend;
      frontend = ./frontend;
    };
    shells = {
      ghc = [ "common" "backend" "frontend" ];
      ghcjs = [ "common" "frontend" ];
    };
    shellToolOverrides = ghc: super: {
      inherit ((
        import (
          builtins.fetchTarball {
            url = "https://github.com/korayal/hls-nix/archive/d0681b7dd11c0290fc1f4c481f308ca830fc641f.tar.gz";
          }
        ) {}
      ).hpkgs)
        haskell-language-server
        ormolu
        ghcide
        ;
    };
  }
)
