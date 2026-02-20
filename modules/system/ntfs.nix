{
  flake.modules.nixos.system = {
    boot.supportedFilesystems = [ "ntfs" ];
  };
}
