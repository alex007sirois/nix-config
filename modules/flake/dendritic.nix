{ inputs, ... }:
{
  flake-file.inputs.flake-file.url = "github:denful/flake-file";
  imports = with inputs.flake-file.flakeModules; [
    dendritic
  ];
}
