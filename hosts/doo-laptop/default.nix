{overlays, ...}: {
  nixpkgs.overlays = overlays.all;

  imports = [
    ./bootloader.nix
    ./fundamentum-hosts.nix
    ./hardware.nix
    ./nvidia.nix
    ../../nixos
  ];

  networking.hostName = "laptop-doo-asirois-nix";
  home-manager.users.alex = {
    imports = [../../home-manager];

    programs.git.userEmail = "asirois@dimonoff.com";

    modules = {
      work.enable = true;
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
  system.stateVersion = "22.11"; # Did you read the comment?
}
