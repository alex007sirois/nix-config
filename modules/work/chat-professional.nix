{
  flake.modules.homeManager.work =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        teams-for-linux
      ];
      xdg.desktopEntries = {
        teams-dimonoff = {
          name = "Teams Dimonoff";
          icon = "teams-for-linux";
          exec = "teams-for-linux --user-data-dir==/home/alex/.config/teams-dimonoff";
          terminal = false;
        };
        teams-stelpro = {
          name = "Teams Stelpro";
          icon = "teams-for-linux";
          exec = "teams-for-linux --user-data-dir==/home/alex/.config/teams-stelpro";
          terminal = false;
        };
      };
    };
}
