{
  flake.modules.homeManager.desktop =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        discord
        caprine-bin
      ];
    };
}
