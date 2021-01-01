{
  description = "User configurations for pinpox";

  inputs = {
    nur.url = "github:nix-community/NUR";
    awesome-config.url = "github:pinpox/dotfiles-awesome";
    awesome-config.flake = false;
    wallpaper-generator.url = "github:pinpox/wallpaper-generator";
    wallpaper-generator.flake = false;
  };

  outputs = { self, nixpkgs, nur, wallpaper-generator, awesome-config }: {

    nixosModules = {

      # Desktop configuration, includes GUI
      desktop = {
        imports = [ ./home.nix { nixpkgs.overlays = [ nur.overlay ]; } ];
      };

      # Serevr user configuration, only CLI
      server = { imports = [ ./home-server.nix ]; };
    };
  };
}
