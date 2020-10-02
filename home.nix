{ config, pkgs, lib,  ... }:

let
  colors = {

    scheme = "Snazzy";
    author = "Chawye Hsu";
    base00 = "282a36"; #282a36
    base01 = "34353e"; #34353e
    base02 = "43454f"; #43454f
    base03 = "78787e"; #78787e
    base04 = "a5a5a9"; #a5a5a9
    base05 = "e2e4e5"; #e2e4e5
    base06 = "eff0eb"; #eff0eb
    base07 = "f1f1f0"; #f1f1f0
    base08 = "ff5c57"; #ff5c57
    base09 = "ff9f43"; #ff9f43
    base0A = "f3f99d"; #f3f99d
    base0B = "5af78e"; #5af78e
    base0C = "9aedfe"; #9aedfe
    base0D = "57c7ff"; #57c7ff
    base0E = "ff6ac1"; #ff6ac1
    base0F = "b2643c"; #b2643c
  };

  font = "Source Code Pro Semibold";

in {
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
  imports = [ ./polybar.nix ];

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


# # From Oh-my-ZSH
# robbyrussell/oh-my-zsh folder:lib/completion

# # From Prezto
# sorin-ionescu/prezto
# sorin-ionescu/prezto folder:modules/utility
# sorin-ionescu/prezto folder:modules/completion
# sorin-ionescu/prezto folder:modules/environment
# sorin-ionescu/prezto folder:modules/terminal
# sorin-ionescu/prezto folder:modules/editor
# sorin-ionescu/prezto folder:modules/history
# sorin-ionescu/prezto folder:modules/directory
# sorin-ionescu/prezto folder:modules/syntax-highlighting
# sorin-ionescu/prezto folder:modules/zsh-history-substring-search

# sindresorhus/pure
# ael-code/zsh-colored-man-pages

# momo-lab/zsh-abbrev-alias
# zsh-users/zsh-completions
# zsh-users/zsh-syntax-highlighting
# mafredri/zsh-async
# rupa/z


programs.zsh = {
  enable = true;
  enableAutosuggestions = true;
  enableCompletion = true;
  autocd = true;
  dotDir = ".config/zsh";
  sessionVariables = {
    RPS1 = ""; # Disable the right side prompt that "walters" theme introduces
    PURE_PROMPT_SYMBOL = "▸";
  };

  history = {
    expireDuplicatesFirst = true;
    ignoreSpace = false;
    save = 15000;
    share = true;
  };
  initExtra = ''
      abbrev-alias m="neomutt"
      abbrev-alias o="xdg-open"
      abbrev-alias q="exit"
      abbrev-alias snvim="sudo -E nvim"
      abbrev-alias v="nvim"

      # Global aliases, get expaned everywhere
      abbrev-alias -g G="| grep -i"
      abbrev-alias -g P="| ix"
  '';

  shellAliases = {
      # Exa ls replacement
      ls      = "exa --group-directories-first";
      l       = "exa -lbF --git --group-directories-first";
      ll      = "exa -lbGF --git --group-directories-first";
      llm     = "exa -lbGd --git --sort=modified --group-directories-first";
      la      = "exa -lbhHigmuSa --time-style=long-iso --git --color-scale --group-directories-first";
      lx      = "exa -lbhHigmuSa@ --time-style=long-iso --git --color-scale --group-directories-first";
      lt      = "exa --tree --level=2 --group-directories-first";
      # Other
      cats    = "highlight -O ansi";
      cc      = "clang -Wall -Wextra -pedantic -std=c99 -Wshadow -Weverything";
      qr_gen  = "qrencode -t ansi -o-";
      top     = "htop";
      weather = "curl -4 http://wttr.in/Koeln";
    };


    plugins = [
      {
        name = "zsh-abbrev-alias";
        file = "abbrev-alias.plugin.zsh";
        src = builtins.fetchGit { url = https://github.com/momo-lab/zsh-abbrev-alias; };
      }
      {
        name = "zsh-async";
        file = "async.zsh";
        src = builtins.fetchGit { url = https://github.com/mafredri/zsh-async; };
      }
      {
        name = "pure";
      # file = ".plugin.zsh";
      src = builtins.fetchGit { url = https://github.com/sindresorhus/pure; };
    }
  ];
};







    # Alacritty
    programs.alacritty = {
      enable = true;
      settings = {
        env.TERM = "xterm-256color";
        window = {
          dimensions = {
            lines = 3;
            columns = 200;
          };

          padding = {
            lines = 3;
            columns = 200;
          };
        };

        scrolling.history = 10000;
        font = {
          normal = {
            family =  "Source Code Pro Semibold";
          };
          bold= {
            family =  "Source Code Pro Semibold";
            style =  "bold";
          };

          italic= {
            family =  "Source Code Pro Semibold";
            style  = "italic";
          };
          size =  10;
        };

        colors = {
          primary = {

            background = "0x${colors.base00}";
            foreground = "0x${colors.base05}";
          };
          cursor = {
            text = "0x${colors.base00}";
            cursor = "0x${colors.base0D}";
          };
          normal = {
            black =   "0x${colors.base00}";
            red =     "0x${colors.base08}";
            green =   "0x${colors.base0B}";
            yellow =  "0x${colors.base0A}";
            blue =    "0x${colors.base0D}";
            magenta = "0x${colors.base0E}";
            cyan =    "0x${colors.base0C}";
            white =   "0x${colors.base05}";
          };

          bright = {
            black =   "0x${colors.base03}";
            red =     "0x${colors.base09}";
            green =   "0x${colors.base01}";
            yellow =  "0x${colors.base02}";
            blue =    "0x${colors.base04}";
            magenta = "0x${colors.base06}";
            cyan =    "0x${colors.base0F}";
            white =   "0x${colors.base07}";
          };

          # indexed_colors = { TODO };
        };

        key_bindings = [
          {
            key = "K";
            mods = "Control";
            chars = "\\x0c";
          }
        ];
      };
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

      xsession.windowManager.i3 = {
        enable = true;

        package = pkgs.i3-gaps;
        config = {
          menu = "rofi";
          startup = [
            {
              command = "picom";
              always = false;
              notification = false;
            }

            {
              command = "nitrogen --restore";
              always = true;
              notification = false;
            }
            {
              command = "nm-applet";
              always = true;
              notification = false;
            }

          ];
          colors =
            {
              background = "#${colors.base00}";
              focused = {
                background = "#${colors.base0D}";
                border = "#${colors.base0D}";
                childBorder = "#${colors.base00}";
                indicator = "#${colors.base0D}";
                text = "#${colors.base00}";
              };

              focusedInactive = {
                background = "#${colors.base03}";
                border = "#${colors.base03}";
                childBorder = "#${colors.base00}";
                indicator = "#${colors.base00}";
                text = "#${colors.base00}";
              };

              unfocused = {
                background = "#${colors.base00}";
                border = "#${colors.base03}";
                childBorder = "#${colors.base00}";
                indicator = "#${colors.base00}";
                text = "#${colors.base0D}";
              };

              urgent = {
                background = "#${colors.base08}";
                border = "#${colors.base08}";
                childBorder = "#${colors.base00}";
                indicator = "#${colors.base08}";
                text = "#${colors.base00}";
              };
            };

            floating = {

              border = 2;
            };

            focus = {
              followMouse = true;
              forceWrapping = true;
            };

            fonts = ["Source Code Pro Semibold 12px"];

            bars = [];

            gaps = {
              bottom = 5;
              horizontal = 5;
              inner = 5;
              left = 5;
              outer = 5;
              right = 5;
              top = 5;
              vertical = 5;
            # smartBorders = "no_gaps";
            # smartGaps = "on";
          };
          modifier = "Mod4";
          keybindings = let
            modifier = config.xsession.windowManager.i3.config.modifier;
          in lib.mkOptionDefault {

            "${modifier}+Shift+Escape" = "exec xkill";
            "${modifier}+p"            = "exec ${pkgs.rofi}/bin/rofi -show run -lines 7 -eh 1 -bw 0  -fullscreen -padding 200";
            "${modifier}+Shift+p"      = "exec ${pkgs.rofi-pass} -show combi -lines 7 -eh 3 -bw 0 -matching fuzzy";
            "${modifier}+Shift+x"      = "exec xscreensaver-command -lock";
            "${modifier}+Shift+Tab"    = "workspace prev";
            "${modifier}+Tab"          = "workspace next";
            "XF86AudioLowerVolume"     = "exec --no-startup-id pactl set-sink-volume 0 -5%"; #decrease sound volume
            "XF86AudioMute"            = "exec --no-startup-id pactl set-sink-mute 0 toggle"; # mute sound
            "XF86AudioNext"            = "exec playerctl next";
            "XF86AudioPlay"            = "exec playerctl play-pause";
            "XF86AudioPrev"            = "exec playerctl previous";
            "XF86AudioRaiseVolume"     = "exec --no-startup-id pactl set-sink-volume 0 +5% #increase sound volume";
            "XF86AudioStop"            = "exec playerctl stop";
            "XF86MonBrightnessDown"    = "exec xbacklight -dec 20"; # decrease screen brightness
            "XF86MonBrightnessUp"      = "exec xbacklight -inc 20"; # increase screen brightness
            "Print"                    = "exec import png:- | xclip -selection clipboard -t image/png";
          };

          terminal = "alacritty";

        # window = "TODO"
        workspaceLayout = "tabbed";


      };
    };




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
