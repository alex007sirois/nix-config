{ ... }: {
  imports = [
    ./modules/archive.nix
    ./modules/core.nix
    ./modules/disk.nix
    ./modules/docker.nix
    ./modules/download.nix
    ./modules/editors.nix
    ./modules/file-sync.nix
    ./modules/font.nix
    ./modules/fuzzy-find.nix
    ./modules/git.nix
    ./modules/http.nix
    ./modules/ip.nix
    ./modules/lister.nix
    ./modules/monitoring.nix
    ./modules/multiplexer.nix
    ./modules/nix.nix
    ./modules/pager.nix
    ./modules/python.nix
    ./modules/shell.nix
    ./modules/ssh.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
