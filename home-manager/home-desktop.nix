{ ... }: {
  imports = [
    ./common-cli.nix
  ];

  targets.genericLinux.enable = true;

  home = {
    username = "alex";
    homeDirectory = "/home/alex";
  };

  programs.git = {
    userName = "Alex Sirois";
    userEmail = "alex007sirois@gmail.com";
  };
}
