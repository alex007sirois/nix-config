{pkgs, ...}: {
  home.packages = with pkgs; [
    choose
    coreutils-full
    hyperfine
    rnr
    sd
    viddy
  ];

  programs.ripgrep.enable = true;
}
