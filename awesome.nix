{ config, pkgs, lib, builtins, ... }:
let
  vars = import ./vars.nix;
  awesome-config = builtins.fetchgit {
    url = "https://github.com/pinpox/dotfiles-awesome.git";
    sha256 = "1vp1dn0s32ds6f9f71drz2kqsv7zz0ain7d0wvifgjhm62xbdxw0";
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
