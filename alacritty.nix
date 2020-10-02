{ config, pkgs, lib,  ... }:
{
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
  }
