{pkgs, ...}: {
  users.users.alex = {
    isNormalUser = true;
    description = "Alex Sirois";
    extraGroups = [
      "audio"
      "dialout"
      "docker"
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;
}
