{
  flake.modules.nixos.work = {
    networking.firewall.allowedTCPPorts = [ 8081 ];
  };
}
