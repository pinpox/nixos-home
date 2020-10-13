{ config, pkgs, lib, ... }: {

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
      ls      = "${pkgs.exa}/bin/exa --group-directories-first";
      l       = "${pkgs.exa}/bin/exa -lbF --git --group-directories-first --icons";
      ll      = "${pkgs.exa}/bin/exa -lbGF --git --group-directories-first --icons";
      llm     =
        "${pkgs.exa}/bin/exa -lbGd --git --sort=modified --group-directories-first";
      la      =
        "${pkgs.exa}/bin/exa -lbhHigmuSa --time-style=long-iso --git --color-scale --group-directories-first";
      lx      =
        "${pkgs.exa}/bin/exa -lbhHigmuSa@ --time-style=long-iso --git --color-scale --group-directories-first";
      lt      = "${pkgs.exa}/bin/exa --tree --level=2 --group-directories-first";
      # Other
      cats    = "highlight -O ansi";
      cc      = "clang -Wall -Wextra -pedantic -std=c99 -Wshadow -Weverything";
      qr_gen  = "qrencode -t ansi -o-";
      top     = "${pkgs.htop}/bin/htop";
      weather = "curl -4 http://wttr.in/Koeln";
    };

    plugins = [
      {
        name = "zsh-abbrev-alias";
        file = "abbrev-alias.plugin.zsh";
        src = builtins.fetchGit {
          url = "https://github.com/momo-lab/zsh-abbrev-alias";
        };
      }
      {
        name = "zsh-async";
        file = "async.zsh";
        src =
          builtins.fetchGit { url = "https://github.com/mafredri/zsh-async"; };
      }
      {
        name = "pure";
        # file = ".plugin.zsh";
        src =
          builtins.fetchGit { url = "https://github.com/sindresorhus/pure"; };
      }
    ];
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

  # TODO maybe replace with zoxide
  programs.pazi = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    # TODO other optoins

  };

  programs.htop = {
    enable = true;
    treeView = true;
  };

  programs.jq.enable = true;

  # Bat
  programs.bat = {
    enable = true;
    config = {
      # TODO look up opionts
      theme = "TwoDark";
    };
    # themes = { TODO };
  };

}
