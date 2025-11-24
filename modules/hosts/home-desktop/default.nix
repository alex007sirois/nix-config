{
  config,
  lib,
  ...
}: {
  flake = let
    hostName = "home-desktop-asirois-nix";
  in {
    nixosConfigurations.${hostName} = lib.nixosSystem {modules = [config.flake.modules.nixos.home-desktop];};
    modules.nixos.home-desktop = {
      home-manager.users.alex.imports = with config.flake.modules.homeManager; [
        default
        home-desktop
        torrent
        gaming
      ];
      imports = with config.flake.modules.nixos; [
        default
        gaming
      ];

      networking = {inherit hostName;};
    };
  };
}
