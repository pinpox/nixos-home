{ config, pkgs, lib, ... }:
let vars = import ./vars.nix;
in {

  # home.file = {
  #   "${config.xdg.configHome}/nvim/parser/c.so".source =
  #     "${pkgs.tree-sitter.builtGrammars.c}/parser";

  #   "${config.xdg.configHome}/nvim/parser/go.so".source =
  #     "${pkgs.tree-sitter.builtGrammars.go}/parser";
  # };

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
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

        # loaded on launch
        start = [
          # vim-indent-guides
          # vimpreviewpandoc
          nvim-compe
          nvim-treesitter
          colorizer
          committia-vim
          BufOnly-vim
          ansible-vim
          base16-vim
          coc-nvim
          coc-lua
          dracula-vim
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
          #vista-vim
        ];
        # manually loadable by calling `:packadd $plugin-name`
        opt = [ ];
      };
    };

  };
}
