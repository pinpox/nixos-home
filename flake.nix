{
  description = "User configurations for pinpox";

  inputs.nur.url = "github:nix-community/NUR";
  inputs.dotfiles-awesome.url = "github:pinpox/dotfiles-awesome";

  outputs = { self, nixpkgs, dotfiles-awesome, nur }: {

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
