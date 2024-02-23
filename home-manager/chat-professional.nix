{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.work;
in {
  options.modules.work.enable = lib.mkEnableOption "Work";
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      teams-for-linux
    ];
  };
}
