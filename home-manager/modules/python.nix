{pkgs, ...}: let
  python-lsp-packages = ps:
    with ps; [
      pylsp-mypy
      pylsp-rope
      python-lsp-server
      python-lsp-ruff
    ];
in {
  home.packages = with pkgs; [
    (python311.withPackages python-lsp-packages)
    black
    ruff
  ];
}
