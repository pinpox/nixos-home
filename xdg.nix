{ config, pkgs, lib, ... }: {
  xdg = {
    enable = true;
    configFile = {
      # nvim = {
      #   source = ./dotfiles/vim;
      #   target = "nvim";
      #   recursive = true;
      #   # onChange = "nvim -c +PlugInstall +qall --headless";
      # };

      nvim_theme = {
        target = "nvim/colors/ansible-theme.vim";
        source = ./vim/vim-theme;
      };


      coc_settings = {
        target = "nvim/coc-settings.json";
        source = ./vim/coc-settings.json;
      };

      mpris = {
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
}
