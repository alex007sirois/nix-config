{
  flake.modules = {
    homeManager.gaming = {pkgs, ...}: {
      home.packages = let
        retroarchCores = cores:
          with cores; [
            bsnes
            dolphin
            # FIXME parallel-n64
          ];
        retroarch = pkgs.retroarch.withCores retroarchCores;
      in
        with pkgs; [
          cartridges
          heroic
          retroarch
        ];
    };
    nixos.gaming = {
      hardware.xone.enable = true;
      programs = {
        gamemode.enable = true;
      };
    };
  };
}
