{inputs, ...}: {
  imports = [inputs.determinate.nixosModules.default];

  nix.settings.lazy-trees = true;
}
