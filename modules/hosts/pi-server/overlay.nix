{
  flake.modules.nixos.pi-server = { inputs, ... }: {
    nixpkgs.overlays = [
      (
        final: prev:
        let
          regularPkgs = import inputs.nixos-raspberrypi.inputs.nixpkgs {
            system = final.stdenv.hostPlatform.system;
          };
        in
        {
          pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
            (_pythonFinal: pythonPrev: {
              # Avoid rebuilding matplotlib against Pi-specific FFmpeg.
              matplotlib = pythonPrev.matplotlib.override {
                ffmpeg-headless = regularPkgs.ffmpeg-headless;
              };
            })
          ];
        }
      )
    ];
  };
}
