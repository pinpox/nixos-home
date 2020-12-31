{ config, pkgs, lib, ... }:
let
  vars = import ./vars.nix;
  awesome-config = pkgs.fetchgit {
    url = "https://github.com/pinpox/dotfiles-awesome.git";
    # sha256 = "122myzf3ymssaz5shn0bdk84k62wnb664nvrkpng5kd01ainyndb";
    fetchSubmodules = true;
  };

in {

  xsession.scriptPath = ".hm-xsession";
  xsession.enable = true;

  xsession.windowManager.awesome = {
    enable = true;
    package = pkgs.awesome;
    # List of lua packages available for being used in the Awesome
    # configuration.
    luaModules = [ pkgs.luaPackages.lgi pkgs.luaPackages.luafilesystem ];

    # Disable client transparency support, which can be greatly detrimental to
    # performance in some setups
    # noArgd = true;
  };

  # Link the awesome configuration
  # TODO link individual files ?
  home.file = {
    # ".config/awesome".source = ./awesome; 
    ".config/awesome".source = awesome-config;
  };
}
