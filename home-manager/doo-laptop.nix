{ ... }: {
  imports = [
    ./modules/chat.nix
    ./modules/terminal.nix
    ./modules/vscode.nix
    ./modules/web-browser.nix
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
