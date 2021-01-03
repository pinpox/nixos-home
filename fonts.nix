{ config, pkgs, lib, ... }: {

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
      (nerdfonts.override { fonts = [ "SourceCodePro" ]; })
      ubuntu_font_family
      pkgs.dejavu_fonts
      noto-fonts-emoji
      corefonts
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
  };
}
