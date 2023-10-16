{pkgs, ...}: {
  users.users.alex = {
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
