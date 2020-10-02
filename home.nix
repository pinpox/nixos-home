{ config, pkgs, lib,  ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Allow "unfree" licenced packages
  nixpkgs.config.allowUnfree = true;

  # Include man-pages
  manual.manpages.enable = true;

  # Install these packages for my user
  home.packages = [
    pkgs.xfce.thunar
    pkgs.xfce.thunar-volman
    pkgs.xfce.thunar-archive-plugin
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
    ./shell.nix
    ./i3.nix
    ./polybar.nix
    ./browsers.nix
    ./credentials.nix
  ];
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

    #TODO check out
    # TODO look at starship and powerline-go themes for zsh
    # services.grobi
    # readline
    # services.random-background = {} TODO
    # services.spotifyd = {} TODO
    # services.syncthing = {} TODO
    # services.udiskie= {} TODO
    # services.xsuspender
    # programs.gpg = {TODO}
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
    # home.sessionVariables...
    # Autorandr
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
