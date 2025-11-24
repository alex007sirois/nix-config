{
  flake.modules.nixos.doo-laptop = {
    boot.loader.efi.efiSysMountPoint = "/boot/efi";
  };
}
