{
  flake.modules.nixos.work =
    { config, ... }:
    {
      # $VARs below are substituted by envsubst from this file.
      age.secrets.vpn-env.rekeyFile = ./vpn-env.age;
      age.secrets.vpn-office-ca.rekeyFile = ./vpn-office-ca.age;
      age.secrets.vpn-office-tls-auth.rekeyFile = ./vpn-office-tls-auth.age;

      networking.networkmanager.ensureProfiles = {
        environmentFiles = [ config.age.secrets.vpn-env.path ];

        profiles.office = {
          connection = {
            id = "office";
            uuid = "b721ee2b-d85a-40c8-8eac-d5724cc18bac";
            type = "vpn";
            autoconnect = false;
            permissions = "user:${config.user.username}:;";
          };

          vpn = {
            service-type = "org.freedesktop.NetworkManager.openvpn";
            connection-type = "password";
            remote = "$OFFICE_REMOTE";
            username = "$OFFICE_USERNAME";
            password-flags = 2; # never stored, always prompted
            auth = "SHA256";
            remote-cert-tls = "server";
            ca = config.age.secrets.vpn-office-ca.path;
            ta = config.age.secrets.vpn-office-tls-auth.path;
            ta-dir = 1;
          };
        };
      };
    };
}
