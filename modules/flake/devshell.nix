{
  perSystem =
    {
      pkgs,
      config,
      ...
    }:
    {
      devShells.default =
        with pkgs;
        mkShell {
          packages = [
            config.agenix-rekey.package
            config.agenix-rekey.agePackage
            just
            nh
            gitlint
            lefthook
            nil
          ];
        };
    };
}
