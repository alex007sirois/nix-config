{
  flake.modules = {
    homeManager.users = {config, ...}: let
      inherit (config.user) username;
    in {
      home = {
        inherit username;
        homeDirectory = "/home/${username}";
      };
    };
    nixos.users = {config, ...}: let
      inherit (config.user) username email name groups;
    in {
      user.groups = [
        "dialout"
        "wheel"
      ];
      users.users.${username} = {
        hashedPasswordFile = config.age.secrets.linux-password.path;
        isNormalUser = true;
        description = name;
        extraGroups = groups;
      };
      home-manager.users.${username}.user = {inherit username email name;};
    };
  };
}
