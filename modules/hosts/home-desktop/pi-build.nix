{
  flake.modules.nixos.home-desktop = {
    boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  };
}
