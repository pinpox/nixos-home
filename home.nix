{ config, pkgs, lib, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Allow "unfree" licenced packages
  nixpkgs.config = { allowUnfree = true; };

  # Include man-pages
  manual.manpages.enable = true;

  # Install these packages for my user
  home.packages = with pkgs; [
    lxappearance
    xclip
    signal-desktop
    playerctl
    imagemagick
    papirus-icon-theme
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
    vlc
    libnotify
    xfce.xfce4-volumed-pulse
    pavucontrol
    retroarch
    # nerdfonts
    # material-design-icons
    # material-icons
  ];

  # Imports
  imports = [
    ./shell.nix
    ./alacritty.nix
    ./i3.nix
    ./polybar.nix
    ./browsers.nix
    ./credentials.nix
    ./xdg.nix
    ./games.nix
  ];
  # GTK settings
  gtk = {
    enable = true;
    font = {
      # package = "Source Code Pro Semibold";
      name = "Source Code Pro Semibold";
    };
    gtk2 = { extraConfig = "gtk-can-change-accels = 1"; };

    gtk3 = {
      extraConfig = {
        gtk-cursor-blink = false;
        gtk-recent-files-limit = 20;
      };
      bookmarks = [
        "file:///home/pinpox/Documents"
        "file:///home/pinpox/Downloads"
        "file:///home/pinpox/Pictures"
        "file:///home/pinpox/Music"
        "file:///home/pinpox/Videos"
        "file:///home/pinpox/Seafile"
      ];
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
  };

  programs.git = {
    enable = true;
    # ignores TODO
    # extraConfig TODO
    signing = {
      key = "TODO";
      signByDefault = true;
    };

    userEmail = "git@pablo.tools";
    userName = "Pablo Ovelleiro Corral";
  };

  programs.go = {
    enable = true;
    goPath = ".go";
    packages = {
      "golang.org/x/text" =
        builtins.fetchGit "https://go.googlesource.com/text";
      "golang.org/x/time" =
        builtins.fetchGit "https://go.googlesource.com/time";
    };
  };

  programs.neomutt = {
    enable = true;
    # TODO
  };

  programs.neovim = {
    enable = true;
    # TODO
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython = true;
    withPython3 = true;
    withRuby = true;
  };

  #TODO check out
  # TODO look at starship and powerline-go themes for zsh
  # services.grobi
  # readline
  # services.random-background = {} TODO
  # services.spotifyd = {} TODO
  # services.syncthing = {} TODO
  # services.udiskie= {} TODO
  # services.xsuspender
  # programs.keychain = {
  #   enable = true;
  #   enableZshIntegration = true;
  #   enableXsessionIntegration = true;
  # };
  # programs.mcfly.
  # programs.mvp
  # General stuff TODO
  # home.activation...
  # home.packages...
  # home.file...
  # home.keyboard...
  # home.language...
  home.sessionVariables = { LIBGL_ALWAYS_SOFTWARE = "1"; };

  programs.newsboat = {
    enable = true;
    autoReload = true;
    urls = [
      {
        title = "nixOS mobile";
        tags = [ "nixos" "nix" ];
        url = "https://mobile.nixos.org/index.xml";
      }
      {
        title = "r/NixOS";
        tags = [ "nixos" "nix" "reddit" ];
        url = "https://www.reddit.com/r/NixOS.rss";
      }
    ];
  };

  # Autorandr
  programs.autorandr = {
    enable = true;
    hooks = {
      postswitch = {
        "notify-i3" = "${pkgs.i3}/bin/i3-msg restart";
        "restart-polybar" = "systemctl --user restart polybar.service";
        # "change-background" = readFile ./change-background.sh;
        # "change-dpi" = ''
        #   case "$AUTORANDR_CURRENT_PROFILE" in
        #     default)
        #       DPI=120
        #       ;;
        #     home)
        #       DPI=192
        #       ;;
        #     work)
        #       DPI=144
        #       ;;
        #     *)
        #       echo "Unknown profle: $AUTORANDR_CURRENT_PROFILE"
        #       exit 1
        #   esac

        #   echo "Xft.dpi: $DPI" | ${pkgs.xorg.xrdb}/bin/xrdb -merge
        # '';
      };
    };
    profiles = {
      "VM" = {
        fingerprint = {
          # Currently matches everything, because VM has no EDID
          Virtual1 = "*";
        };
        config = {
          Virtual1 = {
            enable = true;
            crtc = 0;
            primary = true;
            position = "0x0";
            mode = "1680x1050";
            # gamma = "1.0:0.909:0.833";
            rate = "60.00";
            # rotate = "left";
          };
        };
        # hooks.postswitch = buildins.readFile ./work-postswitch.sh;
      };
    };
  };

  # TODO
  # Broot TODO
  # programs.broot =
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
