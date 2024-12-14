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
    home.packages = let
      retroarchCores = cores:
        with cores; [
          bsnes
          dolphin
          parallel-n64
        ];
      retroarch = pkgs.retroarch.withCores retroarchCores;
    in
      with pkgs; [
        cartridges
        heroic
        retroarch
      ];
  };
}
