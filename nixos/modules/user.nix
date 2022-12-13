{pkgs, ...}: {
  users.users.alex = {
    isNormalUser = true;
    description = "Alex Sirois";
    extraGroups = [
      "audio"
      "docker"
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
}
