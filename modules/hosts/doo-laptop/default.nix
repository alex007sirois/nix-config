{
  config,
  lib,
  ...
}: {
  flake = let
    hostName = "laptop-doo-asirois-nix";
  in {
    nixosConfigurations.${hostName} = lib.nixosSystem {modules = [config.flake.modules.nixos.doo-laptop];};
    modules.nixos.doo-laptop = {
      home-manager.users.alex.imports = with config.flake.modules.homeManager; [
        default
        doo-laptop
        work
      ];
      imports = with config.flake.modules.nixos; [
        default
        work
      ];

      networking = {inherit hostName;};
    };
  };
}
