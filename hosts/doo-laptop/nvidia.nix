{
  pkgs,
  lib,
  ...
}: let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
in {
  environment.systemPackages = [nvidia-offload];

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
