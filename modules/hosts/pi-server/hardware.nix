{
  flake.modules.nixos.pi-server =
    { inputs }:
    {
      imports = with inputs.nixos-raspberrypi.nixosModules; [
        raspberry-pi-4.base
      ];
    };
}
