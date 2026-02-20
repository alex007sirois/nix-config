{
  flake.modules.nixos.work = {
    boot.binfmt.emulatedSystems = [ "armv7l-linux" ];
  };
}
