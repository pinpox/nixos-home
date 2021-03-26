{ config, pkgs, lib, ... }:
let vars = import ./vars.nix;
in {

  # home.file = {
  #   "${config.xdg.configHome}/nvim/parser/c.so".source =
  #     "${pkgs.tree-sitter.builtGrammars.c}/parser";

  #   "${config.xdg.configHome}/nvim/parser/go.so".source =
  #     "${pkgs.tree-sitter.builtGrammars.go}/parser";
  # };


  home.packages = with pkgs; [
    nodePackages.pyright
    nodePackages.yaml-language-server
    nodePackages.vscode-json-languageserver-bin
    gopls
    terraform-ls
    terraform # TODO add options to enable/disable large packages like terraform
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython = true;
    withPython3 = true;
    withRuby = true;

    extraConfig = lib.strings.concatStrings [

      # PLUGINS:
      (lib.strings.fileContents ./vimscript/plugins.vim)

      # GENERAL OPTIONS:
      (lib.strings.fileContents ./vimscript/general.vim)

      # FILE BROWSING:
      (lib.strings.fileContents ./vimscript/netrw.vim)

      # KEY MAPPINGS:
      (lib.strings.fileContents ./vimscript/mappings.vim)

      # APPEARANCE:
      (lib.strings.fileContents ./vimscript/style.vim)

      # TODO
      # https://github.com/windwp/nvim-autopairs

      ''



        lua << EOF
        ${lib.strings.fileContents ./lua/init.lua}
        EOF

        ${lib.strings.fileContents ./vimscript/lsp-config.vim}
      ''

      # COC:
      # (lib.strings.fileContents ./vim/coc_settings.vim)
    ];

    # loaded on launch
    plugins = with pkgs.vimPlugins; [
      vim-nix
      # vim-indent-guides
      # vimpreviewpandoc
      nvim-compe
      nvim-lspconfig
      # nvim-treesitter
      colorizer
      committia-vim
      BufOnly-vim
      ansible-vim
      base16-vim
      # coc-nvim
      # coc-lua
      # dracula-vim
      fzf-vim
      vista-vim
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
      vim-repeat
      vim-sandwich
      vim-snippets
      vim-table-mode
      vim-terraform
      vim-textobj-user
      vim-vinegar
      vim-visual-increment
      vim-which-key
      #vista-vim
    ];
  };
}

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
