{ config, pkgs, lib, ... }:
let vars = import ./vars.nix;
in {
  # Browserpass
  programs.browserpass = {
    enable = true;
    browsers = [ "chromium" "firefox" ];
  };

  programs.chromium = {
    enable = true;
    extensions = [
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      "gcbommkclmclpchllfjekcdonpmejbdp" # HTTPS Everywhere
      "lbhnkgjaoonakhladmcjkemebepeohkn" # Vim Tips New Tab
    ];
  };

  programs.firefox = {
    enable = true;
    # profiles = TODO
    # extensions = [ TODO ]
  };
}
