{
  config,
  lib,
  ...
}:
{
  flake =
    let
      inherit (config.flake.modules) homeManager nixos;
      hostName = "pi-server";
      modules = with nixos; [
        automation
        pi-server
        desktop
        home
        nix
        secrets
        style
        terminal
        users
        virtualisation
      ];
      homeModules = with homeManager; [
        home
        locale
        nix
        secrets
        style
        system
        terminal
        pi-server
        users
      ];
    in
    {
      nixosConfigurations.${hostName} = lib.nixosSystem { inherit modules; };
      modules.nixos.pi-server =
        { config, ... }:
        {
          home-manager.users.${config.user.username}.imports = homeModules;
          networking = { inherit hostName; };
        };
    };
}
