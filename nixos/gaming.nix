{
  lib,
  config,
  ...
}: let
  cfg = config.os-modules.gaming;
in {
  options.os-modules.gaming.enable = lib.mkEnableOption "Gaming";
  config = lib.mkIf cfg.enable {
    hardware.xone.enable = true;
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
  };
}
