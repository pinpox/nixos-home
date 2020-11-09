{ config, pkgs, lib, ... }: {
  programs = {
    git = {
      enable = true;
      # ignores TODO
      # extraConfig TODO
      signing = {
        key = "823A6154426408D3";
        signByDefault = true;
      };

      userEmail = "mail@pablo.tools";
      userName = "Pablo Ovelleiro Corral";
    };
  };
}
