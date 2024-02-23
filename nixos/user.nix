{pkgs, ...}: {
  users.users.alex = {
    initialHashedPassword = "$y$j9T$hjs9jLYBrMN6nXTIrrfqZ/$QusVq0iXY0wy9I/nlt1X/uNaW5JLdyS7mP0z1uG.8sA";
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
