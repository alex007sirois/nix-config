{pkgs, ...}: let
  extensions-paths = [
    ./vscode-extensions/code.nix
    ./vscode-extensions/config.nix
    ./vscode-extensions/document.nix
    ./vscode-extensions/marketplace.nix
    ./vscode-extensions/nix.nix
    ./vscode-extensions/python.nix
    ./vscode-extensions/shell.nix
    ./vscode-extensions/theme.nix
  ];
  extension-loader = extensions-path: (import extensions-path) {inherit pkgs;};
  extensions = builtins.concatMap extension-loader extensions-paths;
in {
  stylix.targets.vscode.enable = false;
  programs.vscode = {
    enable = true;
    extensions = extensions;
  };
}
