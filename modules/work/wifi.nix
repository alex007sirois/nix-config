{
  flake.modules.nixos.work =
    { config, ... }:
    {
      # $VARs below are substituted by envsubst from this file.
      age.secrets.wifi-env.rekeyFile = ./wifi-env.age;

      networking.networkmanager.ensureProfiles = {
        environmentFiles = [ config.age.secrets.wifi-env.path ];

        profiles = {
          DimOnOff = {
            connection = {
              id = "DimOnOff";
              uuid = "d3e24449-6071-4da1-a0bf-1ca2c1b34912";
              type = "wifi";
            };
            wifi.ssid = "DimOnOff";
            wifi-security.key-mgmt = "wpa-eap";
            "802-1x" = {
              eap = "peap;";
              phase2-auth = "mschapv2";
              identity = "$DOO_WIFI_IDENTITY";
              password = "$DOO_WIFI_PASSWORD";
            };
          };

          Dimonoff-IoT = {
            connection = {
              id = "Dimonoff-IoT";
              uuid = "0b8e118a-f2d0-4a58-8952-b1468ec07cb1";
              type = "wifi";
            };
            wifi.ssid = "Dimonoff-IoT";
            wifi-security = {
              key-mgmt = "wpa-psk";
              psk = "$DOO_IOT_PSK";
            };
          };
        };
      };
    };
}
