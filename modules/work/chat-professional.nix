{
  flake.modules.homeManager.work = {pkgs, ...}: {
    home.packages = with pkgs; [
      teams-for-linux
    ];
  };
}
