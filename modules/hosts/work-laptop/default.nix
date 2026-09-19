{
  config,
  lib,
  ...
}:
{
  flake =
    let
      inherit (config.flake.modules) homeManager nixos;
      hostName = "LP-0104";
      modules = with nixos; [
        default
        disk
        work-laptop
        work
      ];
      homeModules = with homeManager; [
        default
        work-laptop
        work
      ];
    in
    {
      nixosConfigurations.${hostName} = lib.nixosSystem { inherit modules; };
      modules.nixos.work-laptop =
        { config, ... }:
        {
          home-manager.users.${config.user.username}.imports = homeModules;
          networking = { inherit hostName; };
        };
    };
}
