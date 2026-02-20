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
        matchBlocks."*" = {
          identityFile = "~/.ssh/default_key";
          identitiesOnly = true;
          compression = true;
          hashKnownHosts = true;
          controlMaster = "auto";
          controlPath = "~/.ssh/sockets/ssh-mux-%r@%h:%p.socket";
          controlPersist = "30m";
          setEnv.TERM = "xterm-256color";
        };
      };
    };
}
