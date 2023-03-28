{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    comma
  ];
  programs.nix-index.enable = true;
}
