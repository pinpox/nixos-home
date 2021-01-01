{ config, pkgs, lib, awesome-config, ... }:
let
  vars = import ./vars.nix;
  awesome-config = pkgs.fetchgit {
    # Updated: 2020-12-31
    url = "https://github.com/pinpox/dotfiles-awesome.git";
    fetchSubmodules = true;
  rev = "7aeb993444df7121c27b0153f18c92c4b87a3521";
  sha256 = "1myj87lvyxjcmbqbbkd5jzv0rf2697pwvg9p1wc91xg082wfg9l5";
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
