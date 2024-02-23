{pkgs, ...}: {
  home.packages = with pkgs; [
    tangram
  ];

  programs.firefox = {
    enable = true;
  };
}
