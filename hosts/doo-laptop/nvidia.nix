{
  pkgs,
  lib,
  ...
}: {
  services.xserver.displayManager.sessionCommands = ''
    ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource 2 0
  '';

  services.xserver.videoDrivers = ["displaylink" "nvidia"];
  hardware.nvidia = {
    open = false;
    powerManagement.finegrained = true;

    prime = {
      offload.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  specialisation = {
    external-display.configuration = {
      system.nixos.tags = ["external-display"];
      hardware.nvidia = {
        powerManagement.finegrained = lib.mkForce false;
        prime = {
          offload.enable = lib.mkForce false;
          sync.enable = true;
        };
      };
    };
  };

  hardware.graphics.enable = true;
  nixpkgs.config.allowUnfree = true;
}
