{
  config,
  inputs,
  ...
}:
{
  flake =
    let
      inherit (config.flake.modules) homeManager nixos;
      hostName = "pi-server";
      modules = with nixos; [
        automation
        disk
        home
        nix
        pi-server
        secrets
        terminal
        users
      ];
      homeModules = with homeManager; [
        home
        nix
        pi-server
        secrets
        terminal
        users
      ];
    in
    {
      nixosConfigurations.${hostName} = inputs.nixos-raspberrypi.lib.nixosSystemFull {
        specialArgs = { inherit inputs; };
        inherit modules;
      };
      modules.nixos.pi-server =
        { config, ... }:
        {
          home-manager.users.${config.user.username}.imports = homeModules;
          networking = { inherit hostName; };
        };
    };
}
