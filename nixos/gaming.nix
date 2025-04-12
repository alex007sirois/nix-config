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
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
}
