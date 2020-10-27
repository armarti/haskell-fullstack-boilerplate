# (import <nixpkgs> {})
(
  import (
    builtins.fetchTarball {
      url = "https://github.com/korayal/hls-nix/tarball/master";
    }
  ) {}
).hpkgs.haskell-language-server
