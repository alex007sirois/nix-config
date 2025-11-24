{inputs, ...}: {
  flake-file.inputs.home-manager.url = "github:nix-community/home-manager";
  flake.modules = {
    nixos.home = {
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];

      home-manager = {
        useGlobalPkgs = true;
        extraSpecialArgs.hasGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "hmbkp";
      };
    };
    homeManager.base = {
      programs.home-manager.enable = true;
      systemd.user.startServices = "sd-switch";
      services = {
        home-manager.autoExpire = {
          enable = true;
          frequency = "weekly";
          store.cleanup = true;
        };
      };
    };
  };
}
