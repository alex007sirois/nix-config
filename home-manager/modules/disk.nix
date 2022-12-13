{pkgs, ...}: {
  home.packages = with pkgs; [
    dua
    duf
  ];
}
