{
  flake.modules = {
    nixos.automation = {
      networking.firewall.allowedTCPPorts = [ 8123 ];
      virtualisation.oci-containers.containers = {
        homeassistant = {
          image = "ghcr.io/home-assistant/home-assistant:2026.9";
          pull = "newer";
          volumes = [ "home-assistant:/config" ];
          environment.TZ = "America/Montreal";
          devices = [ "/dev/ttyACM0:/dev/ttyACM0" ];
          extraOptions = [ "--network=host" ];
        };
      };
    };
  };
}
