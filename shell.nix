#!/usr/bin/env nix-shell
#!nix-shell -i bash --max-jobs auto --cores 0

(import ./. {}).shells.ghc
