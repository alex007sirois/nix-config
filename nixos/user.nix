{
  config,
  pkgs,
  ...
}: {
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
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;
}
