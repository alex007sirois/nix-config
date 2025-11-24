{
  flake.modules.homeManager.work = {config, ...}: {
    programs.ssh.includes = [
      config.age.secrets.ssh-config.path
    ];
  };
}
