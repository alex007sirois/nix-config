{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    caprine-bin
  ];
}
