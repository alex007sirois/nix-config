{
  flake.modules.nixos.system =
    { config, lib, ... }:
    let
      inherit (lib)
        mkEnableOption
        mkIf
        mkOption
        types
        ;
      cfg = config.swap;
    in
    {
      options.swap = {
        enable = mkEnableOption "a swap file with zswap compression";
        sizeGiB = mkOption {
          type = types.ints.positive;
          description = "Size of the swap file in GiB. Must be set when swap is enabled.";
        };
      };

      config = mkIf cfg.enable {
        boot.kernelParams = [
          "zswap.enabled=1"
          "zswap.compressor=zstd"
          "zswap.zpool=zsmalloc"
          "zswap.max_pool_percent=25"
        ];

        swapDevices = [
          {
            device = "/swapfile";
            size = cfg.sizeGiB * 1024;
          }
        ];
      };
    };
}
