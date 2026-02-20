{ inputs, ... }:
{
  flake.modules.nixos.nix =
    {
      lib,
      config,
      ...
    }:
    {
      nix = {
        # This will add each specified flake input as a registry
        # To make nix3 commands consistent with your flake
        registry = lib.mapAttrs (_: value: { flake = value; }) { inherit (inputs) nixpkgs; };

        # This will additionally add your inputs to the system's legacy channels
        # Making legacy nix commands consistent as well, awesome!
        nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

        settings = {
          experimental-features = "nix-command flakes";
          auto-optimise-store = true;
        };
      };
    };
}
