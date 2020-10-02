  { config, pkgs, lib,  ... }:

 {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.packages = [
    pkgs.exa
    pkgs.htop
    pkgs.nitrogen
    pkgs.thunderbird
    pkgs.xorg.xrandr
    pkgs.arandr
    pkgs.spotify
    pkgs.vlc
  ];

  # Imports
  imports = [
    ./polybar.nix
    ./zsh.nix
    ./i3.nix
  ];

  # Various options that are specific for this machine/user.

    # Email
    accounts.email.accounts = {
      pablo_tools = {
        address = "mail@pablo.tools";
        realName = "Pablo Ovelleiro Corral";
        primary = true;
        gpg = {
          key = "D03B218CAE771F77D7F920D9823A6154426408D3";
          signByDefault = true;
        };
        mbsync.enable = false;
        msmtp.enable = false;
        notmuch.enable = false;

        folders = {
          # TODO
          drafts  = "";
        };

        signature = {
          text = ''
            Pablo Ovelleiro Corral

            Web:     https://pablo.tools
            XMPP:    pablo1@mailbox.org
            GPG-Key: https://pablo.tools/gpg-key
          '';
          showSignature = "append";
        };

        userName = "pablo1@mailbox.org";
        passwordCommand = "pass mailbox.org/pablo1@mailbox.org";
        imap = {
          host = "imap.mailbox.org";
        };
        smtp = {
          host = "smtp.mailbox.org";
          port = 465;
        };
      };
    };


    # accounts.email.accounts.<name>.gpg

    # Fontconfig
    # fonts.fontconfig.enable

    # GTK settings
    gtk = {
      enable = true;
      font = {
        # package = "Source Code Pro Semibold";
        name = "Source Code Pro Semibold";
      };
      gtk2 = {
        extraConfig = "gtk-can-change-accels = 1";
      };

      gtk3 = {
        extraConfig =  { gtk-cursor-blink = false; gtk-recent-files-limit = 20; };
        bookmarks = [ "file:///home/pinpox/Documents" ];
      };

      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus";
      };



    };

      # General stuff TODO
      # home.activation...
      # home.packages...
      # home.file...
      # home.keyboard...
      # home.language...
      # home.sessionVariables...
      manual.manpages.enable = true;


      # Autorandr
      # TODO

      # Bat
      programs.bat = {
        enable  = true;
        config = {
          # TODO look up opionts
          theme = "TwoDark";
        };
        # themes = { TODO };
      };

      # Broot TODO
      # programs.broot =

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

      programs.fzf = {
        enable = true;
        enableZshIntegration = true;
        # TODO more options
      };

      programs.dircolors = {
        enable = true;
        enableZshIntegration = true;
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
          "golang.org/x/text" = builtins.fetchGit "https://go.googlesource.com/text";
          "golang.org/x/time" = builtins.fetchGit "https://go.googlesource.com/time";
        };
      };

      # programs.gpg = {TODO}

      programs.htop = {
        enable = true;
        treeView = true;
      };

      programs.jq.enable = true;

      # programs.keychain = {
      #   enable = true;
      #   enableZshIntegration = true;
      #   enableXsessionIntegration = true;
      # };

      # programs.mcfly.

    # programs.mvp
    programs.neomutt = {
      enable =  true;
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

    programs.password-store = {
      enable = true;
      package = pkgs.pass.withExtensions (exts: [ exts.pass-otp ]);
      # settings = TODO
    };

    # TODO maybe replace with zoxide
    programs.pazi = {
      enable = true;
      enableZshIntegration = true;
    };

    # TODO look at starship and powerline-go themes for zsh

    # readline


    programs.rofi = {
      enable = true;
      # TODO
      # colors =
      # br
    };

    # TODO ssh client config


    programs.tmux = {
      enable = true;
      clock24 = true;
      # TODO other optoins

    };






    services.blueman-applet.enable = true;

      # TODO checkout
    # services.cbatticon = {
      # enable = true;
    # };

    services.dunst = {
      enable = true;
      # iconTheme
      # settings = {}
    };

    services.gnome-keyring = {
      enable = true;
    };

    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
    };

    #TODO check out
    # services.grobi

    services.network-manager-applet.enable = true;

    # Pulseaudio tray
    services.pasystray.enable = true;

    # Picom X11 compositor
    services.picom = {
      enable = true;
      # activeOpacity = TODO
      # backend = TODO
      # TODO: other options
    };



    # # TODO configure polybar


    # servieces.random-background = {} TODO
    # services.spotifyd = {} TODO
    # services.syncthing = {} TODO
    # services.udiskie= {} TODO

    services.xscreensaver = {
      enable = true;
      # settings = TODO
    };

    # services.xsuspender


    # XDG
    xdg = {
      enable = true;
      configFile = {
        nvim = {
          source = ./dotfiles/vim;
          target = "nvim";
          recursive = true;
          # onChange = "nvim -c +PlugInstall +qall --headless";
        };

        nvim_theme = {
          target = "nvim/colors/ansible-theme.vim";
          source  = ./dotfiles/vim-theme;
        };



    mpris  ={
      executable = true;
      text = ''
#!${pkgs.bash}/bin/bash

# pecifying the icon(s) in the script
# This allows us to change its appearance conditionally
icon=""

player_status=$(playerctl status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    metadata="$(playerctl metadata artist) - $(playerctl metadata title)"
fi

# Foreground color formatting tags are optional
if [[ $player_status = "Playing" ]]; then
    echo "%{F#D08770}$icon $metadata"       # Orange when playing
elif [[ $player_status = "Paused" ]]; then
    echo "%{F#65737E}$icon $metadata"       # Greyed out info when paused
else
    echo "%{F#65737E}$icon"                 # Greyed out icon when stopped
fi
      '';

      target = "polybar/mpris.sh";
    };



      };
    };


    # Xresources
    xresources.extraConfig = builtins.readFile (
      pkgs.fetchFromGitHub {
        owner = "solarized";
        repo = "xresources";
        rev = "025ceddbddf55f2eb4ab40b05889148aab9699fc";
        sha256 = "0lxv37gmh38y9d3l8nbnsm1mskcv10g3i83j0kac0a2qmypv1k9f";
      } + "/Xresources.dark"
      );


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
