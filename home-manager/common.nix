{ ... }: {
  imports = [
    ./modules/editors.nix
    ./modules/exa.nix
    ./modules/fzf.nix
    ./modules/git.nix
    ./modules/nix.nix
    ./modules/python.nix
    ./modules/shell.nix
    ./modules/ssh.nix
    ./modules/tools.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  programs.home-manager.enable = true;
  targets.genericLinux.enable = true;
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
