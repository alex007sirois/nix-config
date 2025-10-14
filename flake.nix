{
  description = "Nix home-manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    helix.url = "github:helix-editor/helix";
    helix.inputs.nixpkgs.follows = "nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-index-database,
    disko,
    stylix,
    helix,
    flake-utils,
    ...
  } @ inputs: let
    inherit (nixpkgs) lib;
    inherit (self) outputs;
    home-manager-special-args = {inherit nix-index-database outputs;};
    nixos-special-args = {inherit inputs stylix disko home-manager home-manager-special-args outputs;};
    buildNixosSystem = machine:
      nixpkgs.lib.nixosSystem {
        specialArgs = nixos-special-args;
        modules = [machine];
      };
    buildNixosSystems = builtins.mapAttrs (_hostname: machine: buildNixosSystem machine);
    buildFlake = system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          just
          nh
          gitlint
          lefthook
          nil
        ];
      };
    };
    systemFlake = flake-utils.lib.eachDefaultSystem buildFlake;
  in
    systemFlake
    // {
      overlays = import ./overlays {
        inherit (outputs) lib;
        inherit helix;
      };
      nixos = import ./nixos;
      home-manager = import ./home-manager;
      lib = import ./lib {inherit lib;};

      nixosConfigurations = buildNixosSystems {
        "laptop-doo-asirois-nix" = ./hosts/doo-laptop;
        "home-desktop-asirois-nix" = ./hosts/home-desktop;
      };

      templates = {
        default = {
          path = ./templates/flake;
          description = "Basic flake direnv template.";
        };
      };
    };
}
