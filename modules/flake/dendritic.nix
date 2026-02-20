{ inputs, ... }:
{
  flake-file.inputs.flake-file.url = "github:vic/flake-file";
  imports = with inputs.flake-file.flakeModules; [
    dendritic
  ];
}
