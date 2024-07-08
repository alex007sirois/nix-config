{pkgs, ...}: {
  home.packages = with pkgs; [
    blanket
    decibels
    ffmpeg_5-full
    gnome-podcasts
    spotify
  ];

  home.shellAliases = {
    ffplay = "ffplay -hide_banner -loglevel error -nodisp -autoexit";
  };
}
