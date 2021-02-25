{ config, pkgs, lib, ... }: {

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    corefonts
    font-awesome-ttf
    jetbrains-mono
    nerdfonts
    noto-fonts
    noto-fonts-emoji
    source-sans-pro
    source-serif-pro
    ubuntu_font_family
  ];

  # Install some fonts system-wide, especially "Source Code Pro" in the
  # Nerd-Fonts pached version with extra glyphs.
  # fonts = {
  # fontDir.enable = true;
  # fonts = with pkgs; [
  # ];

  # fontconfig = {
  #   defaultFonts = {
  #     serif = [ "Ubuntu" ];
  #     sansSerif = [ "Ubuntu" ];
  #     monospace = [ "Ubuntu" ];
  #   };
  # };
  # };
}
