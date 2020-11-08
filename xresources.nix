{ config, pkgs, lib, ... }:
let vars = import ./vars.nix;
in {
  # # Xresources
  # xresources.extraConfig = builtins.readFile (
  #   pkgs.fetchFromGitHub {
  #     owner = "solarized";
  #     repo = "xresources";
  #     rev = "025ceddbddf55f2eb4ab40b05889148aab9699fc";
  #     sha256 = "0lxv37gmh38y9d3l8nbnsm1mskcv10g3i83j0kac0a2qmypv1k9f";
  #   } + "/Xresources.dark"
  #   );
  xresources.properties = {
    "colors0" = "#${vars.colors.base00}";
    "colors1" = "#${vars.colors.base01}";
    "colors2" = "#${vars.colors.base02}";
    "colors3" = "#${vars.colors.base03}";
    "colors4" = "#${vars.colors.base04}";
    "colors5" = "#${vars.colors.base05}";
    "colors6" = "#${vars.colors.base06}";
    "colors7" = "#${vars.colors.base07}";
    "colors8" = "#${vars.colors.base08}";
    "colors9" = "#${vars.colors.base09}";
    "colors10" = "#${vars.colors.base0A}";
    "colors11" = "#${vars.colors.base0B}";
    "colors12" = "#${vars.colors.base0C}";
    "colors13" = "#${vars.colors.base0D}";
    "colors14" = "#${vars.colors.base0E}";
    "colors15" = "#${vars.colors.base0F}";
  };
}
