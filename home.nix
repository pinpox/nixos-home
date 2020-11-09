{ config, pkgs, lib, ... }:
let
  vars = import ./vars.nix;
  splitString = str:
    builtins.filter builtins.isString (builtins.split "\n" str);
in {

  # Allow "unfree" licenced packages
  nixpkgs.config = { allowUnfree = true; };

  # Install these packages for my user
  home.packages = with pkgs; [
    vagrant
    styx
    nix-index
    arduino
    arduino-cli
    lxappearance
    xarchiver
    gcc
    pkg-config
    openvpn
    networkmanager-openvpn
    asciinema
    virt-manager
    unzip
    gimp
    seafile-client
    hugo
    gtk_engines
    arc-theme
    xclip
    signal-desktop
    playerctl
    imagemagick
    papirus-icon-theme
    matcha-gtk-theme
    networkmanagerapplet
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.gvfs
    exa
    htop
    nitrogen
    thunderbird
    xorg.xrandr
    arandr
    spotify
    cbatticon
    manix
    httpie
    vlc
    libnotify
    xfce.xfce4-volumed-pulse
    pavucontrol
    retroarch
    tealdeer
    scrot
    # paper-gtk-theme
    # nerdfonts
    # material-design-icons
    # material-icons
  ];

  # Imports
  imports = [
    ./shell.nix
    ./alacritty.nix
    ./gtk.nix
    ./i3.nix
    ./vim.nix
    ./polybar.nix
    ./browsers.nix
    ./credentials.nix
    ./xdg.nix
    ./games.nix
  ];

  # Include man-pages
  manual.manpages.enable = true;

  # Environment variables
  home.sessionVariables = { LIBGL_ALWAYS_SOFTWARE = "1"; };

  programs = {

    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    # mvp

    # newsboat = {
    #   enable = true;
    #   autoReload = true;
    #   urls = [
    #     {
    #       title = "nixOS mobile";
    #       tags = [ "nixos" "nix" ];
    #       url = "https://mobile.nixos.org/index.xml";
    #     }
    #     {
    #       title = "r/NixOS";
    #       tags = [ "nixos" "nix" "reddit" ];
    #       url = "https://www.reddit.com/r/NixOS.rss";
    #     }
    #     {
    #       title = "NixOS weekly";
    #       tags = [ "nixos" "nix" ];
    #       url = "https://weekly.nixos.org/feeds/all.rss.xml";
    #     }
    #   ] ++ (map (x: {
    #     url = x;
    #     tags = [ "rss" ];
    #   }) (splitString (builtins.readFile ./newsboat/rss.txt)))

    #     ++ (map (x: {
    #       url = x;
    #       tags = [ "podcast" ];
    #     }) (splitString (builtins.readFile ./newsboat/podcast.txt)))

    #     ++ (map (x: {
    #       url = x;
    #       tags = [ "youtube" ];
    #     }) (splitString (builtins.readFile ./newsboat/youtube.txt)));
    # };

    git = {
      enable = true;
      # ignores TODO
      # extraConfig TODO
      signing = {
        key = "823A6154426408D3";
        signByDefault = true;
      };

      userEmail = "mail@pablo.tools";
      userName = "Pablo Ovelleiro Corral";
    };

    go = {
      enable = true;
      goPath = ".go";
      packages = {
        "golang.org/x/text" =
          builtins.fetchGit "https://go.googlesource.com/text";
        "golang.org/x/time" =
          builtins.fetchGit "https://go.googlesource.com/time";
      };
    };

    neomutt = {
      enable = true;
      # TODO
    };
  };

  services = {
    # grobi = {
    #   enable = true;
    #   # executeAfter = [ " " ];
    #   rules = [{
    #     name = "Kartoffel";
    #     outputs_connected = [ "DVI-D-0" "DVI-D-1" "HDMI-0" ];
    #     configure_row = [ "DVI-D-0" "HDMI-0" "DVI-D-1" ];
    #     primary = "HDMI-0";
    #     atomic = true;
    #     execute_after = [
    #   "${pkgs.xorg.xrandr}/bin/xrandr --output DVI-D-0 --mode 1440x900 --pos 0x0 --rotate right --output HDMI-0 --primary --mode 1920x1200 --pos 900x0 --rotate normal --output DP-0 --off --output DP-1 --off --output DVI-D-1 --mode 1280x1024 --pos 2820x0 --rotate normal"
    #       # "${pkgs.xmonad-with-packages}/bin/xmonad --restart";
    #     ];
    #   }];
    # };

    # random-background = {} TODO
    # spotifyd = {} TODO
    # syncthing = {} TODO
    # udiskie= {} TODO
    # xsuspender
  };

  # General stuff TODO
  # home.activation...
  # home.file...
  # home.keyboard...
  # home.language...
  # readline
  # accounts.email.accounts.<name>.gpg
  # Fontconfig
  # fonts.fontconfig.enable

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.03";
}
