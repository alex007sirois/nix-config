{
  flake.modules.nixos.work = { lib, pkgs, ... }: {
    services.xserver.displayManager.sessionCommands = ''
      ${lib.getBin pkgs.xrandr}/bin/xrandr --setprovideroutputsource 2 0
    '';
    services.xserver.videoDrivers = [
      "displaylink"
      "modesetting"
      "fbdev"
    ];
    environment.systemPackages = with pkgs; [
      displaylink
    ];
  };
}
