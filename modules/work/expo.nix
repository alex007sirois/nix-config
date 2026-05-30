{
  flake.modules.nixos.work = {
    networking.firewall.allowedTCPPorts = [
      8015
      9090
    ];
  };
}
