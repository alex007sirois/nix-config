{
  flake.modules.homeManager.terminal =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        openssh
        ssh-copy-id
        ssh-tools
      ];
      programs.ssh = {
        enable = true;
        enableDefaultConfig = false;
        settings."*" = {
          IdentityFile = "~/.ssh/default_key";
          IdentitiesOnly = true;
          Compression = true;
          HashKnownHosts = true;
          ControlMaster = "auto";
          ControlPath = "~/.ssh/sockets/ssh-mux-%r@%h:%p.socket";
          ControlPersist = "30m";
          SetEnv.TERM = "xterm-256color";
        };
      };
    };
}
