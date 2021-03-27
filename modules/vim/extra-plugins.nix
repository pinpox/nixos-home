
{ config, pkgs, lib, ... }:
let
  vars = import ./vars.nix;
  plugin = name: repo:
    pkgs.vimUtils.buildVimPluginFrom2Nix {
      pname = "vim-plugin-${name}";
      version = "git";
      src = builtins.fetchGit { url = "https://github.com/${repo}.git"; };
    };
in {
}

