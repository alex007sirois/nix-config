{pkgs, ...}: {
  home.packages = with pkgs; [
    curl
    xh
  ];
}
