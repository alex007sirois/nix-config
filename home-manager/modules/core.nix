{pkgs, ...}: {
  home.packages = with pkgs; [
    coreutils-full
    choose
    hyperfine
    ripgrep
    sad
    viddy
  ];
}
