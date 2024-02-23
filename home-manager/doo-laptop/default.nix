{...}: {
  imports = [../modules];

  programs.git.userEmail = "asirois@dimonoff.com";

  modules = {
    work.enable = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
