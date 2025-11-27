{
  flake.modules.homeManager.work = {config, ...}: {
    age.secrets = {
      ssh-config.rekeyFile = ./ssh-config.age;
    };
    programs.ssh.includes = [
      config.age.secrets.ssh-config.path
    ];
  };
}
