{
  flake.modules = {
    nixos.home = {config, ...}: let
      inherit (config.user) username email name;
    in {
      # TODO add nixos module to propagate configs dynamically
      home-manager.users.${username} = {
        user = {inherit username email name;};
      };
    };
  };
}
