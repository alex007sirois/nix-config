{pkgs, ...}: {
  home.packages = with pkgs; [
    ffmpeg_5-full
    spotify
  ];

  home.shellAliases = {
    ffplay = "ffplay -hide_banner -loglevel error -nodisp -autoexit";
  };
}
