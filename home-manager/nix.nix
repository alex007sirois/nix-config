{pkgs, ...}: {
  home.packages = with pkgs; [
    nh
    nix-output-monitor
    nvd
  ];
}
