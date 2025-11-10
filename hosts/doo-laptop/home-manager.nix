{
  config,
  outputs,
  ...
}: {
  home-manager.users.alex = {
    imports = [outputs.home-manager];

    programs.git.settings.user.email = "asirois@dimonoff.com";
    programs.ssh.includes = [
      config.age.secrets.ssh-config.path
    ];

    modules = {
      work.enable = true;
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    home.stateVersion = "22.11";
  };
}
