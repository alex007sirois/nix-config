{
  flake.modules.homeManager.work =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        teams-for-linux
      ];
      xdg.desktopEntries = {
        teams-dimonoff = {
          name = "Teams Vectanor";
          icon = "teams-for-linux";
          exec = "teams-for-linux --user-data-dir=/home/alex/.config/teams-vectanor";
          terminal = false;
        };
        teams-stelpro = {
          name = "Teams Stelpro";
          icon = "teams-for-linux";
          exec = "teams-for-linux --user-data-dir=/home/alex/.config/teams-stelpro";
          terminal = false;
        };
      };
    };
}
