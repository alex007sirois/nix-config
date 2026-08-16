{
  flake.modules.nixos.pi-server = {
    nixpkgs.flake = {
      setFlakeRegistry = false;
      setNixPath = false;
    };
  };
}
