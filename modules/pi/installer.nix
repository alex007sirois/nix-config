{ inputs, ... }:
{
  perSystem =
    let
      pi4Installer = inputs.nixos-raspberrypi.nixosConfigurations.rpi4-installer.extendModules {
        modules = [
          ({ lib, ... }: {
            users.users.nixos.initialHashedPassword = lib.mkForce null;
            users.users.nixos.hashedPassword = "$y$j9T$ptTEb8bIQPfcXHwlUBQRn.$neK.oniEUyp0C/qdgVHTgYvqI7YtuC3EclZMmXmM1y9";
            users.users.root.initialHashedPassword = lib.mkForce null;
            users.users.root.hashedPassword = "$y$j9T$ptTEb8bIQPfcXHwlUBQRn.$neK.oniEUyp0C/qdgVHTgYvqI7YtuC3EclZMmXmM1y9";
          })
        ];
      };
    in
    {
      packages.pi4-installer = pi4Installer.config.system.build.sdImage;
    };
}
