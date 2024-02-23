{...}: {
  imports = [../modules];

  programs.git.userEmail = "alex007sirois@gmail.com";

  modules = {
    gaming.enable = true;
    torrent.enable = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
