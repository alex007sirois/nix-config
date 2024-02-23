{disko, ...}: {
  imports = [
    disko.nixosModules.disko
    ./disko-config.nix
  ];
}
