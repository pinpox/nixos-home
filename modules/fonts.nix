{ config, pkgs, lib, ... }: {

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    corefonts
    (nerdfonts.override { fonts = [ "SourceCodePro" ]; })
    noto-fonts-emoji
    source-sans-pro
    source-serif-pro
  ];
}
