{outputs, ...}: {
  home-manager.users.alex = {
    imports = [outputs.home-manager];

    programs.git.userEmail = "alex007sirois@gmail.com";

    programs.ssh.matchBlocks = {
      "github.com".identityFile = "~/.ssh/git_key";
    };

    modules = {
      gaming.enable = true;
      torrent.enable = true;
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    home.stateVersion = "22.11";
  };
}
