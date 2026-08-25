{
  flake.modules.nixos.doo-laptop = {
    boot.loader = {
      systemd-boot.configurationLimit = 2;
      efi.efiSysMountPoint = "/boot/efi";
    };
  };
}
