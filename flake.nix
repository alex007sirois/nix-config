# DO-NOT-EDIT. This file was auto-generated using github:vic/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

  inputs = {
    agenix = {
      inputs = {
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:ryantm/agenix";
    };
    agenix-rekey = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:oddlama/agenix-rekey";
    };
    disko = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/disko";
    };
    flake-file.url = "github:vic/flake-file";
    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs-lib";
      url = "github:hercules-ci/flake-parts";
    };
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    import-tree.url = "github:vic/import-tree";
    nix-index-database = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:Mic92/nix-index-database";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-lib.follows = "nixpkgs";
    stylix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/stylix";
    };
    systems.url = "github:nix-systems/default";
    tactical-rmm = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "git+https://bitbucket.org/amotus/tactical-rmm-nix.git";
    };
  };

}
