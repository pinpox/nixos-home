{ config, pkgs, lib, ... }:
let
  vars = import ./vars.nix;
  awesome-config = pkgs.fetchgit {
    url = "https://github.com/pinpox/dotfiles-awesome.git";
    # sha256 = "122myzf3ymssaz5shn0bdk84k62wnb664nvrkpng5kd01ainyndb";
   fetchSubmodules = true;
  rev =  "08189291a1d3cc906e80a8e422966849f03133dc";
  # "date": "2020-12-31T02:15:58+01:00",
  # "path": "/nix/store/3478f513255863pa9vz6cdxginq8sfcr-dotfiles-awesome",
  sha256  = "1pcw382snncksk2ll6vv89iw95j0cia8xpm36xz8cmmpw7ciz87w";
  # "fetchSubmodules": false,
  # "deepClone": false,
  # "leaveDotGit": false
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
