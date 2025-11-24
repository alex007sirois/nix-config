{
  flake.modules = {
    homeManager.users = {
      home = {
        username = "alex";
        homeDirectory = "/home/alex";
      };
    };
    nixos.users = {config, ...}: {
      users.users.alex = {
        hashedPasswordFile = config.age.secrets.linux-password.path;
        isNormalUser = true;
        description = "Alex Sirois";
        extraGroups = [
          "dialout"
          "docker"
          "networkmanager"
          "wheel"
        ];
      };
    };
  };
}
