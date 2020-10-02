{ config, pkgs, lib,  ... }:
let
  vars = import ./vars.nix;
in
{



      xsession.windowManager.i3 = {
        enable = true;

        package = pkgs.i3-gaps;
        config = {
          menu = "rofi";
          startup = [
            {
              command = "picom";
              always = false;
              notification = false;
            }

            {
              command = "nitrogen --restore";
              always = true;
              notification = false;
            }
            {
              command = "nm-applet";
              always = true;
              notification = false;
            }

          ];
          colors =
            {
              background = "#${vars.colors.base00}";
              focused = {
                background = "#${vars.colors.base0D}";
                border = "#${vars.colors.base0D}";
                childBorder = "#${vars.colors.base00}";
                indicator = "#${vars.colors.base0D}";
                text = "#${vars.colors.base00}";
              };

              focusedInactive = {
                background = "#${vars.colors.base03}";
                border = "#${vars.colors.base03}";
                childBorder = "#${vars.colors.base00}";
                indicator = "#${vars.colors.base00}";
                text = "#${vars.colors.base00}";
              };

              unfocused = {
                background = "#${vars.colors.base00}";
                border = "#${vars.colors.base03}";
                childBorder = "#${vars.colors.base00}";
                indicator = "#${vars.colors.base00}";
                text = "#${vars.colors.base0D}";
              };

              urgent = {
                background = "#${vars.colors.base08}";
                border = "#${vars.colors.base08}";
                childBorder = "#${vars.colors.base00}";
                indicator = "#${vars.colors.base08}";
                text = "#${vars.colors.base00}";
              };
            };

            floating = {

              border = 2;
            };

            focus = {
              followMouse = true;
              forceWrapping = true;
            };

            fonts = ["Source Code Pro Semibold 12px"];

            bars = [];

            gaps = {
              bottom = 5;
              horizontal = 5;
              inner = 5;
              left = 5;
              outer = 5;
              right = 5;
              top = 5;
              vertical = 5;
            # smartBorders = "no_gaps";
            # smartGaps = "on";
          };
          modifier = "Mod4";
          keybindings = let
            modifier = config.xsession.windowManager.i3.config.modifier;
          in lib.mkOptionDefault {

            "${modifier}+Shift+Escape" = "exec xkill";
            "${modifier}+p"            = "exec ${pkgs.rofi}/bin/rofi -show run -lines 7 -eh 1 -bw 0  -fullscreen -padding 200";
            "${modifier}+Shift+p"      = "exec ${pkgs.rofi-pass} -show combi -lines 7 -eh 3 -bw 0 -matching fuzzy";
            "${modifier}+Shift+x"      = "exec xscreensaver-command -lock";
            "${modifier}+Shift+Tab"    = "workspace prev";
            "${modifier}+Tab"          = "workspace next";
            "XF86AudioLowerVolume"     = "exec --no-startup-id pactl set-sink-volume 0 -5%"; #decrease sound volume
            "XF86AudioMute"            = "exec --no-startup-id pactl set-sink-mute 0 toggle"; # mute sound
            "XF86AudioNext"            = "exec playerctl next";
            "XF86AudioPlay"            = "exec playerctl play-pause";
            "XF86AudioPrev"            = "exec playerctl previous";
            "XF86AudioRaiseVolume"     = "exec --no-startup-id pactl set-sink-volume 0 +5% #increase sound volume";
            "XF86AudioStop"            = "exec playerctl stop";
            "XF86MonBrightnessDown"    = "exec xbacklight -dec 20"; # decrease screen brightness
            "XF86MonBrightnessUp"      = "exec xbacklight -inc 20"; # increase screen brightness
            "Print"                    = "exec import png:- | xclip -selection clipboard -t image/png";
          };

          terminal = "alacritty";

        # window = "TODO"
        workspaceLayout = "tabbed";


      };
    };


    services.xscreensaver = {
      enable = true;
      # settings = TODO
    };

    # # Xresources
    # xresources.extraConfig = builtins.readFile (
    #   pkgs.fetchFromGitHub {
    #     owner = "solarized";
    #     repo = "xresources";
    #     rev = "025ceddbddf55f2eb4ab40b05889148aab9699fc";
    #     sha256 = "0lxv37gmh38y9d3l8nbnsm1mskcv10g3i83j0kac0a2qmypv1k9f";
    #   } + "/Xresources.dark"
    #   );

    services.network-manager-applet.enable = true;

    # Pulseaudio tray
    services.pasystray.enable = true;

    # Picom X11 compositor
    services.picom = {
      enable = true;
      # activeOpacity = TODO
      # backend = TODO
      # TODO: other options
    };

    programs.rofi = {

      # General
      enable = true;
      package = pkgs.rofi.override{ plugins = [ pkgs.rofi-pass ]; };
      font = "${vars.font} 8";
      cycle = true;
      # extraConfig = "";

      # Geometry
      fullscreen = true;
      borderWidth = 0;
      lines = 3;
      padding= 400;
      rowHeight = 2;

      colors = {
        window = {
          background = "${vars.colors.base00}";
          # foreground = "${vars.colors.base00}";
          separator= "${vars.colors.base0D}";
          border= "${vars.colors.base00}";
        rows = {
          normal = {
            background = "${vars.colors.base00}";
            foreground = "${vars.colors.base05}";
            backgroundAlt = "${vars.colors.base00}";
            highlight = {
              background = "${vars.colors.base02}";
              foreground = "${vars.colors.base07}";
            };
          };
          active = {
            background = "${vars.colors.base00}";
            foreground = "${vars.colors.base0D}";
            backgroundAlt = "${vars.colors.base00}";
            highlight = {
              background = "${vars.colors.base00}";
              foreground = "${vars.colors.base0D}";
            };
          };
          urgent = {
            background = "${vars.colors.base00}";
            foreground = "${vars.colors.base08}";
            backgroundAlt = "${vars.colors.base00}";
            highlight = {
              background = "${vars.colors.base00}";
              foreground = "${vars.colors.base08}";
            };
          };
        };
      };
    };
  };

    # TODO ssh client config

    services.blueman-applet.enable = true;

      # TODO checkout
    # services.cbatticon = {
      # enable = true;
    # };

    services.dunst = {
      enable = true;
      # iconTheme
      # settings = {}
    };

    services.gnome-keyring = {
      enable = true;
    };


  }
