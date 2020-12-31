{ config, pkgs, lib, ... }:
let
  vars = import ./vars.nix;
  awesome-config = pkgs.fetchgit {
    # Updated: 2020-12-31
    url = "https://github.com/pinpox/dotfiles-awesome.git";
    fetchSubmodules = true;
    rev = "08189291a1d3cc906e80a8e422966849f03133dc";
    sha256 = "0zdk5mm88whi9pcgkk8p4ag655fax2jk6k1mqkzicr0zdnysc6fr";
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
