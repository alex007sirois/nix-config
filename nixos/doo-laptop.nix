{pkgs, ...}: {
  imports = [
    ./modules/audio.nix
    ./modules/bootloader.nix
    ./modules/container.nix
    ./modules/desktop-environment.nix
    ./modules/flake-commands.nix
    ./modules/localisation.nix
    ./modules/networking.nix
    ./modules/nvidia.nix
    ./modules/printer.nix
    ./modules/user.nix
    ./hardware/doo-laptop.nix
  ];

  networking.hostName = "laptop-doo-asirois-nix";

  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
