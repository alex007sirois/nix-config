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
        home
        nix
        pi-server
        secrets
        terminal
        users
      ];
      homeModules = with homeManager; [
        home
        pi-server
        secrets
        terminal
        users
      ];
    in
    {
      nixosConfigurations.${hostName} = inputs.nixos-raspberrypi.lib.nixosInstaller {
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
