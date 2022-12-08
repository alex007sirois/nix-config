{ pkgs
, ...
}: {
  users.users.alex = {
    isNormalUser = true;
    description = "Alex Sirois";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };
}
