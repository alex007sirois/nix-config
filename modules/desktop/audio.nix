{
  flake.modules.homeManager.desktop = {pkgs, ...}: {
    home.packages = with pkgs; [
      blanket
      decibels
      ffmpeg-full
      gnome-podcasts
      spotify
    ];

    home.shellAliases = {
      ffplay = "ffplay -hide_banner -loglevel error -nodisp -autoexit";
    };
  };
}
