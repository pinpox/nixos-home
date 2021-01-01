{ config, pkgs, lib, awesome-config, ... }:
let
  vars = import ./vars.nix;
  awesome-config = pkgs.fetchgit {
    # Updated: 2020-12-31
    url = "https://github.com/pinpox/dotfiles-awesome.git";
    fetchSubmodules = true;
    rev = "31ce82312824d5ab75e22cb0353a91408861ee95";
    sha256 = "06rp926xwqcl7zlcdwjk002s38q1hl3vniqd73c26if7lqxzq3c8";
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

  # TODO make this a flake input
  # Link the awesome configuration
  home.file = {
    ".config/awesome".source = awesome-config;
  };
}
