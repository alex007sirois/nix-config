{
  flake.modules = {
    nixos.pi-server = { config, ... }: {
      services.openssh = {
        enable = true;
        openFirewall = true;
        settings = {
          PasswordAuthentication = false;
          KbdInteractiveAuthentication = false;
          PermitRootLogin = "no";
          AllowUsers = [ config.user.username ];
          MaxAuthTries = 3;
          PerSourcePenalties = "crash:3600s authfail:3600s max:86400s";
        };
      };
      users.users.${config.user.username}.openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH9G+O8bqyafFznDsDHnTc29v0kW+CvYzLtMlWpsEC44 alex007sirois@gmail.com"
      ];
    };
  };
}
