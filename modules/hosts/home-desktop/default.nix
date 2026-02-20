{
  config,
  lib,
  ...
}:
{
  flake =
    let
      inherit (config.flake.modules) homeManager nixos;
      hostName = "home-desktop-asirois-nix";
      modules = with nixos; [
        automation
        default
        disk
        home-desktop
        gaming
      ];
      homeModules = with homeManager; [
        default
        gaming
        home-desktop
        torrent
      ];
    in
    {
      nixosConfigurations.${hostName} = lib.nixosSystem { inherit modules; };
      modules.nixos.home-desktop =
        { config, ... }:
        {
          home-manager.users.${config.user.username}.imports = homeModules;
          networking = { inherit hostName; };
        };
    };
}
