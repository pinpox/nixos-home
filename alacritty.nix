{ config, pkgs, lib,  ... }:
let
  vars = import ./vars.nix;
in
{
    # Alacritty
    programs.alacritty = {
      enable = true;
      settings = {

        scrolling.history = 10000;
        env.TERM = "xterm-256color";

        window = {
          dimensions = {
            lines = 20;
            columns = 80;
          };
          padding = {
            x = 3;
            y = 3;
          };
        };

 # SauceCodePro Nerd Font Mono:style=Black Italic,Italic
 # SauceCodePro Nerd Font Mono:style=Black,Regular
 # SauceCodePro Nerd Font Mono:style=Bold
 # SauceCodePro Nerd Font Mono:style=Bold Italic
 # SauceCodePro Nerd Font Mono:style=ExtraLight Italic,Italic
 # SauceCodePro Nerd Font Mono:style=ExtraLight,Regular
 # SauceCodePro Nerd Font Mono:style=Italic
 # SauceCodePro Nerd Font Mono:style=Light Italic,Italic
 # SauceCodePro Nerd Font Mono:style=Light,Regular
 # SauceCodePro Nerd Font Mono:style=Medium Italic,Italic
 # SauceCodePro Nerd Font Mono:style=Medium,Regular
 # SauceCodePro Nerd Font Mono:style=Regular
 # SauceCodePro Nerd Font Mono:style=Semibold Italic,Italic
 # SauceCodePro Nerd Font Mono:style=Semibold,Regular
 # SauceCodePro Nerd Font:style=Black Italic,Italic
 # SauceCodePro Nerd Font:style=Black,Regular
 # SauceCodePro Nerd Font:style=Bold
 # SauceCodePro Nerd Font:style=Bold Italic
 # SauceCodePro Nerd Font:style=ExtraLight Italic,Italic
 # SauceCodePro Nerd Font:style=ExtraLight,Regular
 # SauceCodePro Nerd Font:style=Italic
 # SauceCodePro Nerd Font:style=Light Italic,Italic
 # SauceCodePro Nerd Font:style=Light,Regular
 # SauceCodePro Nerd Font:style=Medium Italic,Italic
 # SauceCodePro Nerd Font:style=Medium,Regular
 # SauceCodePro Nerd Font:style=Regular
 # SauceCodePro Nerd Font:style=Semibold Italic,Italic
 # SauceCodePro Nerd Font:style=Semibold,Regular

        font = {
          normal = {
            family = "SauceCodePro Nerd Font";
            style = "Semibold";
          };
          bold= {
            family = "SauceCodePro Nerd Font";
            style  = "Bold";
          };
          italic= {
            family = "SauceCodePro Nerd Font";
            style  = "Semibold Italic";
          };
          size =  10;
        };

        colors = {
          primary = {
            background = "0x${vars.colors.base00}";
            foreground = "0x${vars.colors.base05}";
          };
          cursor = {
            text       = "0x${vars.colors.base00}";
            cursor     = "0x${vars.colors.base0D}";
          };
          normal = {
            black      = "0x${vars.colors.base00}";
            red        = "0x${vars.colors.base08}";
            green      = "0x${vars.colors.base0B}";
            yellow     = "0x${vars.colors.base0A}";
            blue       = "0x${vars.colors.base0D}";
            magenta    = "0x${vars.colors.base0E}";
            cyan       = "0x${vars.colors.base0C}";
            white      = "0x${vars.colors.base05}";
          };
          bright = {
            black      = "0x${vars.colors.base03}";
            red        = "0x${vars.colors.base09}";
            green      = "0x${vars.colors.base01}";
            yellow     = "0x${vars.colors.base02}";
            blue       = "0x${vars.colors.base04}";
            magenta    = "0x${vars.colors.base06}";
            cyan       = "0x${vars.colors.base0F}";
            white      = "0x${vars.colors.base07}";
          };
        };

        key_bindings = [
          # Clear terminal
          {
            key = "K";
            mods = "Control";
            chars = "\\x0c";
          }
        ];
      };
    };
  }
