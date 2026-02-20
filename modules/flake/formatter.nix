{
  perSystem =
    { pkgs, ... }:
    {
      formatter.default = pkgs.nixfmt-tree;
    };
}
