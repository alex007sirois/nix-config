{ ... }: {
  imports = [
    ./common-cli.nix
    ./common-gui.nix
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
