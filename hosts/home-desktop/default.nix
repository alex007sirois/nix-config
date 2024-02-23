{overlays, ...}: {
  nixpkgs.overlays = overlays.all;

  imports = [
    ./bootloader.nix
    ./disko.nix
    ./hardware.nix
    ../../nixos/audio.nix
    ../../nixos/bluetooth.nix
    ../../nixos/container.nix
    ../../nixos/desktop-environment.nix
    ../../nixos/direnv.nix
    ../../nixos/file-system.nix
    ../../nixos/flake-commands.nix
    ../../nixos/gaming.nix
    ../../nixos/garbage-collect.nix
    ../../nixos/home-manager.nix
    ../../nixos/localisation.nix
    ../../nixos/networking.nix
    ../../nixos/printer.nix
    ../../nixos/touchpad.nix
    ../../nixos/user.nix
    ../../nixos/virtualization.nix
  ];

  networking.hostName = "home-desktop-asirois-nix";
  home-manager.users.alex = {
    imports = [../../home-manager];

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
