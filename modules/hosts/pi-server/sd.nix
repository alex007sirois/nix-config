{
  flake.modules.nixos.pi-server = {
    boot.tmp.useTmpfs = true;
    fileSystems."/".options = [ "noatime" ];
  };
}
