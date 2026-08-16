{
  flake.modules.nixos.pi-server = {
    nixpkgs.overlays = [
      (
        _final: prev:
        let
          python313Packages = prev.python313Packages.overrideScope (
            _pyFinal: pyPrev: {
              # QEMU crashes while importing the cross-compiled extension modules.
              matplotlib = pyPrev.matplotlib.overridePythonAttrs {
                pythonImportsCheck = [ ];
              };
              pytest-regressions = pyPrev.pytest-regressions.overridePythonAttrs {
                doCheck = false;
              };
            }
          );
        in
        {
          inherit python313Packages;
          # Home Manager's YAML 1.1 serializer uses this alias.
          remarshal = python313Packages.remarshal;
          remarshal_0_17 = python313Packages.remarshal;
        }
      )
    ];
  };
}
