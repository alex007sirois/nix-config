{
  flake.modules.nixos.work = {
    networking.extraHosts = ''
      192.168.103.235   intranet.dimonoff.com
    '';
    virtualisation.docker.daemon.settings = {
      insecure-registries = [ "intranet.dimonoff.com:5000" ];
    };
  };
}
