{ config, pkgs, lib,  ... }:
let
  vars = import ./vars.nix;
in
{
    # Alacritty
    programs.alacritty = {
      enable = true;
      settings = {
        env.TERM = "xterm-256color";
        window = {
          dimensions = {
            lines = 20;
            columns = 110;
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

            background = "0x${vars.colors.base00}";
            foreground = "0x${vars.colors.base05}";
          };
          cursor = {
            text = "0x${vars.colors.base00}";
            cursor = "0x${vars.colors.base0D}";
          };
          normal = {
            black =   "0x${vars.colors.base00}";
            red =     "0x${vars.colors.base08}";
            green =   "0x${vars.colors.base0B}";
            yellow =  "0x${vars.colors.base0A}";
            blue =    "0x${vars.colors.base0D}";
            magenta = "0x${vars.colors.base0E}";
            cyan =    "0x${vars.colors.base0C}";
            white =   "0x${vars.colors.base05}";
          };

          bright = {
            black =   "0x${vars.colors.base03}";
            red =     "0x${vars.colors.base09}";
            green =   "0x${vars.colors.base01}";
            yellow =  "0x${vars.colors.base02}";
            blue =    "0x${vars.colors.base04}";
            magenta = "0x${vars.colors.base06}";
            cyan =    "0x${vars.colors.base0F}";
            white =   "0x${vars.colors.base07}";
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
