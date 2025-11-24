{
  flake.modules.homeManager.terminal = {pkgs, ...}: {
    home.packages = with pkgs; [
      dua
      duf
    ];
  };
}
