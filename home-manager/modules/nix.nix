{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    nil
  ];
  programs.nix-index.enable = true;
}
