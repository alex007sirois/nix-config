{
  flake.modules.homeManager.torrent = {pkgs, ...}: {
    home.packages = with pkgs; [
      fragments
    ];
  };
}
