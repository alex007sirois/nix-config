{pkgs, ...}: {
  home.packages = with pkgs; [
    coreutils-full
    choose
    hyperfine
    sad
    viddy
  ];

  programs.ripgrep.enable = true;
}
