{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    teams-for-linux
  ];
}
