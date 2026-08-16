{
  flake.modules.nixos.pi-server = {
    networking = {
      networkmanager.enable = false;
      useNetworkd = true;
      wireless.iwd = {
        enable = true;
        settings = {
          General.EnableNetworkConfiguration = false;
          Settings.AutoConnect = true;
        };
      };
    };

    services.resolved.enable = true;

    systemd.network.networks = {
      "10-ethernet" = {
        matchConfig.Name = "end0";
        networkConfig.DHCP = "yes";
      };
      "20-wifi" = {
        matchConfig.Name = "wlan0";
        address = [ "192.168.18.250/24" ];
        routes = [ { Gateway = "192.168.18.1"; } ];
        networkConfig.DNS = "192.168.18.1";
      };
    };

  };
}
