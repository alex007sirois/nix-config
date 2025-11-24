{
  flake.modules.homeManager.desktop = {pkgs, ...}: {
    home.packages = with pkgs; [
      todoist-electron
      gnome-solanum
    ];
  };
}
