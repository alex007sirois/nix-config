{...}: {
  imports = [
    ../modules/archive.nix
    ../modules/audio.nix
    ../modules/chat-personal.nix
    ../modules/clipboard.nix
    ../modules/core.nix
    ../modules/direnv.nix
    ../modules/disk.nix
    ../modules/docker.nix
    ../modules/download.nix
    ../modules/editors.nix
    ../modules/file-sync.nix
    ../modules/font.nix
    ../modules/fuzzy-find.nix
    ../modules/gaming.nix
    ../modules/git.nix
    ../modules/home-manager.nix
    ../modules/http.nix
    ../modules/icon.nix
    ../modules/ip.nix
    ../modules/lister.nix
    ../modules/monitoring.nix
    ../modules/nix.nix
    ../modules/pager.nix
    ../modules/shell.nix
    ../modules/ssh.nix
    ../modules/terminal.nix
    ../modules/torrent.nix
    ../modules/unfree.nix
    ../modules/vscode.nix
    ../modules/web-browser.nix
  ];

  home = {
    username = "alex";
    homeDirectory = "/home/alex";
  };

  programs.git = {
    userName = "Alex Sirois";
    userEmail = "alex007sirois@gmail.com";
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
