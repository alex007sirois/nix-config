{
  home-manager,
  home-manager-special-args,
  ...
}: {
  imports = [home-manager.nixosModules.home-manager];
  home-manager = {
    extraSpecialArgs = home-manager-special-args;
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hmbkp";
  };
}
