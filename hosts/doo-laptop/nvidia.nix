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
    open = true;

    prime = {
      sync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  specialisation.on-the-go.configuration = {
    system.nixos.tags = ["on-the-go"];
    services.xserver.videoDrivers = lib.mkForce ["displaylink" "modesetting" "nvidia"];
    hardware.nvidia = {
      powerManagement.finegrained = lib.mkForce true;
      prime = {
        offload.enable = lib.mkForce true;
        sync.enable = lib.mkForce false;
      };
    };
  };

  hardware.graphics.enable = true;
}
