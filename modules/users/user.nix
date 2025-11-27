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
      inherit (config.user) username name groups;
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
    };
  };
}
