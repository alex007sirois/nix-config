{pkgs, ...}: {
  home.packages = with pkgs; [
    tangram
  ];

  stylix.targets.firefox.profileNames = ["default"];
  programs.firefox = {
    enable = true;
  };
}
