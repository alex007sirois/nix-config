{
  flake.modules.nixos.pi-server =
    { lib, inputs, ... }:
    {
      imports = with inputs.nixos-raspberrypi.nixosModules; [
        raspberry-pi-4.base
        raspberry-pi-4.display-vc4
        raspberry-pi-4.bluetooth
      ];
      boot.supportedFilesystems.zfs = lib.mkForce false;
    };
}
