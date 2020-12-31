{
  description = "User configurations for pinpox";

  inputs.nur.url = "github:nix-community/NUR";

  outputs = { self, nixpkgs, nur }: {

    nixosModules = {

      # Desktop configuration, includes GUI
      desktop = { imports = [ ./home.nix ]; };

      # Serevr user configuration, only CLI
      server = { imports = [ ./home-server.nix ]; };
    };
  };
}
