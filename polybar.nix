{ config, pkgs, lib,  ... }:
{
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      i3GapsSupport = true;
      pulseSupport = true;
        # alsaSupport = true;
        # iwSupport = true;
        # githubSupport = true;
      };
      script = ''polybar primary &'';

      config = {
        "bar/primary" = {
          monitor = "\${env:MONITOR:Virtual-1}";
          bottom = true;

          width = "100%";
          height = 22;
          radius = 0;

          # background = ${colors.background};
          # foreground = ${colors.foreground};

          line-size = 0;
          border-size = 0;
          border-color = "#00000000";
          padding-left = 0;
          padding-right = 0;
          module-margin-left = 0;
          module-margin-right = 0;

          font-0 = "Source Code Pro Semibold:pixelsize=8";
          font-1 = "Font Awesome:pixelsize=8";
          font-2 = "Font Awesome 5:pixelsize=8";

          modules-left="i3";
          modules-center = "music";
          modules-right = "filesystem pulseaudio memory cpu date";
          # Disabled modules: eth  pkg

          tray-position = "right";
          tray-padding = 2;
          # tray-background = ${colors.color-4};
        };

        "module/filesystem" = {

          # format-mounted-prefix-foreground   = "${colors.prefix-color}";
          # format-unmounted-prefix-foreground = "${colors.prefix-color}";
          # format-mounted-background          = ${colors.color-8}
          # format-unmounted-background        = ${colors.color-8}
          # label-unmounted-foreground         = ${colors.foreground}

          interval                 = 25;
          mount-0                  = "/";
          type                     = "internal/fs";
          format-mounted-prefix    = " ";
          format-mounted-padding   = 2;
          format-unmounted-padding = 2;
          label-mounted            = "%percentage_used%% [%free%]";
          label-unmounted          = "%mountpoint% not mounted";
        };



        "module/i3" = {

          type                         = "internal/i3";
          format                       = "<label-state> <label-mode>";
          index-sort                   = true;
          wrapping-scroll              = false;

          # Only show workspaces on the same output as the bar
          pin-workspaces               = true;
          label-mode-padding           = 2;
          # label-mode-background        = ${colors.foreground};

          # focused                    = Active workspace on focused monitor
          label-focused                = "%name%";
          # label-focused-background   = ${colors.color-4};
          # label-focused-foreground   = ${colors.background};
          label-focused-padding        = 2;

          # unfocused                  = Inactive workspace on any monitor
          label-unfocused              = "%name%";
          label-unfocused-padding      = 2;
          # label-unfocused-background = ${colors.color-8};

          # visible                    = Active workspace on unfocused monitor
          label-visible                = "%name%";
          # label-visible-padding      = ${self.label-focused-padding}
          # label-visible-background   = ${colors.color-8};

          # urgent                     = Workspace with urgency hint set
          label-urgent                 = "%name%";
          # label-urgent-background      = ${colors.alert};
          label-urgent-padding         = 2;

        };

        "module/cpu" = {
          type = "internal/cpu";
          interval = 2;
          format-prefix = " ";
          # format-prefix-foreground = ${colors.prefix-color};
          # format-background = ${colors.color-8};
          label = "%percentage%%";
          format-padding = 2;
        };



        "module/memory" = {
          type = "internal/memory";
          interval = 2;
          format-prefix = " ";
          # format-prefix-foreground = ${colors.prefix-color}
          # format-background = ${colors.color-8}
          label = "%percentage_used%%";
          format-padding = 2;
        };

        "module/wlan" = {
          type = "internal/network";
          interface = "wlan0";
          interval = 3;

          format-connected-padding = 2;
          format-disconnected-padding = 2;

          format-connected = "<ramp-signal> <label-connected>";
          # format-connected-background = ${colors.color-8}
          label-connected = "%signal%% %essid%";

          format-disconnected = "";
          # ; format-disconnected = <label-disconnected>
          # ;label-disconnected = %ifname% disconnected
          # label-disconnected-foreground = ${colors.foreground}

          ramp-signal-0 = "";
          # ramp-signal-foreground = ${colors.prefix-color}
        };


#         "module/eth" = {
#           type = "internal/network";
#           interface = "enp0s8";
#           interval = 3;

#           format-connected-prefix = " ";
#           # format-connected-prefix-foreground = ${colors.foreground}
#           label-connected = "%local_ip%";
#           # format-connected-background = ${colors.color-8}

#           format-disconnected = "";
#           # ;format-disconnected = "<label-disconnected>";
#           # ;label-disconnected = "%ifname% disconnected";
#           # ;label-disconnected-foreground = ${colors.foreground}
#         };


        "module/date" = {

          # format-prefix-foreground = ${colors.background}
          # format-prefix-background = ${colors.color-4}
          # format-foreground = ${colors.background}
          # format-background = ${colors.color-4}

          type = "internal/date";
          interval = 5;

          date = "";
          date-alt = " %Y-%m-%d";

          time = "%H:%M";
          time-alt = "%H:%M:%S";

          format-prefix =" ";
          format-padding = 2;

          label = "%date% %time%";
        };

        "module/pulseaudio" = {
          type = "internal/pulseaudio";

# ; Sink to be used, if it exists (find using `pacmd list-sinks`, name field)
# ; If not, uses default sink
# sink = alsa_output.pci-0000_12_00.3.analog-stereo

# ; Use PA_VOLUME_UI_MAX (~153%) if true, or PA_VOLUME_NORM (100%) if false
# ; Default: true
use-ui-max = false;

# ; Interval for volume increase/decrease (in percent points)
# ; Default: 5
interval = 5;

# ; Available tags:
# ;   <label-volume> (default)
# ;   <ramp-volume>
# ;   <bar-volume>
format-volume = "<ramp-volume> <label-volume>";

# ; Available tags:
# ;   <label-muted> (default)
# ;   <ramp-volume>
# ;   <bar-volume>
format-muted = "<label-muted>";

# ; Available tokens:
# ;   %percentage% (default)
# ;   %decibels% (unreleased)
label-volume = "%percentage%%";

# ; Available tokens:
# ;   %percentage% (default)
# ;   %decibels% (unreleased)
# label-muted = "🔇";
label-muted = " 0%";
# label-muted-foreground = #666

# ; Only applies if <ramp-volume> is used
ramp-volume-0 =" ";
ramp-volume-1 =" ";
ramp-volume-2 =" ";

# ; Right and Middle click (unreleased)
click-right = "pavucontrol &";
# ; click-middle =
};


"module/music" = {
type = "custom/script";
interval = 2;

label = "%output:0:45:...%";
exec = "~/.config/polybar/mpris.sh";
click-left = "playerctl play-pause";
click-right = "playerctl next";
};

        # "module/volume" = {

        #   # ;format-volume-prefix = %ramp-volume%
        #   # format-muted-foreground = ${colors.foreground}
        #   # ramp-volume-foreground =  ${colors.prefix-color}
        #   # format-volume-background = ${colors.color-8}
        #   # format-muted-background = ${colors.color-8}
        #   # label-volume-foreground = ${root.foreground}

        #   type = "internal/volume";
        #   format-volume = "<ramp-volume> <label-volume>";
        #   format-volume-padding = 2;
        #   format-muted-padding = 2;
        #   label-volume = "%percentage%";
        #   label-muted = " 000";
        #   label-muted-foreground = "#66";
        #   ramp-volume-0 =" ";
        #   ramp-volume-1 =" ";
        #   ramp-volume-2 =" ";
        # };
      };
    };
  }
