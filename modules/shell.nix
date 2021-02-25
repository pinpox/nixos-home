{ config, pkgs, lib, ... }:
let vars = import ./vars.nix;
in {

  # robbyrussell/oh-my-zsh folder:lib/completion
  # zsh-users/zsh-completions

  # Prompt configuration
  home.file = {
    "p10k.zsh" = {
      source = ./p10k.zsh;
      target = ".config/zsh/p10k.zsh";
    };
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    autocd = true;
    dotDir = ".config/zsh";


    # sessionVariables = {
    #   # RPS1 = ""; # Disable the right side prompt that "walters" theme introduces
    #   ZDOTDIR = "$HOME/.config/zsh";
    # };


    history = {
      expireDuplicatesFirst = true;
      ignoreSpace = false;
      save = 15000;
      share = true;
    };

    initExtraBeforeCompInit = builtins.readFile ./zshrc;


    initExtra = builtins.readFile ./zshrc-extra;
    dirHashes = { docs = "$HOME/Documents"; };

    shellAliases = {

      # Exa ls replacement
      ls = "${pkgs.exa}/bin/exa --group-directories-first";
      l = "${pkgs.exa}/bin/exa -lbF --git --group-directories-first --icons";
      ll = "${pkgs.exa}/bin/exa -lbGF --git --group-directories-first --icons";
      llm =
        "${pkgs.exa}/bin/exa -lbGd --git --sort=modified --group-directories-first --icons";
      la =
        "${pkgs.exa}/bin/exa -lbhHigmuSa --time-style=long-iso --git --color-scale --group-directories-first --icons";
      lx =
        "${pkgs.exa}/bin/exa -lbhHigmuSa@ --time-style=long-iso --git --color-scale --group-directories-first --icons";
      lt =
        "${pkgs.exa}/bin/exa --tree --level=2 --group-directories-first --icons";

      # Pastebin (termbin.com)
      tb = "${pkgs.netcat-gnu}/bin/nc termbin.com 9999";
      tbc =
        "${pkgs.netcat-gnu}/bin/nc termbin.com 9999 | ${pkgs.xclip}/bin/xclip -selection c";

      # Gitignores

      git-ignore-create-go =
        "${pkgs.curl}/bin/curl 'https://www.toptal.com/developers/gitignore/api/vim,go,tags,ssh' > .gitignore";

      # Frequendly used folders
      cdn = "cd ~/Projects/pinpox-nixos";
      cdnh = "cd ~/.config/nixpkgs";

      # Other
      lsblk = "lsblk -o name,mountpoint,label,size,type,uuid";
      c = "${pkgs.bat}/bin/bat -n --decorations never";
      cc =
        "${pkgs.clang}/bin/clang -Wall -Wextra -pedantic -std=c99 -Wshadow -Weverything";
      qr_gen = "${pkgs.qrencode}/bin/qrencode -t ansi -o-";
      top = "${pkgs.htop}/bin/htop";
      weather = "${pkgs.curl}/bin/curl -4 http://wttr.in/Koeln";
      radio = "${pkgs.mpv}/bin/mpv http://lassul.us:8000/radio.ogg";
    };

    prezto = {
      enable = true;

      # Case insensitive completion
      caseSensitive = false;

      # Autoconvert .... to ../..
      editor.dotExpansion = true;

      # Prezto modules to load
      pmodules = [
        "utility"
        "completion"
        "environment"
        "terminal"
        "editor"
        "history"
        "directory"
        "syntax-highlighting"
        "history-substring-search"
        # "prompt"
      ];

      # prompt.theme = "powerlevel10k";
      terminal.autoTitle = true;
    };

    plugins = [
      {
        name = "powerlevel10k";
        file = "powerlevel10k.zsh-theme";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";
      }
      # TODO use flake inputs for this
      {
        name = "zsh-abbrev-alias";
        file = "abbrev-alias.plugin.zsh";
        src = builtins.fetchGit {
          # Updated 2020-12-31
          url = "https://github.com/momo-lab/zsh-abbrev-alias";
          rev = "2f3d218f426aff21ac888217b0284a3a1470e274";
        };
      }
      {
        name = "zsh-async";
        file = "async.zsh";
        src = builtins.fetchGit {
          url = "https://github.com/mafredri/zsh-async";
          rev = "bbbc92bd01592513a6b7739a45b7911af18acaef";
        };
      }
      {
        name = "zsh-colored-man-pages";
        file = "colored-man-pages.plugin.zsh";
        src = builtins.fetchGit {
          url = "https://github.com/ael-code/zsh-colored-man-pages";
          rev = "57bdda68e52a09075352b18fa3ca21abd31df4cb";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        file = "zsh-syntax-highlighting.zsh";
        src = builtins.fetchGit {
          url = "https://github.com/zsh-users/zsh-syntax-highlighting/";
          rev = "932e29a0c75411cb618f02995b66c0a4a25699bc";
        };
      }
    ];
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--height 40%"
      "--layout=reverse"
      "--border"
      "--inline-info"
      "--color 'fg:#${vars.colors.base05}'" # Text
      "--color 'bg:#${vars.colors.base00}'" # Background
      "--color 'preview-fg:#${vars.colors.base05}'" # Preview window text
      "--color 'preview-bg:#${vars.colors.base00}'" # Preview window background
      "--color 'hl:#${vars.colors.base0A}'" # Highlighted substrings
      "--color 'fg+:#${vars.colors.base0D}'" # Text (current line)
      "--color 'bg+:#${vars.colors.base02}'" # Background (current line)
      "--color 'gutter:#${vars.colors.base02}'" # Gutter on the left (defaults to bg+)
      "--color 'hl+:#${vars.colors.base0E}'" # Highlighted substrings (current line)
      "--color 'info:#${vars.colors.base0E}'" # Info line (match counters)
      "--color 'border:#${vars.colors.base0D}'" # Border around the window (--border and --preview)
      "--color 'prompt:#${vars.colors.base05}'" # Prompt
      "--color 'pointer:#${vars.colors.base0E}'" # Pointer to the current line
      "--color 'marker:#${vars.colors.base0E}'" # Multi-select marker
      "--color 'spinner:#${vars.colors.base0E}'" # Streaming input indicator
      "--color 'header:#${vars.colors.base05}'" # Header
    ];
  };

  programs.dircolors = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.pazi = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    prefix = "C-a";
  };

  programs.htop = {
    enable = true;
    treeView = true;
  };

  programs.jq.enable = true;

  programs.bat = {
    enable = true;
    # This should pick up the correct colors for the generated theme. Otherwise
    # it is possible to generate a custom bat theme to ~/.config/bat/config
    config = { theme = "base16"; };
  };
}
