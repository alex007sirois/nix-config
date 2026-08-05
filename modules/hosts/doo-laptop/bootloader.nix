{
  flake.modules.nixos.doo-laptop = {
    boot.loader = {
      systemd-boot.configurationLimit = 6;
      efi.efiSysMountPoint = "/boot/efi";
    };
  };
}
