{pkgs, ...}: {
  home.packages = with pkgs; [
    todoist-electron
    gnome-solanum
  ];
}
