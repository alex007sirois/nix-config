{pkgs, ...}: {
  home.packages = with pkgs; [
    coreutils-full
    choose
    hyperfine
    sd
    viddy
  ];

  programs.ripgrep.enable = true;
}
