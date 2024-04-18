{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.gaming;
in {
  options.modules.gaming.enable = lib.mkEnableOption "Gaming";
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      cartridges
      heroic
      (retroarch.override {
        cores = with libretro; [
          bsnes
          dolphin
          parallel-n64
        ];
      })
    ];
  };
}
