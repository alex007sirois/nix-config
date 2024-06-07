{
  boot.loader = {
    systemd-boot.enable = true;
    grub.configurationLimit = 20;
    efi.canTouchEfiVariables = true;
  };
}
