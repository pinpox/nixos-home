{ config, pkgs, lib, ... }:
let vars = import ./vars.nix;
in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Allow "unfree" licenced packages
  nixpkgs.config = { allowUnfree = true; };

  # Include man-pages
  manual.manpages.enable = true;

  # Install these packages for my user
  home.packages = with pkgs; [
    lxappearance
    gimp
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
    ./polybar.nix
    ./browsers.nix
    ./credentials.nix
    ./xdg.nix
    ./games.nix
  ];

  programs.git = {
    enable = true;
    # ignores TODO
    # extraConfig TODO
    signing = {
      key = "823A6154426408D3";
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
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython = true;
    withPython3 = true;
    withRuby = true;

    configure = {
      customRC = lib.strings.concatStrings [

        # PLUGINS:
        (lib.strings.fileContents ./vim/plugins.vim)

        # GENERAL OPTIONS:
        (lib.strings.fileContents ./vim/general.vim)

        # FILE BROWSING:
        (lib.strings.fileContents ./vim/netrw.vim)

        # KEY MAPPINGS:
        (lib.strings.fileContents ./vim/mappings.vim)

        # APPEARANCE:
        (lib.strings.fileContents ./vim/style.vim)

        # LANGUAGESERVER:
        (lib.strings.fileContents ./vim/lsp.vim)

        # COC:
        (lib.strings.fileContents ./vim/coc_settings.vim)
      ];

      packages.myVimPackage = with pkgs.vimPlugins; {

        # loaded on launch

        # TODO Missing plugins
        # AndrewRadev/switch.vim'
        # fvictorio/vim-textobj-backticks'
        # jamessan/vim-gnupg', {'for': 'gpg'}   " Edit ggp-encrypted files
        # juliosueiras/vim-terraform-snippets'
        # lukas-reineke/indent-blankline.nvim'
        # nicwest/vim-camelsnek'
        # prabirshrestha/async.vim'
        # rafalbromirski/vim-aurora'
        # rhysd/committia.vim'                  " Better commit message editor
        # rrethy/vim-hexokinase'
        # stevearc/vim-arduino'
        # thinca/vim-textobj-between'           "Text objects for a range between a character
        # timakro/vim-searchant'                " Better highlighting of search

        start = [
          # vim-indent-guides
          # vimpreviewpandoc
          colorizer
          committia-vim
          BufOnly-vim
          ansible-vim
          base16-vim
          coc-nvim
          dracula-vim
          fzf-vim
          gotests-vim
          haskell-vim
          i3config-vim
          indentLine
          tabular
          vim-airline
          vim-airline-themes
          vim-autoformat
          vim-better-whitespace
          vim-commentary
          vim-devicons
          vim-easy-align
          vim-eunuch
          vim-gitgutter
          vim-go
          vim-grammarous
          vim-gutentags
          vim-illuminate
          vim-indent-object
          vim-markdown
          vim-nix
          vim-repeat
          vim-sandwich
          vim-snippets
          vim-table-mode
          vim-terraform
          vim-textobj-user
          vim-vinegar
          vim-visual-increment
          vim-which-key
          vista-vim
        ];
        # manually loadable by calling `:packadd $plugin-name`
        opt = [ ];
      };
    };

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
