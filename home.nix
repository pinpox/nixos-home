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
    # ./grobi.nix
    # ./xresources.nix
    ./alacritty.nix
    ./browsers.nix
    ./credentials.nix
    ./dunst.nix
    ./games.nix
    ./git.nix
    ./go.nix
    ./gtk.nix
    ./i3.nix
    ./neomutt.nix
    ./newsboat.nix
    ./picom.nix
    ./polybar.nix
    ./rofi.nix
    ./shell.nix
    ./vim.nix
    ./xdg.nix
  ];

  # Include man-pages
  manual.manpages.enable = true;

  # Environment variables
  home.sessionVariables = { LIBGL_ALWAYS_SOFTWARE = "1"; };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # TODO programs.mvp
  # TODO ssh client config

  services = {
    network-manager-applet.enable = true;
    blueman-applet.enable = true;
    gnome-keyring = { enable = true; };

    xscreensaver = {
      enable = true;
      # settings = TODO
    };

    # TODO check out these services
    # Pulseaudio tray
    # pasystray.enable = true;
    # random-background = {}
    # spotifyd = {}
    # syncthing = {}
    # udiskie= {}
    # xsuspender
    # cbatticon = {
    # enable = true;
    # };
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
