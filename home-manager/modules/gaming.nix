{pkgs, ...}: {
  home.packages = with pkgs; [
    cartridges
    heroic
    retroarch
  ];
}
