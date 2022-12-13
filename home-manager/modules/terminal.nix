{pkgs, ...}: {
  home.packages = with pkgs; [
    pantheon.elementary-terminal
  ];
}
