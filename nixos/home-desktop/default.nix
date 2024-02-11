{overlays, ...}: {
  nixpkgs.overlays = overlays.all;

  imports = [
    ./bootloader.nix
    ./disko.nix
    ./hardware.nix
    ../modules/audio.nix
    ../modules/container.nix
    ../modules/desktop-environment.nix
    ../modules/direnv.nix
    ../modules/file-system.nix
    ../modules/flake-commands.nix
    ../modules/gaming.nix
    ../modules/garbage-collect.nix
    ../modules/home-manager.nix
    ../modules/localisation.nix
    ../modules/networking.nix
    ../modules/printer.nix
    ../modules/touchpad.nix
    ../modules/user.nix
    ../modules/virtualization.nix
  ];

  networking.hostName = "home-desktop-asirois-nix";
  home-manager.users.alex = import ../../home-manager/home-desktop;

  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
