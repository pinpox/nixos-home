{ config, pkgs, lib, ... }: {

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
      ubuntu_font_family
      dejavu_fonts
      # noto-fonts-emoji
      # nerdfonts
      # corefonts
      # noto-fonts
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
