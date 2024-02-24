{outputs, ...}: {
  nixpkgs.overlays = outputs.overlays.all;

  imports = [
    ./bootloader.nix
    ./disko.nix
    ./hardware.nix
    outputs.nixos
  ];
  os-modules = {
    gaming.enable = true;
  };

  networking.hostName = "home-desktop-asirois-nix";
  home-manager.users.alex = {
    imports = [outputs.home-manager];

    programs.git.userEmail = "alex007sirois@gmail.com";

    modules = {
      gaming.enable = true;
      torrent.enable = true;
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    home.stateVersion = "22.11";
  };
  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
