{inputs, ...}: {
  flake-file.inputs.home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.modules = {
    homeManager.home = {
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
  };
}
