{ ... }: {
  imports = [
    ./modules/terminal.nix
    ./modules/vscode.nix
  ];

  home = {
    username = "alex";
    homeDirectory = "/home/alex";
  };

  programs.git = {
    userName = "Alex Sirois";
    userEmail = "asirois@dimonoff.com";
  };
}
