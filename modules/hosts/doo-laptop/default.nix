{
  config,
  lib,
  ...
}: {
  flake = let
    inherit (config.flake.modules) homeManager nixos;
    hostName = "laptop-doo-asirois-nix";
    modules = with nixos; [
      default
      doo-laptop
      work
    ];
    homeModules = with homeManager; [
      default
      doo-laptop
      work
    ];
  in {
    nixosConfigurations.${hostName} = lib.nixosSystem {inherit modules;};
    modules.nixos.doo-laptop = {config, ...}: {
      home-manager.users.${config.user.username}.imports = homeModules;
      networking = {inherit hostName;};
    };
  };
}
