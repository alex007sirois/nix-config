{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.torrent;
in {
  options.modules.torrent.enable = lib.mkEnableOption "Torrent";
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      fragments
    ];
  };
}
