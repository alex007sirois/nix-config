{...}: {
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
    userEmail = "alex007sirois@gmail.com";
  };
}
