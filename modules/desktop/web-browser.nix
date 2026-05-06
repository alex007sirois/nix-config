{
  flake.modules.homeManager.desktop =
    { pkgs, config, ... }:
    {
      home.packages = with pkgs; [
        tangram
      ];

      programs.firefox = {
        enable = true;
        configPath = "${config.xdg.configHome}/mozilla/firefox";
      };
    };
}
